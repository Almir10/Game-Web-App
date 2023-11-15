<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Users" %>
<%@ page import="Servlets.UserDAO" %>

<%
    UserDAO userDAO = new UserDAO();
    List<Users> usersList = userDAO.getAllUsers();
%>

<html>
<head>
    <title>HOME</title>
</head>
<body>
<h1>KUCICA</h1>
<a href="kuca">A nekad je dolazila stalno   (65 882)

    Brate moj   (39 583)

    Cemu ovo sve   (39 403)

    Cujem ja cujem   (5 300)

    Dace Bog   (12 179)

    Daj mi znak   (28 289)

    Fine i postene   (982)

    Gledam u nebo   (2 607)

    Gluvo doba (Lane)   (37 581)

    Godinu dana, 300 kafana   (82 274)


    Idi drugome   (86 671)

    Izaberi nekog da na mene lici   (62 403)

    Ja se opijam   (557)

    Ja te volim   (7 447)

    Jos uvek sam sa tobom (feat. Adreana Cekic)   (6 305)

    Kaznio si me zivote   (1 938)

    Klosar (feat. Anid Cusic)   (18 647)

    Ko je taj   (528)

    Kome svoje srce dala si   (1 935)

    Korak do sna</a>

<p>Size of usersList: <%= usersList.size() %></p>
<p>dasdasdasdadas</p>
<h2>Users List:</h2>
<table border="1">
    <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Password</th>
    </tr>

    <% for (Users user : usersList) { %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getMail() %></td>
        <td><%= user.getRole() %></td>
        <td><%= user.getPassword() %></td>
    </tr>
    <% } %>
</table>
<p>Size of usersList: <%= usersList.size() %></p>


<style>
    p{
        font-size: large;
        color: #0037ff;
    }
</style>
</body>
</html>
