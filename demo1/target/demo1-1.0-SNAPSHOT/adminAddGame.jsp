<%@ page import="Beans.Games" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Check if the user has admin privileges
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

    if (isAdmin == null || !isAdmin) {
        // If not an admin, redirect to the home page or another page
        response.sendRedirect("Games");
        return; // Stop further execution
    }
%>


<html>
<head>
    <Title>Admin</Title>
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
<%--<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Gaming Shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ml-auto">
            <!-- ... other list items ... -->
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">Home</a>
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
            <% if (session.getAttribute("adminUsername") != null) { %>
            <!-- Display the "Add Game" link only if the user is an admin -->
            <li class="nav-item">
                <a class="nav-link" href="adminAddGame.jsp">Add Game</a>
            </li>
            <% } %>
            <!-- Display the "Cart" link only if the user is logged in -->
            <li class="nav-item">
                <a class="nav-link" href="cart.jsp">Cart</a>
            </li>
            <% } else { %>
            <!-- User is not logged in -->
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <% } %>
        </div>
    </div>
</nav>--%>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Gaming Shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ml-auto">

            <!-- ... other list items ... -->
            <% String username = (String) session.getAttribute("username"); %>
            <% String adminUsername = (String) session.getAttribute("adminUsername"); %>
            <% if (username != null || adminUsername != null) { %>
            <span class="navbar-text">
                    <% if (adminUsername != null) { %>
                        Welcome, <%= adminUsername %> <!-- Display the admin username -->
                    <% } else { %>
                        Welcome, <%= username %> <!-- Display the username -->
                    <% } %>
                    <li class="nav-item">
                        <a class="nav-link" href="Games">Games</a>
                    </li>
                    <form class="form-inline" action="Logout" method="post">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
                    </form>
                </span>
            <% } else { %>
            <!-- User is not logged in -->
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <% } %>
        </div>
    </div>
</nav>
<!-- Add Game Form for Admin -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Add New Game</h2>
    <form action="AddGameServlet" method="post">
        <div class="form-group">
            <label for="gameTitle">Title:</label>
            <input type="text" class="form-control" id="gameTitle" name="gameTitle" required>
        </div>
        <div class="form-group">
            <label for="gamePrice">Price:</label>
            <input type="text" class="form-control" id="gamePrice" name="gamePrice" required>
        </div>
        <div class="form-group">
            <label for="gameLogo">Enter Image URL:</label>
            <input type="url" class="form-control" id="gameLogo" name="gameLogo">
        </div>
        <!-- Add other game attributes as needed -->
        <button type="submit" class="btn btn-primary">Add Game</button>
    </form>
</div>

<!-- ... (your existing content) ... -->

</body>
</html>
