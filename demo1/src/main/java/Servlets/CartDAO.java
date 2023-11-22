package Servlets;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Beans.Kart;

public class CartDAO {

    public static List<Kart> getCartItems(Integer userId) {
        List<Kart> cartItems = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB", "root", "almir12345")) {
            String query = "select o.id as id , o.userId as userId, g.title as title, g.price as price, o.gameId as gameId from cart as o " +
                    "                            join games as g on o.gameId = g.id " +
                    "                            where o.userId=?;";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Kart cartItem = new Kart();
                        cartItem.setId(resultSet.getInt("id"));
                        cartItem.setUserId(resultSet.getInt("userId"));
                        cartItem.setGameTitle(resultSet.getString("title"));
                        cartItem.setGamePrice(resultSet.getFloat("price"));
                        cartItem.setGameId(resultSet.getInt("gameId"));
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
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopdb", "root", "almir12345")) {
            String query = "INSERT INTO cart (userId, gameId) VALUES (?, ?)";
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
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopdb", "root", "almir12345")) {
            String query = "DELETE FROM cart WHERE id = ?";
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
