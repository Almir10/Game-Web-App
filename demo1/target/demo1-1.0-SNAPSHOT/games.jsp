<%@ page import="Beans.Games" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Games</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Bijela pozadina */
        }

        .card {
            background-color: #fff; /* Bijela pozadina za proizvode */
            border: 1px solid #007bff; /* Plava ivica za proizvode */
            margin-bottom: 20px;
        }

        .card-title {
            color: #007bff; /* Plava boja za naslov proizvoda */
        }

        .btn-outline-secondary {
            color: #007bff; /* Plava boja za dugmad */
            border-color: #007bff; /* Plava boja ivice za dugmad */
        }

        .btn-outline-secondary:hover {
            background-color: #007bff; /* Plava boja pozadine prilikom hover-a na dugmad */
            color: #fff; /* Bijeli tekst prilikom hover-a na dugmad */
        }

        .card-img-top {
            height: 200px; /* Podesite visinu slike prema potrebi */
            object-fit: cover; /* Slika će popuniti prostor bez deformacije */
            border-bottom: 1px solid #007bff; /* Plavi donji ivičnjak za sliku */
        }

        .rounded {
            border-radius: 10px; /* Zaobljeni ivičnjaci za slike */
        }

        footer {
            background-color: #007bff; /* Plava boja za footer */
            color: #fff; /* Bijeli tekst za footer */
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Featured Products -->
<div class="container mt-5">
    <h2 class="text-center mb-4">SVE IGRE</h2>
    <div class="row">
        <% List<Games> games = (List<Games>) request.getAttribute("games");

            for (Games game : games) { %>
        <div class="col-md-4">
            <div class="card mb-4 box-shadow">
                <img class="card-img-top rounded" src="<%= game.getLogo() %>" alt="<%= game.getTitle() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= game.getTitle() %></h5>
                    <p class="card-text">Price: $<%= game.getPrice() %> USD</p>
                    <!-- Dodajte ovde dugme "Add to Cart" sa odgovarajućim action atributom -->
                </div>
            </div>
        </div>
        <% } %>
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