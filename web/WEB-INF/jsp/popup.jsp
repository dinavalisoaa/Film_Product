<%-- 
    Document   : popup
    Created on : Mar 21, 2023, 6:43:02 AM
    Author     : idealy
--%>

<%@page import="model.Plateau"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="popup">
    <%
    Plateau teau=(Plateau)request.getAttribute("plateau");
    %>
    <h1>This is map - Information</h1>
    <p>Name : <%=teau.getNom() %></p>
    <p>Lat : <%=teau.getLatitude() %></p>
    <p>Lng : <%=teau.getLongitude()  %></p>
</div>
