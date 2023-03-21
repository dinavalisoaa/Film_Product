<%@page import="java.util.List"%>
<%@page import="model.Scene"%>
<%
    List<Scene> scene = (List<Scene>) request.getAttribute("scene");
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
                                <h2>Generate planning </h2>
                            </div>
                        </div>
                    </div>
                    <form action="<%= request.getContextPath()%>/creerPlanning" method="get">
                    <div class="intervalle">
                        <div>
                            <label for="date1">Debut</label>
                            <input class="form-control" id="date1" type="date" name="debut">
                        </div>
                        <div>
                            <label for="date1">Fin</label>
                            <input class="form-control" id="date1" type="date" name="fin">
                        </div>
                    </div>
                    <br/>
                    <div class="add-space section-title spacing" >
                        <h2 class="title-scene" style="font-size: 50px;">Choose scene</h2>

                    </div>
                    <div class="row">

                        <% for (int idx = 0; idx < scene.size(); idx++) {%>
                        <div class="col-xl-4 col-lg-4 col-sm-6">
                            <div class="single-img" id="card-scene">
                                <input type="checkbox" name="scene[]" style="width: 200px;height:20px" class="single-img"  value="<%= scene.get(idx).getId()%>">
                                <b style="color: white"><%= scene.get(idx).getTitre()%></b>
                            </div>
                            </input>
                        </div>
                        <% }%>  
                    </div>
                    <div class="form-scene-item">
                        <button type="submit">Cr�er</button>
                    </div>    
                </form>
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