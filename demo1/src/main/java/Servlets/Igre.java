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

@WebServlet(name = "Igre", urlPatterns = {"/Games"})

public class Igre extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IgreDAO igreDAO = new IgreDAO();
        List<Games> games = igreDAO.getAllGames();

        request.setAttribute("games", games);
        RequestDispatcher dispatcher = request.getRequestDispatcher("games.jsp");
        dispatcher.forward(request, response);
    }

}
