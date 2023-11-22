package Servlets;


import jakarta.servlet.annotation.WebServlet;



import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name="NapraviNarudzbu", urlPatterns={"/NapraviNarudzbu"})
public class NapraviNarudzbu extends HttpServlet {


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

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Pozivamo funkciju za prebacivanje stavki iz korpe u narudžbu
        NarudzbeDAO.prebaciUKorpu(userId);

        // Redirect to a confirmation page or any other page
        response.sendRedirect("home.jsp");
    }
}
