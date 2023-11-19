package Servlets;

import Beans.Orders;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCart"})
public class UpdateCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the parameters from the form
        int gameId = Integer.parseInt(request.getParameter("gameId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get the shopping cart from the session
        HttpSession session = request.getSession();
        Orders cart = (Orders) session.getAttribute("cart");

        if (cart != null) {
            // Update the quantity for the specified game
            cart.updateQuantity(gameId, quantity);

            // Redirect back to the cart page
            response.sendRedirect("cart.jsp");
        } else {
            // Handle the case where the cart is not found
            response.getWriter().println("Cart not found");
        }
    }
}
