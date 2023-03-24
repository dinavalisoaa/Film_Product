<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
//        List<Calendar> lDate = planning.getlDate();
        ArrayList<String> lDate = planning.distinctDate();
        ArrayList<Planning> lPlanning = planning.getlPlanning();
        List<Plateau> plateau = (List) request.getAttribute("plateau");
    %>
    <script>
        function displayP(index) {
            document.querySelectorAll('.p').forEach((p) => {
                p.style.display = 'none';
            });
            const displayer = document.querySelectorAll('#plateau' + index);
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

        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->

            <!-- breadcrump begin -->

            <!-- breadcrump end -->

            <!-- event schedule begin -->
            <div class="event-schedule">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="section-title text-center">
                                <h2>Planning</h2>

                                <h3>
                                    <a href="#" class="btn btn-danger">
                                    ${debut}

                                </a>
                                >

                                <a href="#" class="btn btn-danger">
                                    ${fin}

                                </a>
                                    <p>
                                         <a class="btn btn-success "a-toggle="pill" href="generer?<%=request.getQueryString()%>" role="tab"
                                   aria-controls="v-pills-home" aria-selected="true">Enregister<span class="month-count"></span></a>

                                    </p>
                            </h3>

                        </div>
                    </div>
                </div>
                <div class="col-xl-12 col-lg-12">
                    <div class="nav grid nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <% for (int i = 0; i < lDate.size(); i++) {%>
                        <a class="nav-link " id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
                           aria-controls="v-pills-home" aria-selected="true" onclick="displayP(<%=lDate.get(i)%>)">
                            <%=LocalDate.parse(Planning.StringToDate(lDate.get(i))).format(DateTimeFormatter.ofPattern("d MMM uuuu"))%>
                            <span class="month-count"></span></a>

                        <%}%>

                    </div>
                </div>                    <div class="col-xl-12 col-lg-12">
                    <div class="planning-container">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

                                <div id="accordion">

                                    <%
                                        for (int iS = 0; iS < lPlanning.size(); iS++) {
                                    %>
                                    <div id="plateau<%=lPlanning.get(iS).DatetoString()%>" class="p" style="display:none">
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
                                         <div class="card" >
                                            <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">

                                                <div class="part-text">
                                                    <br/>
                                                </div>
                                            </div>

                                        </div>
                                        <hr/>
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