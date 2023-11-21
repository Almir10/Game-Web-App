package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name="AddToCart", urlPatterns={"/AddToCart"})
public class AddToCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        System.out.println(userId+": userid");
        if (userId == null) {
            // Handle the case where userId is not in the session
            // You might want to redirect to a login page or take appropriate action
            response.sendRedirect("login.jsp"); // Example redirect to a login page
            return;
        }

        String gameId = request.getParameter("gameId");

        // Assuming you have a method to add items to the cart in your database
        CartDAO.addToCart(userId, gameId);


        // Redirect to the "Games" page or any other page
        response.sendRedirect("Games");
    }
}


