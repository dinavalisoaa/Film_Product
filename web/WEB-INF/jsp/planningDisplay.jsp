<%@page import="model.Plateau"%>
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
        PlanningDate planning = (PlanningDate) request.getAttribute("planning");
        List<Calendar> lDate = planning.getlDate();
        ArrayList<Planning> lPlanning = planning.getlPlanning();
        List<Plateau> plateau = (List) request.getAttribute("plateau");
    %>
    <script>
        function displayP(index){
            document.querySelectorAll('.p').forEach((p)=>{
               p.style.display = 'none'; 
            });
            const displayer = document.querySelectorAll('#plateau'+index); 
            console.log(displayer);
            displayer.forEach((dis) => {
               dis.style.display = 'block'; 
            });
           // displayer.style.display = 'block';
           
        }
    </script>
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
                            <% for(int i = 0; i<plateau.size(); i++){%>
                            <a class="nav-link " id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
                               aria-controls="v-pills-home" aria-selected="true" onclick="displayP(<%= plateau.get(i).getId()%>)"><%= plateau.get(i).getNom()%><span class="month-count"></span></a>
                           
                            <%}%>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="planning-container">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

                                    <div id="accordion">

                                        <%
                                            for (int iS = 0; iS < lPlanning.size(); iS++) {
                                        %>
                                        <div id="plateau<%=lPlanning.get(iS).getScene().getPlateau().getId()%>" class="p" style="display:none">
                                            <div class="card" >
                                                <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">

                                                    <div class="part-text">
                                                        <h3><%=lPlanning.get(iS).getScene().getTitre()%></h3>
                                                        <span class="time"><%= lPlanning.get(iS).getDebut().toString().split("T")[0]%></span> 
                                                        <br/>
                                                        <span class="time"><i class="fas fa-clock"></i> <%= lPlanning.get(iS).getDebut().toString().split("T")[1]%> - <%= lPlanning.get(iS).getFin().toString().split("T")[1]%></span> <span class="location"><i class="fas fa-globe"></i> Location: <%= lPlanning.get(iS).getScene().getPlateau().getNom()%></span>
                                                    </div>
                                                </div>

                                            </div>
                                            <hr/>
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