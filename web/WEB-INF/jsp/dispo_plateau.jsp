
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
    List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
    List<Plateau> dispo = (List<Plateau>) request.getAttribute("dispo");
    PlateauService vice = (PlateauService) request.getAttribute("service");

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
            <!--            <div class="breadcrump">
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
                        </div>-->
            <div class="gallery">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="add-space section-title text-center">
                                <h2 style="font-size: 30px">Plateau Disponible
                                </h2>
                                <!--                                
                                --><button style="width: 100px;height: 2px;" onclick="openPopup()" class="btn btn-th.eme"></button>


                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12">

                            <div class="contact-form">
                                <form action="liste_plateau" method="get">
                                    <div class="row">
                                        <table class="table">
                                            <tr>
                                                <th>Date</th>
                                                <th>Sub</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input style="width:220px;" type="date" name="date"class="form-control">

                                                </td>
                                                <td>
                                                    <button style="width:120px;" >Voir</button>

                                                </td>
                                            </tr>
                                        </table>

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
                            <div class="row">

                                <table style="color:white;font-family: sans-serif;font-size: 20px; " class="table table-active">
                                    <th>Pic</th>
                                    <th>Nom</th>
                                    <th>Indisponibilite
                                    </th>
                                    <%
                                        for (int idx = 0; idx < dispo.size(); idx++) {
                                            Plateau elem = dispo.get(idx);
                                    %>
                                    <tr>
                                        <td>
                                            <img   style="height: 200px;width: 200px"  src="assets/img/Recording a movie-cuate.svg"/>

                                            <%=elem.getNom()%></td>      
                                        <td>
                                            <%   if (Integer.valueOf(request.getAttribute("etat").toString()) == 1) {
                                            %>
                                               <a href="#" class="btn btn-success">


                                                DISPO
                                            </a>
                                            <%
                                            } else {
                                                out.println(vice.getById(elem.getId()).getDate1() + " ->");
                                                out.println(vice.getById(elem.getId()).getDate2());
                                            %>
                                            <a href="#" class="btn btn-danger">


                                                DISPO
                                            </a>
                                            <%
                                                }
                                            %>


                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
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
                                    <form action="add_plateau_indispo" method="GET">
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
                                            </select>  </p> 

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
            <script src='assets/dist/jspdf.debug.js'></script>
            <script src='assets/libs/html2pdf.js'></script>
            <script>

                                    var pdf = new jsPDF('p', 'pt', 'letter');
                                    var canvas = pdf.canvas;
                                    canvas.height = 72 * 11;
                                    canvas.width = 72 * 8.5;
                                    ;

                                    html2pdf(document.body, pdf, function (pdf) {
                                        var iframe = document.createElement('iframe');
                                        iframe.setAttribute('style', 'position:absolute;right:0; top:0; bottom:0; height:100%; width:100%');
                                        document.body.appendChild(iframe);
                                        iframe.src = pdf.output('datauristring');

                                        //var div = document.createElement('pre');
                                        //div.innerText=pdf.output();
                                        //document.body.appendChild(div);
                                    }
                                    );
            </script>
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