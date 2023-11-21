package Servlets;

import Beans.Games;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IgreDAO {


    public List<Games> getAllGames() {
        List<Games> games = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB", "root", "orhan123")) {
            System.out.println("Uspesno povezan s bazom podataka");
            String query = "SELECT id, title, price, logo FROM games";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {

                        Games game = new Games();
                        game.setId(resultSet.getInt("id"));
                        game.setTitle(resultSet.getString("title"));
                        game.setPrice((float) resultSet.getDouble("price"));
                        game.setLogo(resultSet.getString("logo"));

                        games.add(game);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Greska prilikom povezivanja s bazom podataka:");
            e.printStackTrace();
            // Handle the exception according to your application's requirements
        }

        return games;
    }
}
