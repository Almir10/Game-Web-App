package Servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Enumeration;

import Beans.Users;


@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class Login extends HttpServlet {
        public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
                res.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = res.getWriter()) {
                        String usernamex = req.getParameter("username");
                        String passwordx = req.getParameter("password");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB", "root", "adis1");
                        String sql = "SELECT * FROM users WHERE username=? AND password=?";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setString(1, usernamex);
                        statement.setString(2, passwordx);

                        ResultSet result = statement.executeQuery();



                        if (result.next()) {
                                // Check the user role
                                String role = result.getString("role");

                                HttpSession session = req.getSession();

                                if ("admin".equals(role)) {
                                        // Admin is successfully logged in
                                        session.setAttribute("adminUsername", result.getString("username"));
                                        session.setAttribute("isAdmin", true);
                                        // Redirect to admin page
                                        res.sendRedirect("adminAddGame.jsp"); // Assuming you have an admin section mapped to "/admin"
                                } else {
                                        // Regular user is successfully logged in
                                        session.setAttribute("id", result.getInt("id"));
                                        session.setAttribute("username", result.getString("username"));
                                        session.setAttribute("isAdmin", false);
                                        // Redirect to a welcome page or display a message
                                        res.sendRedirect("Games");
                                }
                        } else {
                                // Incorrect username or password
                                out.println("Incorrect username or password!");
                        }
                } catch (SQLException e) {
                        System.err.println("Error connecting to the database:");
                        e.printStackTrace();
                }
        }
}







