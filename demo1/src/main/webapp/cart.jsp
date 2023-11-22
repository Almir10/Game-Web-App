<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Kart" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Bijela pozadina */
        }

        .navbar {
            background-color: #007bff; /* Plava boja za navigacionu traku */
        }

        .jumbotron {
            background-color: #007bff; /* Plava boja za herojsku sekciju */
            color: #fff; /* Bijeli tekst */
            margin-bottom: 0; /* Uklonite dodatni prostor ispod hero sekcije */
        }

        .game-card {
            background-color: #fff; /* Bijela pozadina za proizvode */
            border: 1px solid #007bff; /* Plava ivica za proizvode */
            border-radius: 10px; /* Zaobljeni rubovi kartica */
            margin-bottom: 20px;
            text-align: center; /* Centrirajte tekst */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Dodajte senku za efekat podizanja kartica */
        }

        .game-card img {
            max-width: 100%; /* Povećajte maksimalnu širinu slike */
            max-height: 200px; /* Povećajte maksimalnu visinu slike */
            object-fit: cover; /* Osigurajte da se slika proporcionalno uklapa */
            border-bottom: 1px solid #007bff; /* Plavi donji ivičnjak za sliku */
            border-radius: 10px 10px 0 0; /* Zaobljeni rubovi samo na vrhu slike */
        }

        .game-card .card-body {
            padding: 20px; /* Povećajte prostor unutar kartice */
        }

        .game-card .card-title {
            color: #007bff; /* Plava boja za naslov proizvoda */
            font-size: 18px; /* Postavite veličinu naslova */
            margin-bottom: 10px; /* Dodajte razmak ispod naslova */
        }

        .game-card .card-text {
            font-size: 16px; /* Postavite veličinu teksta */
        }

        .game-card button {
            background-color: #007bff; /* Plava boja za dugme */
            color: #fff; /* Beli tekst na dugmetu */
            width: 80%; /* Smanjite širinu dugmeta */
            margin-top: 15px; /* Dodajte razmak iznad dugmeta */
        }

        footer {
            background-color: #007bff; /* Plava boja za footer */
            color: #fff; /* Bijeli tekst za footer */
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px 0; /* Povećajte prostor unutar footera */
        }
    </style>
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
            <!-- ... other list items ... -->
            <li class="nav-item active">
                <a class="nav-link" href="Games">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Games">Games</a>
            </li>
            <% String username = (String) session.getAttribute("username"); %>
            <% if (username != null) { %>
            <!-- User is logged in -->
            <span class="navbar-text">
                Welcome, <%= username %> <!-- Display the username -->
            </span>
            <li class="nav-item">
                <form class="form-inline" action="Logout" method="post">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
                </form>
            </li>
            <% } else { %>
            <!-- User is not logged in -->
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <% } %>
            <% if (username != null) { %>
            <!-- Display the "Cart" link only if the user is logged in -->
            <li class="nav-item">
                <a class="nav-link" href="Cart">Cart</a>
            </li>
            <% } %>
        </div>
    </div>
</nav>
<h2>Your Shopping Cart</h2>

<%-- Retrieve cart items from the request attribute --%>
<%
    List<Kart> cartItems = (List<Kart>) request.getAttribute("cartItems");
%>

<%-- Display the cart items in a table --%>
<%-- Display the cart items in a table --%>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Price</th>
        <th>Action</th>
    </tr>

    <%-- Iterate over cart items and display them in the table --%>
    <% for (Kart cartItem : cartItems) { %>
    <tr>
        <td><%= cartItem.getGameTitle() %></td>
        <td><%= cartItem.getGamePrice() %></td>
        <td>
            <form action="RemoveFromCart" method="post">
                <input type="hidden" name="orderId" value="<%= cartItem.getId() %>" />
                <input type="submit" value="Remove from Cart" />
            </form>
        </td>
    </tr>
    <% } %>
</table>

<%-- Display a message if the cart is empty --%>
<% if (cartItems == null || cartItems.isEmpty()) { %>
<p>Your cart is empty.</p>
<% } else { %>
<!-- Dodaj gumb za dovršetak narudžbe ako košarica nije prazna -->
<form action="FinishOrder" method="post">
    <input type="submit" value="Finish Order" class="btn btn-primary" />
</form>
<% } %>

</body>
</html>