package Servlets;

import Beans.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/baza";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "orhan123";

    public List<Users> getAllUsers() {
        List<Users> userList = new ArrayList<>();
        Connection connection = null;

        try {
            System.out.println("Attempting to connect to the database...");
            // Establishing the database connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            System.out.println("Connected to the database!");

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM tabela");

            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String mail = resultSet.getString("mail");
                String role = resultSet.getString("role");
                String password = resultSet.getString("password");

                Users user = new Users(username, mail, role, password);
                userList.add(user);
            }

            // Closing resources
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            System.err.println("Error connecting to the database:");
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                    System.out.println("Connection closed.");
                }
            } catch (SQLException e) {
                System.err.println("Error closing the database connection:");
                e.printStackTrace();
            }
        }

        return userList;
    }
}
