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
        }

        .card {
            background-color: #fff; /* Bijela pozadina za proizvode */
            border: 1px solid #007bff; /* Plava ivica za proizvode */
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

        footer {
            background-color: #007bff; /* Plava boja za footer */
            color: #fff; /* Bijeli tekst za footer */
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
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
        </ul>
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

<!-- Featured Products -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Featured Products</h2>
    <div class="row">
        <!-- Product 1 -->
        <div class="col-md-4">
            <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="https://via.placeholder.com/300" alt="Product 1">
                <div class="card-body">
                    <h5 class="card-title">Gaming Headset</h5>
                    <p class="card-text">Immersive sound for the ultimate gaming experience.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price">$99.99</span>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product 2 -->
        <div class="col-md-4">
            <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="https://via.placeholder.com/300" alt="Product 2">
                <div class="card-body">
                    <h5 class="card-title">Gaming Mouse</h5>
                    <p class="card-text">Precision and speed for your gaming needs.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price">$49.99</span>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product 3 -->
        <div class="col-md-4">
            <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="https://via.placeholder.com/300" alt="Product 3">
                <div class="card-body">
                    <h5 class="card-title">Gaming Keyboard</h5>
                    <p class="card-text">Mechanical keys for a responsive gaming experience.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price">$79.99</span>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
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
