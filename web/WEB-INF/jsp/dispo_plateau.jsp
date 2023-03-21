
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
        <%@page import="dao.HibernateDao"%>
        <%@page import="service.PlateauService"%>
        <%@page import="model.Scene"%>
        <%@page import="model.Plateau"%>
        <%@page import="java.util.List"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
            List<Plateau> dispo = (List<Plateau>) request.getAttribute("dispo");
            PlateauService vice=(PlateauService)request.getAttribute("service");

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
<!--                                
                                --><button style="width: 100px;height: 4px;" onclick="openPopup()" class="btn btn-th.eme"></button>

                                
                        </div>
                    </div>
                </div>
                <div class="row">
 <div class="col-xl-12 col-lg-12">

                            <div class="contact-form">
                                <form action="liste_plateau" method="get">
                                    <div class="row">
                                        <div class="col-xl-3 col-lg-3">
                                            <input style="width:220px;" type="date" name="date"class="form-control">
                                            <span></span>
                                        </div>

                                        <div class="col-xl-3 col-lg-3">
                                            <button style="width:120px;" >Voir</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="comment-area">
                                <h3>

                                    <%   if (Integer.valueOf(request.getAttribute("etat").toString()) == 1) {
                                    %>
                                    Listes des Diponibles
                                    <%
                                    } else {
                                    %>
                                    Listes des Indiponibles
                                    <%
                                        }
                                    %>
                                </h3>
                                <h2>
                                    <%LocalDate da = LocalDate.parse(request.getAttribute("date").toString());
                                    %>
                                    Date:<%=da%>
                                </h2>
                                
                                        <p>
                                            <a href="#"  onclick="openPopup()" class="btn btn-primary">Ajouter</a>
                                            <a href="liste_plateau?date=${date}" class="btn btn-danger">
                                                
                                                Indispo


                                            </a>
                                            <a href="liste_plateau_dispo?date=${date}" class="btn btn-success">
                                                Dispo


                                            </a>
                                                 <a href="liste_plateau?date=123" class="btn btn-danger">
                                                
                                              Etat de disponibilite


                                            </a>

                                        </p>
                                <style>
                                    .containera {
                                        display: grid;
                                        grid-template-columns: repeat(auto-fill, minmax(190px, 1fr));
                                        grid-auto-rows: minmax(80px, auto);
                                        gap: 20px;
                                    }

                                </style>
                                <div class="containera">
                                    <%
                                    if(dispo.size()==0){
                                    %>
                                    <div class="box1"> <div class="">
                                            <div class="part-img">
    
                                            </div>
                                            <div class="part-text">
                                                <span class="commentor-name">
                                                    <h3>
                                                          Pas de resultat
                                                    </h3>
                                                </span>
                                                <p>

                                                </p>
                                               
                                            </div>
                                        </div></div>
                                    <%
                                    }
                                    %>
                                    <%
                                        for (int idx = 0; idx < dispo.size(); idx++) {
                                            Plateau elem = dispo.get(idx);
                                    %>

                                    <div class="box1"> <div class="">
                                            <div class="part-img">
//                                                <img src="assets/img/banner-bottom-img.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <span class="commentor-name">
                                                    <%=elem.getNom()%>
                                                </span>
                                                <p>
                                                    <%=elem.getDescription()%>

                                                </p>
                                                <h4 style="color:#ff3366 ">
                                                    <%   if (Integer.valueOf(request.getAttribute("etat").toString()) == 1) {
                                                    %>

                                                    <a href="detail_plateau?id=<%=elem.getId() %>" class="btn btn-success">
                                                        Diponible
                                                    </a>
                                                    <%
                                                    } else {
                                                    %>

                                                   <a href="detail_plateau?id=<%=elem.getId() %>" class="btn btn-danger">
                                                        Indisponible 
                                                        <%= vice.getById(elem.getId()).getDate1() %>
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </h4>
                                            </div>
                                        </div></div>
                                        <%
                                            }
                                        %>

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
                        <!--<a href="index-2.html"><img src="assets/img/logo.png" alt=""></a>-->
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
    <script src="assets/js/bootstrap-modalmanager.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
</body>


</html>