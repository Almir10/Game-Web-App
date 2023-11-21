package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AddGameServlet", urlPatterns = {"/AddGameServlet"})
public class AddGameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        String title = request.getParameter("gameTitle");
        String priceParam = request.getParameter("gamePrice");
        String logo = request.getParameter("gameLogo");
        System.out.println("Received parameters - title: " + title + ", gamePrice: " + priceParam + ", logo: " +logo);
        if (priceParam != null && !priceParam.isEmpty()) {
            try {
                double price = Double.parseDouble(priceParam);

                // Add other form parameters as needed

                // Perform the database operation to add the game
                try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB", "root", "orhan123")) {
                    String sql = "INSERT INTO games (title, price, logo) VALUES (?, ?, ?)";
                    // Adjust the SQL statement based on your database schema and attributes

                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setString(1, title);
                        statement.setDouble(2, price);
                        statement.setString(3,logo);
                        // Set other parameters as needed

                        int rowsAffected = statement.executeUpdate();

                        if (rowsAffected > 0) {
                            // Game added successfully
                            response.sendRedirect("adminAddGame.jsp"); // Redirect to adminAddGame.jsp or another page
                        } else {
                            // Handle the case when no rows were affected
                            response.getWriter().println("Failed to add the game.");
                        }
                    }
                } catch (SQLException e) {
                    // Handle any SQL errors
                    e.printStackTrace();
                    response.getWriter().println("Error connecting to the database.");
                }
            } catch (NumberFormatException e) {
                // Handle the case when the "price" parameter is not a valid double
                response.getWriter().println("Invalid price format.");
            }
        } else {
            // Handle the case when the "price" parameter is not provided
            response.getWriter().println("Price parameter is required.");
            response.getWriter().println("Or logo error");
        }
    }
}
