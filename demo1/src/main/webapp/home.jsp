<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Users" %>
<%@ page import="Servlets.UserDAO" %>

<%
    UserDAO userDAO = new UserDAO();
    List<Users> usersList = userDAO.getAllUsers();
%>

<html>
<head>
    <title>HOME</title>
</head>
<body>
<h1>KUCICA</h1>
<a href="kuca">Djesi Kraljuuuuuu</a>

<p>Size of usersList: <%= usersList.size() %></p>
<p>dasdasdasdadas</p>
<h2>Users List:</h2>
<table border="1">
    <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Password</th>
    </tr>

    <% for (Users user : usersList) { %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getMail() %></td>
        <td><%= user.getRole() %></td>
        <td><%= user.getPassword() %></td>
    </tr>
    <% } %>
</table>
<p>Size of usersList: <%= usersList.size() %></p>


<style>
    p{
        font-size: large;
        color: #0037ff;
    }
</style>
</body>
</html>
