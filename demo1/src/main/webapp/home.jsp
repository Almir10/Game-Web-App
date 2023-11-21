<%@ page import="Beans.Games" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gaming Shop</title>
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
                <a class="nav-link" href="cart.jsp">Cart</a>
            </li>
            <% } %>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="jumbotron text-center">
    <div class="container">
        <h1 class="display-4">Welcome to Gaming Shop</h1>
        <p class="lead">Explore the latest gaming gear and accessories.</p>
        <a class="btn btn-primary btn-lg" href="#" role="button">Shop Now</a>
    </div>
</div>

<!-- Search and Sort Section -->
<div class="container mt-3">
    <form class="form-inline" action="GameFilterServlet" method="post">
        <!-- Search Bar -->
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">

        <!-- Sort Dropdown -->
        <select class="form-control mr-sm-2" name="sort">
            <option value="price">Sort by Price</option>
            <option value="name">Sort by Name</option>
        </select>

        <!-- Submit Button -->
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search & Sort</button>
    </form>
</div>
<!-- Featured Products -->
<div class="container mt-5">
    <h2 class="text-center mb-4">SVE IGRE</h2>
    <div class="row">
        <%
            List<Games> games = (List<Games>) request.getAttribute("games");

            if (games != null) {
                for (Games game : games) {
        %>
        <form action="AddToCart" method="post" accept-charset="UTF-8">
            <input type="hidden" name="id" value="<%= game.getId() %>">
            <input type="hidden" name="title" value="<%= game.getTitle() %>">
            <!-- Add other hidden fields as needed -->

            <div class="col-md-4">
                <div class="card mb-4 box-shadow">
                    <img class="card-img-top rounded" src="<%= game.getLogo() %>" alt="<%= game.getTitle() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= game.getTitle() %></h5>
                        <p class="card-text">Price: $<%= game.getPrice() %> USD</p>
                        <div class="text-center my-4">
                            <button type="submit" class="btn btn-info">Add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%
                } // end for loop
            } else {
                // Handle the case when games is null (optional)
                out.println("No games available.");
            }
        %>
    </div>
</div>


<!-- Footer -->
<footer class="text-white text-center py-3">
    <p>&copy; 2023 Gaming Shop. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
