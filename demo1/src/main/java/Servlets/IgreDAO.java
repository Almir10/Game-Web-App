package Servlets;

import Beans.Games;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IgreDAO {


    public static List<Games> getAllGames() {
        List<Games> games = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopdb", "root", "orhan123")) {
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

    public static List<Games> getFilteredGames(String search, String sort, String order) {
        List<Games> filteredGames = new ArrayList<>();
        List<Games> allGames = getAllGames();

        // Logika za filtriranje na osnovu pretrage
        for (Games game : allGames) {
            if (game.getTitle().toLowerCase().contains(search.toLowerCase())) {
                filteredGames.add(game);
            }
        }

        if ("price".equals(sort)) {
            // Sortirajte po ceni
            filteredGames.sort((g1, g2) -> {
                if ("asc".equals(order)) {
                    return Double.compare(g1.getPrice(), g2.getPrice());
                } else {
                    return Double.compare(g2.getPrice(), g1.getPrice());
                }
            });
        } else if ("name".equals(sort)) {
            // Sortirajte po imenu
            filteredGames.sort((g1, g2) -> {
                if ("asc".equals(order)) {
                    return g1.getTitle().compareToIgnoreCase(g2.getTitle());
                } else {
                    return g2.getTitle().compareToIgnoreCase(g1.getTitle());
                }
            });
        }

        return filteredGames;
    }
}


