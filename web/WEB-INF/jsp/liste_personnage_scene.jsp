
<%@page import="service.PersonnageService"%>
<%@page import="model.Personnage"%>
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
    List<Personnage> personnage = (List<Personnage>) request.getAttribute("personnage");

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

            <div class="gallery">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="add-space section-title text-center">
                                <h2 style="font-size: 30px">
                                    Personnage du scene

                                </h2>
                                <h4 style="color:white">
                                    "${scene.getTitre()}"

                            </h4>
                            <p style="color:white">
                                ${debut} jusqu'a  ${fin}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-lg-12">

                        <div class="contact-form">

                        </div>
                        <div class="comment-area">



                            <style>
                                .containera {
                                    display: grid;
                                    grid-template-columns: repeat(auto-fill, minmax(190px, 1fr));
                                    grid-auto-rows: minmax(80px, auto);
                                    gap: 20px;
                                }

                            </style>
                            <div class="row">

                                <table style="color:white;font-family: sans-serif;font-size: 20px; " class="table table-active">
                                    <th>Pic</th>
                                    <th>Nom</th>
                                    <th>E-mail
                                    </th>
                                    <%                                        for (int idx = 0; idx < personnage.size(); idx++) {
                                            Personnage elem = personnage.get(idx);
                                    %>
                                    <tr>
                                        <td>
                                            <div class="box1">
                                                <img src="<%=elem.getPhoto()%>"style="width:80px"/>
                                            </div>
                                        </td>

                                        <td><%=elem.getNom()%></td>    
                                        <td><u>
                                                <%=elem.getEmail()%>
                                            </u></td>    


                                        <td>
                                            <a href="pdf?mois=${mois}&sceneId=${scene.getId()}&debut=${debut}&fin${fin}&personnageId=<%=elem.getId() %>" class="btn btn-success">
                                                Envoyer e-mail
                                            </a> 

                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>


                        </div>
                    </div>                  


                </div>
            </div>
            <!-- gallery begin -->

            <!-- gallery end -->

            <!-- footer begin -->
            <div class="footer" style="margin-bottom: 200px">
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