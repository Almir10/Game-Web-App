package Servlets;


import Beans.Games;
import Beans.Orders;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import Beans.Users;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("AddToCart servlet called");
        request.setAttribute("itemAddedToCart", true);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String idParameter = request.getParameter("id");
            int id = 0;  // Default value or handle it according to your application logic

            if (idParameter != null && !idParameter.isEmpty()) {
                try {
                    id = Integer.parseInt(idParameter);
                } catch (NumberFormatException e) {
                    // Handle the exception (log it or take appropriate action)
                    e.printStackTrace();  // This is just an example, in a production environment, log it properly.
                }
            }

            String title = request.getParameter("title");
            String priceParameter = request.getParameter("price");
            float price = 0.0f;  // Default value or handle it according to your application logic

            if (priceParameter != null && !priceParameter.trim().isEmpty()) {
                try {
                    price = Float.parseFloat(priceParameter);
                } catch (NumberFormatException e) {
                    // Handle the exception (log it or take appropriate action)
                    e.printStackTrace();  // This is just an example, in a production environment, log it properly.
                }
            }

            String logo = request.getParameter("logo");

            // Debugging: print the values to check if they are null
            System.out.println("id: " + id);
            System.out.println("title: " + title);
            System.out.println("price: " + price);
            System.out.println("logo: " + logo);

            Games gameToAdd = new Games(id, title, price, logo);

            // Debugging: print the gameToAdd object to check if it's null
            System.out.println("Game to add: " + gameToAdd);

            HttpSession session = request.getSession();
            Orders cart = (Orders) session.getAttribute("cart");

            if (cart == null) {
                cart = new Orders();
                session.setAttribute("cart", cart);
            }

            cart.addItemToCart(gameToAdd);
            System.out.println("Item added to cart: " + gameToAdd.getTitle());

            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            // Handle NumberFormatException
            e.printStackTrace();
        }
    }
}

