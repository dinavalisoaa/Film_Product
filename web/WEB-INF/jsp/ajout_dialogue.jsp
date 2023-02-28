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
<html lang="zxx">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> E-Film </title>
    <!-- favicon -->
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
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-6 d-xl-block d-lg-block d-flex align-items-center">
                            
                                <h1 href="index.html">E-FILM</h1>
                            
                        </div>
                        <div class="d-xl-none d-lg-none d-block col-6">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <i class="fas fa-bars"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-8">
                    <div class="mainmenu">
                        <nav class="navbar navbar-expand-lg">
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item">
                                        <a class="nav-link " href="about.html">About <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="movie.html">Movie</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="gallery.html">Scene</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="schedule.html">Planning</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- header end -->

    <!-- breadcrump begin -->
    <div class="breadcrump">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-6">
                    <div class="breadcrump-content">
                        <span class="page-name">Home</span>
                        <span class="icon"><i class="fas fa-chevron-right"></i></span>
                        <span class="page-name">Ajout scene</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrump end -->

    <!-- gallery begin -->
    <div class="gallery">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <div class="add-space section-title text-center">
                        <h2>Ajout Dialogue</h2>
                        <div class="scene-container">
                            <form action="add_dialogue" method="get" class="form-scene"> 
                                <div class="form-scene-content">
                                    <input type="hidden" name="idScene" value="<%=request.getParameter("idScene")%>">
                                    <div class="form-scene-item">
                                        <label for="personnage">Personnage</label>
                                        <select id="personnage" name="personnage">
                                            <% for (int idx = 0; idx < personnage.size(); idx++) { %>
                                            <option value="<%=personnage.get(idx).getId()%>"><%=personnage.get(idx).getNom()%></option>
                                            <% } %>
                                        </select>                         
                                    </div>
                                <div class="form-scene-item">
                                    <label for="texte">Texte</label>
                                    <textarea id="texte" name="contenu"></textarea>
                                </div>
                                <div class="form-scene-item">
                                    <label for="duree">Duree</label>
                                    <input type="time" name="duree" id="duree"/>
                                </div>
                                <div class="form-scene-item">
                                    <label for="emotion">Emotion</label>
                                    <select id="emotion" name="emotion">
                                        <% for (int idx = 0; idx < emotion.size(); idx++) { %>
                                        <option value="<%=emotion.get(idx).getId()%>"><%=emotion.get(idx).getType()%></option>
                                        <% } %>
                                    </select>                         
                                </div>
                                <div class="form-scene-item">
                                    <label for="action">Action</label>
                                    <textarea id="texte" name="action"></textarea>                    
                                </div>
                                <div class="form-scene-item">
                                    <button type="submit">Ajouter</button>
                                </div>    
                            </form>
                            <a id="lien" href="dialogue?idScene=<%=request.getParameter("idScene")%>" style="background: linear-gradient(90deg, #6c6b6b 100%, #cacaca 56%, #f7f7f7 0%);">Voir la liste</a>
                        </div>
                           
                    </div>
                </div>
            </div>
           
    <!-- footer begin -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                    
                </div>
                <div class="col-xl-7 col-lg-8">
                    <div class="footer-menu">
                        <nav class="navbar navbar-expand-lg">
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
                        </nav>
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
    <!-- wow js-->
    <script src="assets/js/wow.min.js"></script>
    <!-- main -->
    <script src="assets/js/main.js"></script>
</body>


</html>