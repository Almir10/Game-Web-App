<%@ page import="Beans.Games" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- ... (your existing head content) ... -->
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
