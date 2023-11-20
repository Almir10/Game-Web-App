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

/*public class Igre extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IgreDAO igreDAO = new IgreDAO();
        List<Games> games = igreDAO.getAllGames();
        System.out.println("Ucitano");
        request.setAttribute("games", games);
        RequestDispatcher dispatcher = request.getRequestDispatcher("games.jsp");
        dispatcher.forward(request, response);
    }
    public void init(){
        System.out.println("Ucitalo se");
    }

}*/
public class Igre extends HttpServlet {

    public void init() {
        // Load games during initialization and store in the servlet context or another appropriate location
        IgreDAO igreDAO = new IgreDAO();
        List<Games> games = igreDAO.getAllGames();
        getServletContext().setAttribute("allGames", games);
        System.out.println("Games loaded and stored in servlet context.");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the games from the servlet context
        List<Games> games = (List<Games>) getServletContext().getAttribute("allGames");

        // Set the games as a request attribute for the JSP
        request.setAttribute("games", games);

        // Forward the request to the home.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
