<%@ page import="Beans.Games" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Games</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        <!-- Your CSS styles -->
    </style>
</head>
<body>

<div class="text-center">
    <a class="btn btn-primary btn-lg" href="cart.jsp" role="button">CART</a>
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
            <input type="hidden" name="price" value="<%= game.getPrice() %>">
            <input type="hidden" name="logo" value="<%= game.getLogo() %>">

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