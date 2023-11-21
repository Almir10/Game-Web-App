package Servlets;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Beans.Orders;

public class CartDAO {

    public static List<Orders> getCartItems(String userId) {
        List<Orders> cartItems = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB", "root", "adis1")) {
            System.out.println("Successfully connected to the database");
            String query = "select o.id, o.userId, g.title from orders o\n" +
                            "join games g on o.gameId = g.id\n" +
                            "where o.userId=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, userId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Orders cartItem = new Orders();
                        cartItem.setId(resultSet.getInt("id"));
                        cartItem.setUserId(resultSet.getString("userId"));
                        cartItem.setGameTitle(resultSet.getString("title"));
                        cartItems.add(cartItem);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to the database:");
            e.printStackTrace();
            // Handle the exception according to your application's requirements
        }

        return cartItems;
    }

    public static void addToCart(Integer userId, String gameId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB", "root", "adis1")) {
            String query = "INSERT INTO orders (userId, gameId) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, Integer.parseInt(gameId));
                preparedStatement.executeUpdate();
                System.out.println("Dodano");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public static void removeFromCart(String orderId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopdb", "root", "orhan123")) {
            String query = "DELETE FROM orders WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, orderId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }
}
