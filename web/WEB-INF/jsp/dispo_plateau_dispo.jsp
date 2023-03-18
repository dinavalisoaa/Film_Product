<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="zxx">
    <!DOCTYPE html>
    <html lang="zxx">

        <%@page import="dao.HibernateDao"%>
        <%@page import="service.PlateauService"%>
        <%@page import="model.Scene"%>
        <%@page import="model.Plateau"%>
        <%@page import="java.util.List"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
            List<Plateau> dispo = (List<Plateau>) request.getAttribute("dispo");

        %> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title> Dgocky â DJ Party & Night Club HTML Template </title>
            <!-- favicon -->
            <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
            <!-- bootstrap -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <!-- fontawesome icon  -->
            <link rel="stylesheet" href="assets/css/fontawesome.min.css">
            <!-- flaticon css -->

            <link rel="stylesheet" href="assets/css/index.css">
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
          
            <!-- preloader end -->

            <!-- header begin -->
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-6 d-xl-block d-lg-block d-flex align-items-center">
                                    <div class="logo">
                                        <a href="index-2.html"><img src="assets/img/logo.png" alt=""></a>
                                    </div>
                                </div>
                                <div class="d-xl-none d-lg-none d-block col-6">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                            aria-expanded="false" aria-label="Toggle navigation">
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
                                                <a class="nav-link" href="about.html">About <span
                                                        class="sr-only">(current)</span></a>
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
                                                <a class="nav-link active" href="blog.html">Blog</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="faq.html">Faq</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="contact.html">Contact</a>
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
                                <span class="page-name">Blog Details</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrump end -->

            <!-- blog details begin -->
            <div class="blog blog-details">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-8">

                            <div class="contact-form">
                                <form action="liste_plateau" method="get">
                                    <div class="row">
                                        <div class="col-xl-6 col-lg-6">
                                            <input type="date" name="date"class="form-control">
                                            <span></span>
                                        </div>
                                        <h3>Plateau dispo le:<%=
                                    LocalDate.parse((CharSequence)request.getAttribute("date"),DateTimeFormatter.ISO_LOCAL_DATE)
                                    %>
                                </h3>

                                        <div class="col-xl-6 col-lg-6">
                                            <button>Voir</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="comment-area">
                                <h3>LDa
                                </h3>
                                <p>
                                    <button style="width: 100px" onclick="openPopup()" class="btn btn-theme">Add</button>

                                    <a href="liste_plateau?date=${date}" class="btn btn-danger">
                                        Indispo
                                        
                                    </a>
                                    <a href="liste_plateau_dispo?date=${date}" class="btn btn-danger">
                                        Dispo
                                    </a>

                                </p>
                                <%
                                for (int idx = 0; idx < dispo.size(); idx++) {
                                        Plateau elem = dispo.get(idx);
                                        %>
                                 <div class="single-comment">
                                    <div class="part-img">
                                        <img src="assets/img/commentor-1.jpg" alt="">
                                    </div>
                                    <div class="part-text">
                                        <span class="commentor-name">Roscoe Alexander</span>
                                        <p>
                                            <%=elem.getDescription() %>
                                            
                                        </p> </div>
                                </div><%
                                    }
                                %>
                               
                                
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <!-- blog details end -->

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

            <div class="idea-full"  id="idea-full">
                <div class="idea-main-card" id="idea-main-card">
                    <div class="idea-card-head">
                        <h1>Ajout</h1>
                        <span class="idea-close" id="idea-close">&times</span>
                    </div>
                    <div class="idea-card-body">
                        <div class="idea-form">
                            <form action="add_indispo" method="GET">
                                <label for="formFile">Plateau</label>
                                <p>

                                    <select name="plateauId"class="form-control">
                                        <%
                                            for (int i = 0; i < plateau.size(); i++) {
                                                Plateau teau = plateau.get(i);
                                        %>
                                        <option value="<%=teau.getId()%>"><%=teau.getNom()%></option>
                                        <%%>
                                        <%
                                            }
                                        %>
                                    </select>   </p> 

                        </div>
                        <div class="idea-form">
                            <label>Date1</label>
                            <input type="date"  class="form-control"name="date1"/>
                        </div>

                        <div class="idea-form">
                            <label>Date2</label>
                            <input type="date" class="form-control"name="date2"/>
                        </div>
                        <div class="idea-form">
                            <input type="submit"  id="idea-close"class="form-control"  value="Valider">
                        </div>
                        </form>
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
                <script src="assets/js/index.js"></script>
                <script src="assets/js/main.js"></script>
        </body>

    </html>