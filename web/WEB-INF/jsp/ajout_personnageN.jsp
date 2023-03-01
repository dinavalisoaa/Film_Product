<%-- 
    Document   : ajout_sceneN
    Created on : 28 févr. 2023, 21:50:56
    Author     : P14_A_111_Dina
--%>

<%@page import="model.Personnage"%>
<%@page import="model.Scene"%>
<%@page import="model.Plateau"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Personnage> personnage = (List<Personnage>) request.getAttribute("personnage");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Ajout personnage</h2>
        <form action="add_personnage" method="get">
            <input type="file" name="photo">
            <input type="text" name="nom">
            <input type="submit" value="AJOUTER">
        </form>
        <br/>
        <table border="1" width="800">
            <tr>
                <th>Photo</th>
                <th>Nom</th>
            </tr>
            <% for (int idx = 0; idx < personnage.size(); idx++) { %>
            <tr>
                <td><img src="<%=personnage.get(idx).getPhoto()%>" alt=""></td>
                <td><%=personnage.get(idx).getNom()%></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
