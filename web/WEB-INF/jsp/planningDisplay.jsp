<%@page import="static java.util.Calendar.YEAR"%>
<%@page import="static java.util.Calendar.MONTH"%>
<%@page import="static java.util.Calendar.DAY_OF_MONTH"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Planning"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="static java.util.Calendar.LONG"%>
<%@page import="static java.util.Calendar.DAY_OF_WEEK"%>
<%@page import="java.util.List"%>
<%@page import="model.PlanningDate"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planning </title>
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
<%
    PlanningDate planning  = (PlanningDate)request.getAttribute("planning");
    List<Calendar> lDate = planning.getlDate();
    ArrayList<Planning> lPlanning = planning.getlPlanning();
%>
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
                                        <a class="nav-link active" href="schedule.html">Schedule</a>
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
    <div class="planning-container">
        <%
            for(int iDate = 0; iDate<lDate.size(); iDate++){
        %>
        <p><a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
              aria-controls="v-pills-home" aria-selected="true"><%= lDate.get(iDate).getDisplayName(DAY_OF_WEEK, LONG, Locale.US) %><span class="month-count"><%= lDate.get(iDate).get(DAY_OF_MONTH) %> <%= lDate.get(iDate).getDisplayName(MONTH, LONG, Locale.US) %> <%= lDate.get(iDate).get(YEAR) %></span></a></p>
        <%
            }
        %>
    </div>
    <div class="event-schedule">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <div class="section-title text-center">
                        <h2>Planning</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-lg-3">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
                            aria-controls="v-pills-home" aria-selected="true">Monday<span class="month-count">14 Feburary</span></a>
                        <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
                            aria-controls="v-pills-profile" aria-selected="false">Tuesday<span class="month-count">15 Feburary</span></a>
                        <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
                            aria-controls="v-pills-messages" aria-selected="false">Wednesday<span class="month-count">16 Feburary</span></a>
                        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
                            aria-controls="v-pills-settings" aria-selected="false">Thursday<span class="month-count">17 Feburary</span></a>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-1.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Web Design Principles and Best Prectics</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                            
                                    <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                            phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                            Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-2.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>15 Free Productive Design Tools</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-3.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Getting Start With Sketch App</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapseThree" class="collapse" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <div id="accordion2">
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse4" aria-expanded="false"
                                        aria-controls="collapse4" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-1.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Web Design Principles and Best Prectics</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                            
                                    <div id="collapse4" class="collapse" data-parent="#accordion2">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" data-toggle="collapse" data-target="#collapse5" aria-expanded="true"
                                        aria-controls="collapse5" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-2.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>15 Free Productive Design Tools</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapse5" class="collapse show" data-parent="#accordion2">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse6" aria-expanded="false"
                                        aria-controls="collapse6" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-3.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Getting Start With Sketch App</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapse6" class="collapse" data-parent="#accordion2">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <div id="accordion3">
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse7" aria-expanded="false"
                                        aria-controls="collapse7" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-1.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Web Design Principles and Best Prectics</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                            
                                    <div id="collapse7" class="collapse" data-parent="#accordion3">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse8" aria-expanded="false"
                                        aria-controls="collapse8" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-2.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>15 Free Productive Design Tools</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapse8" class="collapse" data-parent="#accordion3">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" data-toggle="collapse" data-target="#collapse9" aria-expanded="true"
                                        aria-controls="collapse9" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-3.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Getting Start With Sketch App</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapse9" class="collapse show" data-parent="#accordion3">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            
                            <div id="accordion4">
                                <div class="card">
                                    <div class="card-header" data-toggle="collapse" data-target="#collapse10" aria-expanded="true"
                                        aria-controls="collapse10" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-1.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Web Design Principles and Best Prectics</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                            
                                    <div id="collapse10" class="collapse show" data-parent="#accordion4">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse11" aria-expanded="false"
                                        aria-controls="collapse11" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-2.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>15 Free Productive Design Tools</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapse11" class="collapse" data-parent="#accordion4">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse12" aria-expanded="false"
                                        aria-controls="collapse12" role="button">
                                        <div class="part-img">
                                            <img src="assets/img/gallery-3.jpg" alt="">
                                        </div>
                                        <div class="part-text">
                                            <h3>Getting Start With Sketch App</h3>
                                            <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                        </div>
                                    </div>
                                    <div id="collapse12" class="collapse" data-parent="#accordion4">
                                        <div class="card-body">
                                            <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                            <span class="name">Alison Burgass</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- event schedule end -->

    <!-- countdown begin -->
   
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