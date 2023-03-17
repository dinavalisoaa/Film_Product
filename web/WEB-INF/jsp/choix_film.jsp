<%@page import="java.util.List"%>
<%@page import="model.Film"%>
<%
    List<Film> film = (List<Film>) request.getAttribute("film");
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
        <link rel="stylesheet" href="assets/css/index.css">

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
            <div class="breadcrump">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6">
                            <div class="breadcrump-content">
                                <span class="page-name">Home</span>
                                <span class="icon"><i class="fas fa-chevron-right"></i></span>
                                <span class="page-name">Gallery</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="gallery">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="add-space section-title text-center">
                                <h2>Movies
                                </h2>
                                <button style="width: 100px" onclick="openPopup()" class="btn btn-theme">Add</button>

                                <div class="idea-full"  id="idea-full">
                                    <div class="idea-main-card" id="idea-main-card">
                                        <div class="idea-card-head">
                                            <h1>Ajout</h1>
                                            <span class="idea-close" id="idea-close">&times</span>
                                        </div>
                                        <div class="idea-card-body">
                                            <form action="fiches" method="POST" enctype="multipart/form-data">
                                                <label for="formFile">Upload Your photo</label>
                                                <p>
                                                    <input class="form-control" name="filephoto" type="file" id="filephoto">
                                                </p>         </div>
                                            <div class="idea-form">
                                                <input type="submit"  id="idea-close"  value="Valider">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <% for (int idx = 0; idx < film.size(); idx++) {%>
                    <div class="col-xl-4 col-lg-4 col-sm-6">
                        <div class="single-img" style="height:300px;">
                            <img src="assets/img/gallery-7.jpg"" alt="">
                            <div class="hover-effect">
                                <a href="liste_scene?film=<%=film.get(idx).getId()%>#DINA1"><i class="fas fa-play"> 
                                        <div class="date-on-img">
                                        </div></i>
                                    <h2 style="color: white"><%=film.get(idx).getTitre()%></h2>    
                                </a>
                            </div>
                        </div>           </div>
                        <% }%>  
                </div>                  

            </div>
        </div>
    </div>
    <!-- gallery begin -->

    <!-- gallery end -->

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

    <script src="assets/js/index.js"></script>
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