<%-- 
    Document   : choix_filmN
    Created on : 28 févr. 2023, 21:31:16
    Author     : P14_A_111_Dina
--%>

<%@page import="model.Film"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Film> film = (List<Film>) request.getAttribute("film");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Choisir un film</h2>
        <form action="add_film" method="get">
            <input type="text" name="titre">
            <input type="submit" value="AJOUTER">
        </form>
    </body>
</html>
