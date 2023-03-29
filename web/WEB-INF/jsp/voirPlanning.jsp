<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Planning"%>
<%@page import="model.Film"%>
<!DOCTYPE html>
<html lang="zxx">

    <%@page import="dao.HibernateDao"%>
    <%@page import="service.PlateauService"%>
    <%@page import="model.Scene"%>
    <%@page import="model.Plateau"%>
    <%@page import="java.util.List"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> E-FILM </title>
        <!-- favicon -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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

        <%
            List<Planning> film = (List<Planning>) request.getAttribute("film");
            ArrayList<Integer> dist = (ArrayList<Integer>) request.getAttribute("distinct");

//            distinct
        %>

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
                            
                                <h1><a href="index.html">E-FILM</a></h1>
                            
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
                                        <a class="nav-link" href="planning">Planning</a>
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
                            <span class="page-name">Schedule</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrump end -->

        <!-- event schedule begin -->
        <div class="event-schedule">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-8">
                        <div class="section-title text-center">
                            <h2>Planning</h2>
                        </div>
                    </div>
                </div> <div class="section-title text-center">
                    <h2>'${titre}'</h2>
                    <h3>Jour ${jour-1}  le  <%                                Planning elems = film.get(0);
                        %><%="  "+elems.getDebut().getDayOfMonth()+"/"+elems.getDebut().getMonth().name()+"/2023"
                        
                        %></h3>

                </div>
                <div class="row">

                    <div class="col-xl-3 col-lg-3">
                        <%                            for (int idx = 0; idx < dist.size(); idx++) {
                                Integer elem = (Integer) dist.get(idx);
                        %>
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                            <a class="nav-link active"  href="voirPlanning?id=${id}&&jour=<%=elem%>&&titre=${titre}" role="tab"
                               aria-controls="v-pills-home" aria-selected="true">jour<span class="month-count">JOUR <%=elem - 1%></span></a>
                        </div>

                        <%
                            }
                        %>  
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                            <a class="btn btn-outline-danger"  href="planning" >Retour</a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                <div id="accordion">
                                    <%
                                        for (int idx = 0; idx < film.size(); idx++) {
                                            Planning elem = film.get(idx);
                                    %>

                                    <div class="card">

                                        <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-1.jpg" alt="">
                                            </div>
                                            <div class="part-text" style="color:white;">
                                                <h4>
                                                    <%=elem.getScene().getTitre()%>
                                                </h4>
                                                <p>
                                                <h5>
                                                    <%=elem.getDebut().format(DateTimeFormatter.ofPattern("hh:mm:ss"))%>
                                                    >>
                                                    <%=elem.getFin().format(DateTimeFormatter.ofPattern("hh:mm:ss"))%>

                                                </h5>

                                                </p>
                                            </div>
                                        </div>


                                    </div>

                                    <%
                                        }
                                    %>

                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- event schedule end -->

        <!-- countdown begin -->

        <!-- subscribe newsletter end -->

        <!-- contact begin -->

        <!-- contact end -->

        <!-- footer begin -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                        <div class="logo">
                            <a href="index-2.html"><img src="assets/img/logo.png" alt=""></a>
                        </div>
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