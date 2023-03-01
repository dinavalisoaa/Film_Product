<%-- 
    Document   : ajout_sceneN
    Created on : 28 févr. 2023, 21:50:56
    Author     : P14_A_111_Dina
--%>

<%@page import="model.Emotion"%>
<%@page import="model.Personnage"%>
<%@page import="model.Dialogue"%>
<%@page import="dao.HibernateDao"%>
<%@page import="service.PlateauService"%>
<%@page import="model.Scene"%>
<%@page import="model.Plateau"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
        <a href="dialogue?idScene=<%=request.getParameter("idScene")%>"><button>Liste scenario</button></a>
        <hr/>
        <h2>Ajout dialogue</h2>
        <br/>
        <form action="add_dialogue" method="get">
            <input type="hidden" name="idScene" value="<%=request.getParameter("idScene")%>">
            <select name="personnage">
            <% for (int idx = 0; idx < personnage.size(); idx++) { %>
            <option value="<%=personnage.get(idx).getId()%>"><%=personnage.get(idx).getNom()%></option>
            <% } %>
            </select>
            <br/>
            <textarea name="contenu" placeholder="Texte"></textarea>
            <br/>
            <input type="time" name="duree">
            <br/>
            <select name="emotion">
            <% for (int idx = 0; idx < emotion.size(); idx++) { %>
            <option value="<%=emotion.get(idx).getId()%>"><%=emotion.get(idx).getType()%></option>
            <% } %>
            </select>
            <br/>
            <input type="text" name="action" placeholder="Action">
            <br/>
            <input type="submit" value="AJOUTER">
        </form>
    </body>
</html>
