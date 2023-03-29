<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="service.DialogueService"%>
<%@page import="model.Dialogue"%>
<%@page import="model.*"%>
<%@page import="service.PlateauService"%>
<%@page import="service.FilmService"%>
<%@page import="dao.HibernateDao"%>
<%@page import="model.Scene"%>
<%@page import="java.util.List"%>
<%
    // List<Plateau> plateau = new List<Plateau>
    List<Scene> scene = (List<Scene>) request.getAttribute("scene");
    List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
    List<Film> film = (List<Film>) request.getAttribute("film");
    List<Recherche> valiny = (List<Recherche>) request.getAttribute("valiny");


%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> E-Film </title>
        <!-- favicon -->
        <link rel="stylesheet" href="assets/css/index.css">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/liste-scene.css">

        <!-- fontawesome icon  -->
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <!-- flaticon css -->
        <link rel="stylesheet" href="assets/fonts/flaticon.css">
        <!-- animate.css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- stylesheet -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">
    </head>

    <body>

        <!-- preloader begin -->
        <div class="preloader">
            <div class="loader">
                <hr>
                <hr>
            </div>
        </div>
        <!-- preloader end -->

        <!-- header begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->

            <!-- breadcrump begin -->

            <!-- breadcrump end -->

            <!-- gallery begin -->
            <div class="gallery">

                <div class="event-schedule">
                    <div class="container">

                        <div class="row justify-content-center">
                            <div class="col-xl-12 col-lg-12">
                                <div class="add-space section-title text-center">
                                    <h2 style="font-size: 30px">
                                        Recherche Avance
                                    </h2> 
                                    <h3 style="font-size: 30px;color: white">
                                        "${mot}"
                                </h3> 
                                <div class="part-img">
                                    <img style="height:270px;width:600px;"  src="assets/img/Search engines-rafiki.svg" alt="">

                                </div>
                            </div>  
                            <form action="recherche" method="get">
                                <div class="row">
                                    <table class="table">
                                        <tr>
                                            <th>MOT CLE </th>
                                            <th>DATE DEBUT</th>
                                            <th>DATE Fin</th>
                                            <th>Plateau</th>
                                            <th>Etat</th>
                                            <th>Action</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input  type="text" name="motcle" class="form-control" placeholder="MOT CLE"/>

                                            </td>
                                            <td>
                                                <input  type="date" name="datedebut"class="form-control" placeholder="MOT CLE"/>

                                            </td>
                                            <td>
                                                <input  type="date" name="datefin"class="form-control" placeholder="MOT CLE"/>

                                            </td>
                                            <td>
                                                <select name="plateauId"class="form-control">
                                                    <option value="-1">Plateau</option>

                                                    <%                                            for (int i = 0; i < plateau.size(); i++) {
                                                            Plateau teau = plateau.get(i);
                                                    %>
                                                    <option value="<%=teau.getId()%>"><%=teau.getNom()%></option>
                                                    <%%>
                                                    <%
                                                        }
                                                    %>
                                                </select>

                                                <select name="filmId"class="form-control">
                                                    <option value="-1">FIlM</option>

                                                    <%
                                                        for (int i = 0; i < film.size(); i++) {
                                                            Film teau = film.get(i);
                                                    %>
                                                    <option value="<%=teau.getId()%>"><%=teau.getTitre()%></option>
                                                    <%%>
                                                    <%
                                                        }
                                                    %>
                                                </select>

                                                <select name="sceneId"class="form-control">
                                                    <option value="-1">Scene</option>

                                                    <%
                                                        for (int i = 0; i < scene.size(); i++) {
                                                            Scene teau = scene.get(i);
                                                    %>
                                                    <option value="<%=teau.getId()%>"><%=teau.getTitre()%></option>
                                                    <%%>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="etat"class="form-control" >
                                                    <option value="-1">Etat de plannification</option>

                                                    <option value="1">Plannifier</option>
                                                    <option value="0">Non plannifier</option>

                                                </select>

                                            </td>
                                            <td>
                                                <input type="submit" class="btn btn-danger"/>

                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </form>
                        </div>

                        <!--                            <div class="section-title text-center">
                                                        
                                                        <h2>Scene</h2>
                                                      
                                                    </div>-->
                    </div>
                    <div class="col-xl-12 col-lg-12">

                        <div class="row">
                            <div class="col-xl-12 col-lg-12">
                                <div class="row">

                                    <table style="color:white;font-family: sans-serif;font-size: 20px; " class="table table-active">
                                        <th>Film</th>
                                        <th>Scene</th>
                                        <th>Plateau
                                        </th>
                                        <th>Deb.
                                        </th>
                                        <th>fin.
                                        </th>
                                        <th>Etat
                                        </th>
                                        <%
                                            for (int idx = 0; idx < valiny.size(); idx++) {
                                                Recherche elem = valiny.get(idx);
                                        %>
                                        <tr>
                                            <td>
                                                <p> <%=elem.getFilmtitre()%>
                                                    (FILM<%=elem.getFilmId()%>)</p></td>
                                            <td>
                                                <p> <%=elem.getSceneTitre()%>
                                                    (SC<%=elem.getSceneId()%> )</p></td>

                                            <td>
                                                <p><%=elem.getNom()%>
                                                    (PL<%=elem.getSceneId()%>)</p></td>
                                                    <%
                                                        if (elem.getEtat() == 0) {
                                                    %>
                                            <td>
                                                <a href="#" class="btn btn-danger">Pas de planning</a>
                                            </td> 
                                            <%
                                            } else {
                                            %>
                                            <td><p>
                                                    <%=elem.getDatedebut().toLocaleString()%>
                                                </p></td>      
                                            <td><%=elem.getDatefin().toLocaleString()%></td>    
                                            <td>
                                                <a href="#" class="btn btn-success">Plannfier</a>

                                            </td>
                                            <%
                                                }
                                            %>
                                            <td>

                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div><div class="card" style="
                                   background-image: -webkit-linear-gradient(0deg, #ff6975 0%, #d34d94 56%, #a730b2 100%);
                                   background-size: 100%;
                                   z-index: -1;
                                   opacity: .25;">
                            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree<%//=id%>" aria-expanded="false" aria-controls="collapseThree" role="button">
                                <div class="part-img">
                                    <img src="<%//=d.getPersonnage(elem.getPersonnageId()).getPhoto()%>" alt="">
                                </div>
                                <div class="part-text">
                                    <p style="color: white"><%//=d.getPersonnage(elem.getPersonnageId()).getNom()%>
                                    <p><%//=elem.getContenu()%></p>
                                </div>
                            </div>
                            <div id="collapseThree<%//=id%>" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div style="font-size: 30px" class="part-text">
                                        <br/>
                                        <span class="time"><i class="fas fa-clock"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- gallery end -->

                <!-- footer begin -->
                <div class="footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                                <div class="logo">
                                </div>
                            </div>
                            <div class="col-xl-7 col-lg-8">
                                <div class="footer-menu">
                                    <!--                                    <nav class="navbar navbar-expand-lg">
                                                                            <ul class="navbar-nav">
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="index-2.html">About <span class="sr-only">(current)</span></a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="event.html">Event</a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="gallery.html">Gallery</a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="top-dj.html">Top DJ</a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="schedule.html">Schedule</a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="blog.html">Blog</a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="faq.html">Faq</a>
                                                                                </li>
                                                                                <li class="nav-item">
                                                                                    <a class="nav-link" href="contact.html">Contact</a>
                                                                                </li>
                                                                            </ul>
                                                                        </nav>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- footer end -->

                <!-- jquery -->
                <script src="assets/js/jquery.js"></script>
                <!-- bootstrap -->
                <script src="assets/js/bootstrap.min.js"></script>
                <!-- owl carousel -->
                <script src="assets/js/owl.carousel.js"></script>
                <!-- magnific popup -->
                <script src="assets/js/jquery.magnific-popup.js"></script>
                <!-- way poin js-->
                <script src="assets/js/waypoints.min.js"></script>

                <script src="assets/js/index.js"></script>
                <script src="assets/js/wow.min.js"></script>
                <!-- main -->
                <script src="assets/js/main.js"></script>
                </body>


                </html>