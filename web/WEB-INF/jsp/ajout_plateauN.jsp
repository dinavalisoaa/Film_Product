<%-- 
    Document   : ajout_sceneN
    Created on : 28 févr. 2023, 21:50:56
    Author     : P14_A_111_Dina
--%>

<%@page import="model.Scene"%>
<%@page import="model.Plateau"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Ajout plateau</h2>
        <form action="add_plateau" method="get">
            <input type="text" name="nom">
            <input type="text" name="description">
            <input type="submit" value="AJOUTER">
        </form>
        <br/>
        <table border="1" width="800">
            <tr>
                <th>Nom</th>
                <th>Description</th>
            </tr>
            <% for (int idx = 0; idx < plateau.size(); idx++) { %>
            <tr>
                <td><%=plateau.get(idx).getNom()%></td>
                <td><%=plateau.get(idx).getDescription()%></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
