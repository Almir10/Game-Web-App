package Servlets;


import Beans.Games;
import Beans.Kart;
import Beans.Narudzbe;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Beans.Users;

import static Servlets.CartDAO.getCartItems;


public class NarudzbeDAO {

    // Ovde ide kod za postavljanje veze s bazom podataka
    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopdb", "root", "almir12345");
    }

    // Funkcija za unos narudžbe u bazu
    public static int sacuvajNarudzbu(Narudzbe narudzba) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int generatedOrderId = -1;

        try {
            // Otvori vezu s bazom podataka
            connection = getConnection();

            // SQL upit za unos narudžbe
            String sql = "INSERT INTO narudzbe (id, datumNarudzbe, status) VALUES (?, CURRENT_TIMESTAMP, ?)";

            // Kreiraj PreparedStatement objekat
            preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, narudzba.getUserId());
            preparedStatement.setString(2, narudzba.getStatus());

            // Izvrši SQL upit
            int affectedRows = preparedStatement.executeUpdate();

            // Proveri da li je upit uspeo
            if (affectedRows > 0) {
                // Dohvati generisani ID narudžbe
                resultSet = preparedStatement.getGeneratedKeys();
                if (resultSet.next()) {
                    generatedOrderId = resultSet.getInt(1);
                }

                // Sada treba uneti stavke narudžbe u tabelu stavki
                if (generatedOrderId != -1) {
                    // Ovde biste trebali implementirati kod za unos stavki narudžbe u bazu
                    // To zavisi od vaše baze podataka i šeme tabela
                    // Mogli biste koristiti još jedan SQL upit ili spremiti stavke u zasebnu tabelu
                    // i povezati ih sa glavnom narudžbom preko generisanog ID-a
                    // ...
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Obradi grešku
        } finally {
            // Zatvori resurse (ResultSet, PreparedStatement, Connection)
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return generatedOrderId;
    }


    public static void dodajStavkuUNarudzbu(int userId, int gameId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopdb", "root", "almir12345")) {
            String query = "INSERT INTO narudzba (userId, gameId) VALUES (?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userId);
                statement.setInt(2, gameId);

                statement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to the database:");
            e.printStackTrace();
            // Handle the exception according to your application's requirements
        }
    }

    private static final String DB_URL = "jdbc:mysql://localhost:3306/gameshopdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "almir12345";

    public static void prebaciUKorpu(int userId) {
        System.out.println("Funkcija je pozvana");
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Get cart items
            List<Kart> cartItems = getCartItems(userId);

            // Check if there are items in the cart
            if (cartItems != null && !cartItems.isEmpty()) {
                // Insert into narudzba table
                String insertNarudzbaQuery = "INSERT INTO narudzba (userId, cijenaNarudzbe, datumNarudzbe, statusNarudzbe) VALUES (?, ?, ?, ?)";
                try (PreparedStatement insertNarudzbaStatement = connection.prepareStatement(insertNarudzbaQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                    float totalCost = 0;
                    // Use a loop to insert each item from the cart
                    for (Kart cartItem : cartItems) {
                        totalCost += cartItem.getGamePrice(); // Summing up the prices
                    }
                    insertNarudzbaStatement.setInt(1, userId);
                    insertNarudzbaStatement.setFloat(2, totalCost);
                    insertNarudzbaStatement.setDate(3, new java.sql.Date(System.currentTimeMillis())); // Set current date
                    insertNarudzbaStatement.setString(4, "Cekanje na odobrenje"); // Set status

                    // Execute the query and get the generated keys (narudzbaId)
                    int narudzbaId;
                    int affectedRows = insertNarudzbaStatement.executeUpdate();
                    if (affectedRows > 0) {
                        try (ResultSet generatedKeys = insertNarudzbaStatement.getGeneratedKeys()) {
                            if (generatedKeys.next()) {
                                narudzbaId = generatedKeys.getInt(1);
                                // Now, insert into narudzba_stavke table
                                String insertStavkeQuery = "INSERT INTO narudzba_stavke (narudzbaId, gameId, cijenaStavke) VALUES (?, ?, ?)";
                                try (PreparedStatement insertStavkeStatement = connection.prepareStatement(insertStavkeQuery)) {
                                    // Use a loop to insert each item from the cart
                                    for (Kart cartItem : cartItems) {
                                        insertStavkeStatement.setInt(1, narudzbaId);
                                        insertStavkeStatement.setInt(2, cartItem.getGameId());
                                        insertStavkeStatement.setFloat(3, cartItem.getGamePrice());
                                        insertStavkeStatement.addBatch();
                                    }
                                    insertStavkeStatement.executeBatch();
                                }
                            } else {
                                System.out.println("Failed to retrieve narudzbaId.");
                            }
                        }
                    } else {
                        System.out.println("Failed to insert into narudzba table.");
                    }
                }
            } else {
                System.out.println("Cart is empty.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception according to your application's requirements
        }
    }}


