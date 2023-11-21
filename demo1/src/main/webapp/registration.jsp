
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>

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

<body>


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
            <li class="nav-item">
                <a class="nav-link" href="registration.jsp">Registration</a>
            </li>
            <% } %>
            <% if (username != null) { %>
            <!-- Display the "Cart" link only if the user is logged in -->
            <li class="nav-item">
                <a class="nav-link" href="registration.jsp">Registration</a>
            </li>
            <% } %>
        </div>
    </div>
</nav>

<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                     class="img-fluid" alt="Phone image">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                <form action="Registration" method="POST">

                    <!-- Username input -->
                    <div class="form-outline mb-4">
                        <input type="text" id="form1Example33" class="form-control form-control-lg" name="username" />
                        <label class="form-label" for="form1Example13">Username</label>
                    </div>
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="email" id="form1Example13" class="form-control form-control-lg" name="email" />
                        <label class="form-label" for="form1Example13">Email</label>
                    </div>
                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <input type="password" id="form1Example23" class="form-control form-control-lg" name="password" />
                        <label class="form-label" for="form1Example23">Password</label>
                    </div>

                    <!-- Confirm Password input -->
                    <div class="form-outline mb-4">
                        <input type="password" id="form1Example24" class="form-control form-control-lg" name="confirmPassword" />
                        <label class="form-label" for="form1Example24">Confirm Password</label>
                    </div>

                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                            <label class="form-check-label" for="form1Example3"> Remember me </label>
                        </div>
                        <a href="#!">Forgot password?</a>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registruj se</button>

                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="login.jsp"
                       role="button">
                        <i class="fab fa-facebook-f me-2"></i>Prijavi se
                    </a>


                </form>
            </div>
        </div>
    </div>
</section>

</body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>
