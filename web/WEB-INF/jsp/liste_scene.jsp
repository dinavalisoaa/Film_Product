<%@page import="service.DialogueService"%>
<%@page import="model.Dialogue"%>
<%@page import="model.Plateau"%>
<%@page import="service.PlateauService"%>
<%@page import="service.FilmService"%>
<%@page import="dao.HibernateDao"%>
<%@page import="model.Scene"%>
<%@page import="java.util.List"%>
<%
    List<Plateau> plateau = (List<Plateau>) request.getAttribute("plateau");
    List<Scene> scene = (List<Scene>) request.getAttribute("scene");
    PlateauService plat = (PlateauService) request.getAttribute("service");    
    DialogueService d = (DialogueService) request.getAttribute("diS");

//    List<Dialogue> Dialogue = (List<Dialogue>) request.getAttribute("dialogue");

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
                  <link rel="stylesheet" href="assets/css/index.css">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/liste-scene.css">

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
        <!-- breadcrump end -->

        <!-- gallery begin -->
        <div class="gallery">
            <div class="container">
                <div class="add-space section-title spacing" >
                    <h2 class="title-scene" style="font-size: 50px;">Scene</h2>
                    <a href="scene?film=<%=request.getParameter("film")%>"><div class="ajout"><b>Ajout <i class="fa fa-plus"></i></b></div></a>
                </div>
                <div class="row">
                    <table width="800">
                        <form action="liste_scene" method="get">
                            <tr>
                            <input type="hidden" name="search" value="1">
                            <input type="hidden" name="film" value="<%=request.getParameter("film")%>">
                            <td><input type="text" name="mot"></td>
                            <td><select name="plateau">
                                    <option value="">Plateau</option>
                                    <% for (int idx = 0; idx < plateau.size(); idx++) {%>
                                    <option value="<%=plateau.get(idx).getId()%>"><%=plateau.get(idx).getNom()%></option>
                                    <% } %>
                                </select></td>
                            <td><input type="date" name="date"></td>
                            <td><div class="form-scene-item">
                                    <button type="submit">Rechercher</button>
                                </div></td>    
                            </tr>
                        </form>
                    </table>
                </div>
                <br/><br/>
            </div>
            <div class="event-schedule">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="section-title text-center">
                                <h2>Scene</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-3 col-lg-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link"  href="scene?film=<%=scene.get(0).getId() %>" 
                                   >
                                     <span class="month-count">
                                         <button class="btn-primary">ADD+</button>
                                     </span></a>
                                     <a class="nav-link" id="v-pills-home-tab-<%=0%>" data-toggle="pill" href="#DINA<%=scene.get(0).getId()%>" role="tab"
                                   aria-controls="v-pills-home-<%=0%>" aria-selected="true">Scene:<%=scene.get(0).getId() %>
                                     <span class="month-count"><%=scene.get(0).getTitre() %>
                                     </span></a>


                                <%
                                    for (int idx = 1; idx < scene.size(); idx++) {
                                        Scene elem = scene.get(idx);
                                %>
                                 <a class="nav-link" id="v-pills-home-tab-<%=idx%>" data-toggle="pill" href="#DINA<%=elem.getId()%>" role="tab"
                                   aria-controls="v-pills-home-<%=idx%>" aria-selected="false">Scene:<%=elem.getId() %>
                                     <span class="month-count"><%=elem.getTitre() %>
                                     </span></a>

                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                
                                <%
                                    for (int idx = 0; idx < scene.size(); idx++) {
                                        Scene elems = scene.get(idx);
                                %>
                                <div class="tab-pane show fade" id="DINA<%=elems.getId()%>" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <div id="accordion">
                                        <div class="card">
                                            <div class="card-header collapsed" aria-expanded="false" aria-controls="collapseThree" role="button">
                                                <div class="part-text">
                                                    <a href="dialogue_formulaire?idScene<%=elems.getId() %>">
                                                        <button class="btn-primary">Ajouter dialogue</button>
                                                    </a>
                                                </div>
                                            </div>
                                            
                                        </div>  
                                        <%  int cpt=0;
                                        List<Dialogue> Dialogue=d.listeDialogue(elems.getId());
                                        for (int id = 0; id < Dialogue.size(); id++) {
                                                Dialogue elem = Dialogue.get(id);
                                       {
%>
                                        <div class="card">
                                            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree<%=id%>" aria-expanded="false" aria-controls="collapseThree" role="button">
                                                <div class="part-img">
                                                    <img src="<%=d.getPersonnage(elem.getPersonnageId()).getPhoto() %>" alt="">
                                                </div>
                                                <div class="part-text">
                                                    <h3>Acteur<%=elem.getPersonnageId()%>:<p><%=elem.getContenu() %></p></h3>
                                                </div>
                                            </div>
                                            <div id="collapseThree<%=id%>" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    <p>Action:<%=elem.getAction() %></p>
                                                    <p>Durer<%=elem.getDuree() %></p>
                                                </div>
                                            </div>
                                        </div>   <% }
                                            }

                                        %>
                                    </div>

                                </div>
                                <%                             }
                                %>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
                <script src="assets/js/index.js"></script>
            <script src="assets/js/wow.min.js"></script>
            <!-- main -->
            <script src="assets/js/main.js"></script>
    </body>


</html>