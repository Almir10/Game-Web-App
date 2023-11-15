package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import Beans.Users;

@WebServlet(name = "Login",urlPatterns = {"/Login"})

public class Login extends HttpServlet{
        public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
                res.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = res.getWriter()) {
                        String usernamex = req.getParameter("username");
                        String passwordx = req.getParameter("password");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "adis1");
                        //Statement statement = connection.createStatement();
                        System.out.println("Povezano");
                        String sql = "SELECT * FROM users WHERE username=? AND password=?";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setString(1, usernamex);
                        statement.setString(2, passwordx);

                        ResultSet result = statement.executeQuery();

                        if (result.next()) {
                                // Korisnički podaci su tačni, korisnik je uspešno prijavljen
                                out.println("Uspešna prijava!");
                        } else {
                                // Pogrešni korisnički podaci
                                out.println("Pogrešno korisničko ime ili lozinka!");
                        }

                }
                catch(SQLException e){
                        System.err.println("Error connecting to the database:");
                        e.printStackTrace();
                }

        }
}





/* public class UserDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/baza";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "orhan123";

    public List<Users> getAllUsers() {
        List<Users> userList = new ArrayList<>();
        Connection connection = null;

        try {
            System.out.println("Attempting to connect to the database...");
            // Establishing the database connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            System.out.println("Connected to the database!");

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM tabela");

            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String mail = resultSet.getString("mail");
                String role = resultSet.getString("role");
                String password = resultSet.getString("password");

                Users user = new Users(username, mail, role, password);
                userList.add(user);
            }

            // Closing resources
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            System.err.println("Error connecting to the database:");
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                    System.out.println("Connection closed.");
                }
            } catch (SQLException e) {
                System.err.println("Error closing the database connection:");
                e.printStackTrace();
            }
        }

        return userList;
    }
}
*/