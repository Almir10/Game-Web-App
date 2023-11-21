<%@ page import="Beans.Games" %>
<%@ page import="Beans.Orders" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Bijela pozadina */
        }

        h2 {
            color: #007bff; /* Plava boja za naslov */
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #007bff; /* Plavi okvir za ćelije */
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #007bff; /* Plava pozadina za zaglavlje tabele */
            color: #fff; /* Beli tekst za zaglavlje tabele */
        }

        img {
            max-width: 50px; /* Maksimalna širina slike */
            max-height: 50px; /* Maksimalna visina slike */
        }

        p {
            color: #007bff; /* Plava boja teksta */
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Your Cart</h2>

    <%-- Get the shopping cart from the session --%>
    <%
        Orders cart = (Orders) session.getAttribute("cart");
        System.out.println("Cart: " + cart);

        // Check if the cart is not null and has items
        if (cart != null && !cart.getCartItems().isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>Title</th>
            <th>Price</th>
            <th>Logo</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>

        <%-- Iterate through the games in the cart --%>
        <%
            for (Games game : cart.getCartItems()) {
        %>
        <tr>
            <td><%= game.getTitle() %></td>
            <td>$<%= game.getPrice() %></td>
            <td><img src="<%= game.getLogo() %>" alt="<%= game.getTitle() %> Logo"></td>
            <td>
                <%-- Form to update quantity --%>
                <form action="UpdateCart" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="gameId" value="<%= game.getId() %>">
                    <input type="number" name="quantity" value="<%= game.getQuantity() %>" min="1">
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
    <%
    } else {
    %>
    <p>Your cart is empty.</p>
    <%
        }
    %>
</div>

</body>
</html>