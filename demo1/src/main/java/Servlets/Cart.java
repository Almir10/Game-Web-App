package Servlets;

import jakarta.persistence.criteria.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Beans.Orders;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet(name="Cart", urlPatterns={"/Cart"})
public class Cart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId"); // Assuming userId is passed as a parameter

        // Retrieve cart items from the database
        List<Orders> cartItems = CartDAO.getCartItems(userId);

        // Set the cart items as a request attribute
        request.setAttribute("cartItems", cartItems);

        // Forward to the cart.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }
}