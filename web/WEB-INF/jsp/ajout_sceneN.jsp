<%-- 
    Document   : ajout_sceneN
    Created on : 28 févr. 2023, 21:50:56
    Author     : P14_A_111_Dina
--%>

<%@page import="dao.HibernateDao"%>
<%@page import="service.PlateauService"%>
<%@page import="model.Scene"%>
<%@page import="model.Plateau"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
    List<Scene> scene = (List<Scene>) request.getAttribute("scene");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="plateau"><button>Nouveau plateau</button></a>
        <a href="personnage"><button>Nouveau personnage</button></a>
        <hr/>
        <h2>Ajout scene</h2>
        <form action="add_scene" method="get">
            <input type="hidden" name="idFilm" value="<%=request.getParameter("film")%>">
            <input type="text" name="titre">
            <select name="plateau">
            <% for (int idx = 0; idx < plateau.size(); idx++) { %>
            <option value="<%=plateau.get(idx).getId()%>"><%=plateau.get(idx).getNom()%></option>
            <% } %>
            </select>
            <input type="submit" value="AJOUTER">
        </form>
        <br/>
        <form action="scene" method="get">
            <input type="hidden" name="search" value="1">
            <input type="hidden" name="film" value="<%=request.getParameter("film")%>">
            <input type="text" name="mot">
            <select name="plateau">
                <option value="">Plateau</option>
            <% for (int idx = 0; idx < plateau.size(); idx++) { %>
            <option value="<%=plateau.get(idx).getId()%>"><%=plateau.get(idx).getNom()%></option>
            <% } %>
            </select>
            <input type="date" name="date">
            <input type="submit" value="RECHERCHER">
        </form>
        <br/>
        <table border="1" width="800">
            <tr>
                <th>Titre</th>
                <th>Plateau</th>
                <th></th>
            </tr>
            <% for (int idx = 0; idx < scene.size(); idx++) { %>
            <tr>
                <td><%=scene.get(idx).getTitre()%></td>
                <td>
                    <form action="dialogue" method="get">
                        <input type="hidden" value="<%=scene.get(idx).getId()%>" name="idScene">
                        <input type="submit" value="AJOUTER DIALOGUE">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
