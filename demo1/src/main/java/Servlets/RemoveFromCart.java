package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="RemoveFromToCart", urlPatterns={"/RemoveFromCart"})
public class RemoveFromCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        System.out.println(orderId);
        // Assuming you have a method to remove items from the cart in your database
        CartDAO.removeFromCart(orderId);

        response.sendRedirect("Cart"); // Redirect to the cart page or any other page
    }
}
