<%-- 
    Document   : ajout_sceneN
    Created on : 28 févr. 2023, 21:50:56
    Author     : P14_A_111_Dina
--%>

<%@page import="model.Emotion"%>
<%@page import="model.Personnage"%>
<%@page import="service.PersonnageService"%>
<%@page import="model.Dialogue"%>
<%@page import="dao.HibernateDao"%>
<%@page import="service.PlateauService"%>
<%@page import="model.Scene"%>
<%@page import="model.Plateau"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Dialogue> dialogue = (List<Dialogue>) request.getAttribute("dialogue");
    List<Personnage> personnage = (List<Personnage>) request.getAttribute("personnage");
    List<Emotion> emotion = (List<Emotion>) request.getAttribute("emotion");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="dialogue_formulaire?idScene=<%=request.getParameter("idScene")%>"><button>Nouvelle Dialogue</button></a>
        <hr/>
        <h2>Scenario</h2>
        <br/>
        <form action="dialogue" method="get">
            <input type="hidden" name="search" value="1">
            <input type="hidden" name="idScene" value="<%=request.getParameter("idScene")%>">
            <input type="text" name="mot">
            <select name="personnage">
                <option value="">Personnage</option>
            <% for (int idx = 0; idx < personnage.size(); idx++) { %>
            <option value="<%=personnage.get(idx).getId()%>"><%=personnage.get(idx).getNom()%></option>
            <% } %>
            </select>
            <select name="emotion">
                <option value="">Emotion</option>
            <% for (int idx = 0; idx < emotion.size(); idx++) { %>
            <option value="<%=emotion.get(idx).getId()%>"><%=emotion.get(idx).getType()%></option>
            <% } %>
            </select>
            <input type="submit" value="RECHERCHER">
        </form>
        <br/>
        <table border="1" width="800">
            <tr>
                <th></th>
                <th></th>
                <th>Personnage</th>
                <th>Contenu</th>
                <th>Duree</th>
            </tr>
            <% for (int idx = 0; idx < dialogue.size(); idx++) { %>
            <tr>
                <td><%=dialogue.get(idx).getNumero()%></td>
                <td><%=dialogue.get(idx).getContenu()%></td>
                <td><%=dialogue.get(idx).getDuree()%></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
