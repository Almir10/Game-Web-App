package Servlets;



import Beans.Games;
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


@WebServlet(name = "GameFilterServlet", urlPatterns = {"/GameFilterServlet"})

public class GameFilterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Dohvati vrednosti iz forme
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");

        // Pozovi metodu za filtriranje i sortiranje iz DAO klase
        IgreDAO dao = new IgreDAO();
        List<Games> filteredGames = dao.getFilteredGames(search, sort);

        // Postavi filtrirane igre kao atribut za prikaz na stranici
        request.setAttribute("games", filteredGames);

        // Prosledi kontrolu na home.jsp
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
