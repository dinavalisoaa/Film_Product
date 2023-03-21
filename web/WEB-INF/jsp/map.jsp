<%-- 
    Document   : map
    Created on : Mar 21, 2023, 6:15:33 AM
    Author     : idealy
--%>
<%@page import="java.util.List"%>
<%@page import="model.Plateau"%>
<%
    List<Plateau> listePlateau = (List) request.getAttribute("plateau");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
              integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
              crossorigin=""/>
        <!-- Make sure you put this AFTER Leaflet's CSS -->
        <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
                integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
        crossorigin=""></script>
        <link rel="stylesheet" href="assets/css/map.css">
        <link rel="stylesheet" href="assets/css/index.css">
        <title>LeafLet - Project</title>
    </head>
    <body>
        <div class="map" id="map">
        </div>

        <script src="assets/js/map.js"></script>
        <script>
            var list = [];

            <%
                for (int idx = 0; idx < listePlateau.size(); idx++) {
                    Plateau elem = listePlateau.get(idx);
            %>
            list.push(L.latLng(<%=elem.getLatitude()%>,<%=elem.getLongitude()%>));
            <%
                      }
            %>
            addMarkers(list);

        </script>
        <script src="assets/js/index.js"></script>

        <!-- Modal -->
        <div class="idea-full" id="idea-full">
            <div class="idea-main-card" id="idea-main-card">
                <div class="idea-card-head">
                    <h1>Ajouter plateau
                    </h1>
                    <span class="idea-close" id="idea-close">&times</span>
                </div>
                <div class="idea-card-body">
                    <form action="popup.html" method="post">
                        <div class="idea-form">
                            <label for="">Nom</label>
                            <input type="text" class="idea-form-input" name="nom"  required>
                        </div>

                        <div class="idea-form">
                            <label for="">latitude</label>
                            <input type="number" class="idea-form-input" name="latitude" id="latitude" readonly>
                        </div>

                        <div class="idea-form">
                            <label for="">longitude</label>
                            <input type="number" class="idea-form-input" name="longitude" id="longitude" readonly>
                        </div>

                        <div class="idea-form">
                            <input type="submit" class="idea-btn-default" value="Valider">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>