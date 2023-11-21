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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Dohvati vrednosti iz forme
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");
        String order = request.getParameter("order");

        // Dohvati filtrirane igre
        List<Games> filteredGames = IgreDAO.getFilteredGames(search, sort, order);

        // Postavi filtrirane igre kao atribut zahteva
        request.setAttribute("games", filteredGames);

        // Prosledi zahtev na odgovarajući JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
