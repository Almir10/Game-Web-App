package Servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Enumeration;

import Beans.Users;


@WebServlet(name = "Login",urlPatterns = {"/Login"})

public class Login extends HttpServlet{
        public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
                res.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = res.getWriter()) {
                        String usernamex = req.getParameter("username");
                        String passwordx = req.getParameter("password");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ucenje", "root", "almir12345");
                        //Statement statement = connection.createStatement();
                        System.out.println("Povezano");
                        String sql = "SELECT * FROM tabela WHERE username=? AND password=?";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setString(1, usernamex);
                        statement.setString(2, passwordx);

                        ResultSet result = statement.executeQuery();

                        if (result.next()) {
                                // Korisnički podaci su tačni, korisnik je uspešno prijavljen
                                HttpSession session = req.getSession();
                                session.setAttribute("id", result.getInt("id"));
                                session.setAttribute("username", result.getString("username"));

                                // Redirect to a welcome page or display a message
                                res.sendRedirect("Games");
                                System.out.println("Uspešna prijava!");

                        } else {
                                // Pogrešni korisnički podaci
                                out.println("Pogrešno korisničko ime ili lozinka!");
                        }

                }
                catch(SQLException e){
                        System.err.println("Error connecting to the database:");
                        e.printStackTrace();
                }

        }
}





