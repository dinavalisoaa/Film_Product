<%@page import="java.time.Month"%>
<%@page import="model.V_StatMois"%>
<%@page import="service.PlannificationService"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html>
<html lang="zxx">
    <!DOCTYPE html>
    <html lang="zxx">

        <%@page import="dao.HibernateDao"%>
        <%@page import="service.PersonnageService"%>
        <%@page import="model.Scene"%>
        <%@page import="model.Personnage"%>
        <%@page import="java.util.List"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            List<V_StatMois> data = (List<V_StatMois>) request.getAttribute("data");
        %> 
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
            <!--flaticon css--> 

            <link rel="stylesheet" href="assets/css/index.css">
            <link rel="stylesheet" href="assets/fonts/flaticon.css">
            <!--animate.css--> 
            <link rel="stylesheet" href="assets/css/animate.css">
            <!--Owl Carousel--> 
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <!--magnific popup--> 
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <!--stylesheet--> 
            <link rel="stylesheet" href="assets/css/style.css">

            <link rel="stylesheet" href="assets/chart-css/bootstrap-grid.css">
            <link rel="stylesheet" href="assets/chart-css/bootstrap.css">
            <link rel="stylesheet" href="assets/chart-css/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/chart-css/style.css">
            <!-- responsive -->
            <!--<link rel="stylesheet" href="assets/css/responsive.css">-->
        </head>

        <body>

            <!-- preloader begin -->
            <div class="preloader">
                <div class="loader">
                    <hr>
                    <hr>
                </div>
            </div>
            <jsp:include page="header.jsp"></jsp:include>
                <div class="breadcrump">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6">
                                <div class="breadcrump-content">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- breadcrump end -->
                <div class="gallery">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-11 col-lg-11">
                                <div class="add-space section-title text-center">
                                    <h2 style="font-size: 40px">
                                        Statistiques
                                    </h2> 


                                </div>
                                <style>
                                    .cons,con1,con2 {
                                        display: flex;
                                        flex: 1 200px;
                                        grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
                                        /*grid-auto-rows: minmax(80px, auto);*/
                                        /*gap: 20px;*/
                                    }
                                </style>
                                <!--<div style="height: 20%">-->
                                <div class="cons">
                                    <div class="con1">
                                        <div class="part-img">


                                            <img style="height:400px;width:600px;"  src="assets/img/Dark analytics-amico.svg" alt="">
                                        </div>
                                    </div>
                                    <div class="con2" style="margin-right: -100px">
                                        <div class="row">
                                            <div class="col-xl-12 col-md-12 col-sm-12"> 
                                                <div class="dashboard-box main-box-in-row">
                                                    <div class="headline">
                                                        <h3>Planning mensuel</h3>
                                                        <a href="#" class="btn btn-primary">Plateau</a>
                                                        <a href="#" class="btn btn-success">Personnage</a>
                                                        <a href="#"class="btn  btn-danger">Tournage</a>
                                                        
                                                    </div>
                                                    <div class="content"> 
                                                        <div class="chart" style="z-index: 1000;">
                                                            <canvas id="canvas" width="680" height="318"></canvas>
                                                        </div>
                                                    </div>
                                                </div>            
                                            </div> 

                                        </div>
                                        <h2>
                                        </h2>
                                        <style>
                                            .containera {
                                                display: grid;
                                                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                                                grid-auto-rows: minmax(80px, auto);
                                                gap: 20px;
                                            }
                                        </style>
                                    </div>
                                </div>


                            </div>

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
                        <form action="add_personnage" method="GET">
                            <label for="formFile">Personnage</label>
                            <p>

                            </p> 

                    </div>
                    <div class="idea-form">
                        <label>Nom</label>
                        <input type='text' class='form-control' name="nom"/>
                    </div>

                    <div class="idea-form">
                        <label>Photo</label>
                        <input type='file' class='form-control' name="photo"/>
                    </div>
                    <div class="idea-form">
                        <input type="submit"  id="idea-close"class="form-control"  value="Valider">
                    </div>
                    </form>
                </div>
            </div>
            <!-- footer end -->

            <!-- jquery -->
            <!--                <script src="assets/js/jquery.js"></script>
                             bootstrap 
                            <script src="assets/js/bootstrap.min.js"></script>
                             owl carousel 
                            <script src="assets/js/owl.carousel.js"></script>
                             magnific popup 
                            <script src="assets/js/jquery.magnific-popup.js"></script>
                             way poin js
                            <script src="assets/js/waypoints.min.js"></script>
                             wow js
                            <script src="assets/js/wow.min.js"></script>-->
            <!-- main -->

            <script src="assets/chart-js/jquery-3.3.1.min.js"></script> 
            <script src="assets/chart-js/bootstrap-select.min.js"></script> 
            <script src="assets/chart-js/chart.min.js"></script>
            <script src="assets/js/index.js"></script>
            <script src="assets/js/main.js"></script>

            <script>
                Chart.defaults.global.defaultFontFamily = "Nunito";
                var config = {
                type: 'line',
                        data: {
                        labels: [
            <%
                for (int i = 0; i < data.size(); i++) {
            %>
                        "<%=Month.of(data.get(i).getMois()).name()%>",
            <%
                }
            %>
                        ],
                                datasets: [{
                                label: "Nombre Tournage",
                                        backgroundColor: 'rgba(255,138,0,0.08)',
                                        borderColor: ' #dc3545',
                                        borderWidth: "3",
                                        data: [
            <%
                for (int i = 0; i < data.size(); i++) {
            %>
            <%=data.get(i).getPlanning()%>,
            <%
                }
            %>

                                        ],
                                        pointRadius: 4,
                                        titleFontSize: 18,
                                        pointHoverRadius: 4,
                                        pointHitRadius: 10,
                                        pointBackgroundColor: "#fff",
                                        pointHoverBackgroundColor: "#fff",
                                        pointBorderWidth: "3",
                                },
                                {
                                label: "Personnage indispo",
                                        backgroundColor: 'rgba(255,138,0,0.08)',
                                        borderColor: ' #28a745',
                                        borderWidth: "3",
                                        data: [
            <%
                for (int i = 0; i < data.size(); i++) {
            %>
            <%=data.get(i).getPersonnage()%>,
            <%
                }
            %>

                                        ],
                                        pointRadius: 4,
                                        titleFontSize: 18,
                                        pointHoverRadius: 4,
                                        pointHitRadius: 10,
                                        pointBackgroundColor: "#fff",
                                        pointHoverBackgroundColor: "#fff",
                                        pointBorderWidth: "3",
                                },
                                {
                                label: "Plateau indispo",
                                        backgroundColor: 'rgba(255,138,0,0.08)',
                                        borderColor: '#007bff',
                                        borderWidth: "3",
                                        data: [
            <%
                for (int i = 0; i < data.size(); i++) {
            %>
            <%=data.get(i).getPlateau()%>,
            <%
                }
            %>

                                        ],
                                        pointRadius: 4,
                                        titleFontSize: 18,
                                        pointHoverRadius: 4,
                                        pointHitRadius: 10,
                                        pointBackgroundColor: "#fff",
                                        pointHoverBackgroundColor: "#fff",
                                        pointBorderWidth: "3",
                                }]
                        },
                        options: {
                        responsive: true,
                                tooltips: {
                                backgroundColor: '#333',
                                        titleFontSize: 15,
                                        titleFontColor: '#fff',
                                        bodyFontColor: '#fff',
                                        bodyFontSize: 13,
                                        displayColors: false,
                                        xPadding: 10,
                                        yPadding: 10,
                                        intersect: false
                                },
                                legend: {display: false},
                                title: {display: false},
                                scales: {
                                x: {
                                display: true,
                                        scaleLabel: {
                                        display: true,
                                                labelString: 'Month'
                                        }
                                },
                                        y: {
                                        type: 'category',
                                                position: 'left',
                                                display: true,
                                                scaleLabel: {
                                                display: true,
                                                        labelString: 'Request State'
                                                },
                                                reverse: true
                                        }
                                }
                        }
                };
                window.onload = function () {
                var ctx = document.getElementById('canvas').getContext('2d');
                window.myLine = new Chart(ctx, config);
                };
        </script>
</body>

</html>