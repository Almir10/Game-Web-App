package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name="Narudzbe", urlPatterns={"/Narudzbe"})
public class Narudzbe extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Pozvan");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");

        if (userId != null) {
            List<Beans.Narudzbe> orders = NarudzbeDAO.getAllOrders(userId);
            request.setAttribute("orders", orders);
        } else {
            // Ako userId nije postavljen, možete preusmeriti korisnika na stranicu za prijavu
            // ili preusmeriti na drugu stranicu kako biste ga obavestili o potrebi prijave.
            response.sendRedirect("login.jsp");
            return; // Dodato kako bismo prekinuli dalje izvršavanje ako korisnik nije prijavljen
        }

        request.getRequestDispatcher("narudzbe.jsp").forward(request, response);
    }
}