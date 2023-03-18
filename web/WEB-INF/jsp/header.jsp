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
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>

<body>

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
                                        <a class="nav-link" href="liste_plateau">Plateau</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="personnage">Personnage</a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="liste_jour_ferie">Jour Ferie</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="planning">Plannification</a>
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