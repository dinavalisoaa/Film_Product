<%@page import="model.Plateau"%>
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
            List<Scene> dispo = (List<Scene>) request.getAttribute("scene");
            Plateau plateau = (Plateau) request.getAttribute("plateau");
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
                                    <span class="page-name">Home</span>
                                    <span class="icon"><i class="fas fa-chevron-right"></i></span>
                                    <span class="page-name">Blog Details</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- breadcrump end -->
                <div class="gallery">
                    <div class="container">
                        <div class="row justify-content-center">

                            <div class="col-xl-12 col-lg-12">
                                <div class="single-blog">
                                    <div class="row">
                                        <div class="col-xl-12 col-lg-12">
                                            <div class="part-img">
                                                <div class="date-on-img">
                                                    <span class="date">04 may</span>
                                                </div>
                                            </div>

                                            <div class="containera">
                                            <%                                        for (int idx = 0; idx < dispo.size(); idx++) {
                                                    Scene elem = dispo.get(idx);
                                            %>

                                            <div class="box1"> <div class="">
                                                    <div class="part-img">
                                                        <img src="assets/img/about.png" alt="">
                                                    </div>
                                                    <div class="part-text">
                                                        <span class="commentor-name">
                                                            <h2 style="font-size: 30px"> 
                                                                <%=elem.getTitre()%>
                                                            </h2>
                                                        </span>
                                                        <p>
                                                            <a href='#' class="btn btn-primary"onclick="openModal(<%=elem.getId()%>)" >Ajouter</a>

                                                        </p>

                                                    </div>
                                                </div></div>
                                            <div class="idea-full"  id="idea-full-<%=elem.getId()%>">
                                                <div class="idea-main-card" id="idea-main-card">
                                                    <div class="idea-card-head">
                                                        <h1>Modification Acteur</h1>
                                                        <span class="idea-close" id="idea-close-<%=elem.getId()%>">&times</span>
                                                    </div>
                                                    <div class="idea-card-body">
                                                        <div class="idea-form">
                                                            <form action="up_personnage" method="GET">
                                                                <label for="formFile">Personnage</label>
                                                                <p>

                                                                </p> 

                                                        </div>
                                                        <div class="idea-form">
                                                            <label>Nom</label>
                                                            <input type='text' class='form-control' value='' name="nom"/>
                                                        </div>
                                                        <input type='hidden' class='form-control' value='<%=elem.getId()%>' name="id"/>

                                                        <div class="idea-form">
                                                            <label>Photo</label>
                                                        </div>
                                                        <div class="idea-form">
                                                            <input type="submit"  id="idea-close-<%=elem.getId()%>"class="form-control"  value="Valider">
                                                        </div>
                                                        </form>
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
                        <p>
                            <!--<button style="width: 100px" onclick="openPopup()" class="btn btn-theme">Add</button>-->
                            <a href='#' class="btn btn-success"onclick="openPopup()" >Ajouter</a>
                        </p>
                        <style>
                            .containera {
                                display: grid;
                                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                                grid-auto-rows: minmax(80px, auto);
                                gap: 20px;
                            }
                            .box1{
                                transition: all 0.3s ease 0s ;

                            }


                        </style>

                    </div>
                </div>
            </div>                    </div>
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