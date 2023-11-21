package Servlets;

import Beans.Games;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DeleteGame", urlPatterns = {"/DeleteGame"})
public class DeleteGameServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the game ID from the request
        String gameId = request.getParameter("gameId");

        if (gameId != null && !gameId.isEmpty()) {
            try {
                int gameIdInt = Integer.parseInt(gameId);

                // Connect to your database (replace these with your database details)
                String jdbcUrl = "jdbc:mysql://localhost:3306/gameshopDB";
                String dbUser = "root";
                String dbPassword = "adis1";

                try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
                    // Prepare the SQL statement to delete the game
                    String sql = "DELETE FROM games WHERE id = ?";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                        preparedStatement.setInt(1, gameIdInt);

                        // Execute the delete statement
                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            // Game successfully deleted from the database
                            // Now update the list of games in the servlet context if needed

                            // Redirect to the Games page
                            response.sendRedirect("Games");
                        } else {
                            // Handle the case when the game with the specified ID is not found in the database
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Game not found.");
                        }
                    }
                } catch (SQLException e) {
                    // Handle database-related exceptions
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error accessing the database.");
                }
            } catch (NumberFormatException e) {
                // Handle the case when the game ID is not a valid number
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid game ID.");
            }
        } else {
            // Handle the case when the game ID parameter is missing
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing game ID parameter.");
        }
    }
}
