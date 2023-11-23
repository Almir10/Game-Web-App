<%--
  Created by IntelliJ IDEA.
  User: DS User
  Date: 22. 11. 2023.
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Narudzbe" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Beans.Kart" %>

<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Add your custom styles here -->
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Gaming Shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="Games">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Games">Games</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Cart">Cart</a>
            </li>
            <!-- Add more links as needed -->
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2>Orders</h2>

    <%-- Retrieve orders from the request attribute --%>
    <%
        List<Narudzbe> orders = (List<Narudzbe>) request.getAttribute("orders");
    %>

    <%-- Display the orders in a table --%>
    <table class="table">
        <thead>
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%-- Iterate over orders and display them in the table --%>
        <% if (orders != null && !orders.isEmpty()) { %>
        <% for (Narudzbe order : orders) { %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getOrderDate() %></td>
            <td><%= order.getStatus() %></td>
            <td>
                <button class="btn btn-link" onclick="toggleGames('<%= order.getId() %>')">Show Games</button>
            </td>
        </tr>
        <tr id="gamesRow<%= order.getId() %>" style="display: none;">
            <td colspan="4">
                <!-- Add code here to display games within the order -->
                <% if (order.getStavke() != null && !order.getStavke().isEmpty()) { %>
                <% for (Kart stavka : order.getStavke()) { %>
                <div><%= stavka.getGameId() %> - <%= stavka.getGamePrice() %></div>
                <% } %>
                <% } else { %>
                <p>No games in this order.</p>
                <% } %>
            </td>
        </tr>
        <% } %>
        <% } else { %>
        <tr>
            <td colspan="4">No orders available.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <%-- Display a message if there are no orders --%>
    <% if (orders == null || orders.isEmpty()) { %>
    <p>No orders available.</p>
    <% } %>

    <script>
        function toggleGames(orderId) {
            var gamesRow = document.getElementById('gamesRow' + orderId);
            if (gamesRow.style.display === 'none') {
                gamesRow.style.display = 'table-row';
            } else {
                gamesRow.style.display = 'none';
            }
        }
    </script>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

<%-- Function to format date in a specific way --%>
<%!
    private String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
%>