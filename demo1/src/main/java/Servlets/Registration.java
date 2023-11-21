package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import Beans.Users;

@WebServlet(name = "Registration",urlPatterns = {"/Registration"})

public class Registration extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Preuzimanje parametara iz zahteva
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            if (!password.equals(confirmPassword)) {
                out.println("Lozinke se ne podudaraju. Molimo vas unesite istu lozinku u oba polja.");
                return; // Prekid registracije ako lozinke nisu iste
            }

            // Povezivanje na bazu podataka
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ucenje", "root", "almir12345")) {
                // Provera da li korisnik već postoji u bazi podataka
                String checkUserQuery = "SELECT * FROM tabela WHERE username=?";
                try (PreparedStatement checkUserStatement = connection.prepareStatement(checkUserQuery)) {
                    checkUserStatement.setString(1, username);


                    try (var result = checkUserStatement.executeQuery()) {
                        if (result.next()) {
                            // Korisnik već postoji, ispišite poruku
                            out.println("Korisničko ime već postoji. Molimo vas da izaberete drugo korisničko ime.");
                        } else {
                            // Ako korisnik ne postoji, dodajte ga u bazu podataka
                            String insertUserQuery = "INSERT INTO users (mail, username, password, role) VALUES (?, ?, ?, 'user')";
                            try (PreparedStatement insertUserStatement = connection.prepareStatement(insertUserQuery)) {
                                insertUserStatement.setString(1, email);
                                insertUserStatement.setString(2, username);
                                insertUserStatement.setString(3, password);

                                // Izvršavanje upita za dodavanje korisnika
                                int rowsAffected = insertUserStatement.executeUpdate();

                                if (rowsAffected > 0) {
                                    // Korisnik je uspešno registrovan
                                    out.println("Uspešna registracija! Sada se možete prijaviti.");
                                } else {
                                    // Nešto je pošlo po zlu pri dodavanju korisnika
                                    out.println("Došlo je do greške prilikom registracije. Molimo vas pokušajte ponovo.");
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error connecting to the database:");
            e.printStackTrace();
        }

    }}

