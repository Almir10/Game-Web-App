<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Orders" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<h2>Your Shopping Cart</h2>

<% List<Orders> cartItems = (List<Orders>) request.getAttribute("cartItems"); %>

<% if (cartItems != null && !cartItems.isEmpty()) { %>
<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Action</th>
    </tr>

    <% for (Orders cartItem : cartItems) { %>
    <tr>
        <td><%= cartItem.getGameId() %></td>
        <td>
            <form action="removeFromCart" method="post">
                <input type="hidden" name="userId" value="<%= cartItem.getUserId() %>" />
                <input type="hidden" name="productId" value="<%= cartItem.getGameId() %>" />
                <input type="submit" value="Remove from Cart" />
            </form>
        </td>
    </tr>
    <% } %>
</table>
<% } else { %>
<p>Your cart is empty.</p>
<% } %>
</body>
</html>

