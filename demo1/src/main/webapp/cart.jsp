<%@ page import="Beans.Games" %>
<%@ page import="Beans.Orders" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>

<h2>Your Cart</h2>

<%
    // Get the shopping cart from the session
    Orders cart = (Orders) session.getAttribute("cart");
    System.out.println("Cart: " + cart);

    // Check if the cart is not null and has items
    if (cart != null && !cart.getCartItems().isEmpty()) {
%>
<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Price</th>
        <th>Logo</th>
        <th>Quantity</th>
    </tr>
    </thead>
    <tbody>

    <!-- Iterate through the games in the cart -->
    <%
        for (Games game : cart.getCartItems()) {
    %>
    <tr>
        <td><%= game.getTitle() %></td>
        <td><%= game.getPrice() %></td>
        <td><img src="<%= game.getLogo() %>" alt="<%= game.getTitle() %> Logo" width="50" height="50"></td>
        <td>
            <!-- Form to update quantity -->
            <form action="UpdateCart" method="post" accept-charset="UTF-8">
                <input type="hidden" name="gameId" value="<%= game.getId() %>">
                <input type="number" name="quantity" value="<%= game.getQuantity() %>" min="1">
                <button type="submit">Update</button>
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

</body>
</html>
