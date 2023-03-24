<%@page import="service.SceneService"%>
<%@page import="service.PlannificationService"%>
<%@page import="java.sql.Date"%>
<%@page import="model.Plannification"%>
<%@page import="service.DialogueService"%>
<%@page import="model.Dialogue"%>
<%@page import="model.Plateau"%>
<%@page import="service.PlateauService"%>
<%@page import="service.FilmService"%>
<%@page import="dao.HibernateDao"%>
<%@page import="model.Scene"%>
<%@page import="java.util.List"%>
<%
    List<Plannification> liste = (List<Plannification>) request.getAttribute("liste");
    List<Date> date = (List<Date>) request.getAttribute("date");
    PlannificationService service = (PlannificationService) request.getAttribute("service");
    SceneService sceneservice = (SceneService) request.getAttribute("sceneservice");
    PlateauService plateauservice = (PlateauService) request.getAttribute("plateauservice");
    List<Plateau> lPlateau = (List<Plateau>) request.getAttribute("lPlateau");
    List<Scene> lScene = (List<Scene>) request.getAttribute("lScene");

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
        <jsp:include page="header.jsp"></jsp:include>
        <!-- header end -->

        <!-- breadcrump begin -->
       
        <!-- breadcrump end -->

        <!-- gallery begin -->
        <div class="gallery">
            <!--            <div class="container">
                            <div class="add-space section-title spacing" >
                                <h2 class="title-scene" style="font-size: 50px;">Scene</h2>
                                <a href="scene?film=<%//=request.getParameter("film")%>"><div class="ajout"><b>Ajout <i class="fa fa-plus"></i></b></div></a>
                            </div>
                            <div class="row">
                                <table width="800">
                                    <form action="liste_scene" method="get">
                                        <tr>
                                        <input type="hidden" name="search" value="1">
                                        <input type="hidden" name="film" value="<%//=request.getParameter("film")%>">
                                        <td><input type="text" name="mot"></td>
                                        <td><select name="plateau">
                                                <option value="">Plateau</option>
            <% //for (int idx = 0; idx < plateau.size(); idx++) {%>
            <option value="<%//=plateau.get(idx).getId()%>"><%//=plateau.get(idx).getNom()%></option>
            <% //} %>
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
</div>-->
            <div class="event-schedule">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="section-title text-center">
                                <h2 style="font-size: 40px">
                                        Plannifications detaillés
                                </h2> 
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-3 col-lg-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                                <a class="nav-link" id="v-pills-home-tab-<%=0%>" data-toggle="pill" href="#DINA<%=date.get(0)%>" role="tab"
                                   aria-controls="v-pills-home-<%=0%>" aria-selected="true">Date 1: <%=date.get(0)%>
                                    <span class="month-count"><%=date.get(0)%>
                                    </span></a>


                                <%
                                    for (int idx = 1; idx < date.size(); idx++) {
                                        Date elem = date.get(idx);
                                %>
                                <a class="nav-link" id="v-pills-home-tab-<%=idx%>" data-toggle="pill" href="#DINA<%=elem%>" role="tab"
                                   aria-controls="v-pills-home-<%=idx%>" aria-selected="false">Date <%=idx + 1%>: <%=elem%>
                                    <span class="month-count"><%=elem%>
                                    </span></a>

                                <%
                                    }
                                %>
                            </div>
                        </div>

                        <div class="col-xl-9 col-lg-9">
                            <a href='#' class="btn btn-success"onclick="openModal('add')" >Ajouter</a>

                            <div class="tab-content" id="v-pills-tabContent">

                                <%
                                    for (int idx = 0; idx < date.size(); idx++) {
                                        Date elems = date.get(idx);
                                %>
                                <div class="tab-pane show fade" id="DINA<%=elems%>" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <div id="accordion">
                                        <div class="card">
                                            <div class="card-header collapsed" aria-expanded="false" aria-controls="collapseThree" role="button">
                                                <!--                                                <div class="part-text">
                                                                                                    <a href="dialogue_formulaire?idScene<%//=elems %>">
                                                                                                        <button class="btn-primary">ADD+</button>
                                                                                                    </a>
                                                                                                </div>-->
                                            </div>

                                        </div>  
                                        <%  int cpt=0;
                                            List<Plannification> plan = service.plannificationByDate(elems);
                                            for (int id = 0; id < plan.size(); id++) {
                                                Plannification elem = plan.get(id);
                                                {
                                        %>                                                          
                                        <div class="card">
                                            <div class="part-text">
                                                <h3 style="text-align: center;color:white"><%=sceneservice.getPlateau(elem.getPlateauid()).getNom()%></h3>

                                            </div>
                                            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree<%=id%>" aria-expanded="false" aria-controls="collapseThree" role="button">
                                                <div class="part-img">
                                                    <img src="assets/img/gallery-3.jpg" alt="">
                                                </div>
                                                <div class="part-text">
                                                    <h3>
                                                        <p><%=sceneservice.getScene(elem.getSceneid()).getTitre()%></p></h3>
                                                    <p style="font-size:20px;">
                                                        <i class="fas fa-clock"></i> 

                                                        <%=elem.getDatedebut().toString().split(" ")[1]%> - <%=elem.getDatefin().toString().split(" ")[1]%>
                                                        <span class="time">
                                                        </span>
                                                    </p>

                                                </div>
                                                <a class="nav-link"  href="#" >
                                                    <span class="month-count">
                                                        <a href='#' class="btn btn-primary"onclick="openModal(<%=elem.getId()%>)" >Modifier</a>
                                                    </span>
                                                </a>
                                            </div>
                                            <div id="collapseThree<%=id%>" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    <p>Plateau: <%=plateauservice.getPlateauById(elem.getPlateauid()).getNom()%></p>
                                                    <p><%=plateauservice.getPlateauById(elem.getPlateauid()).getLongitude()%> - <%=plateauservice.getPlateauById(elem.getPlateauid()).getLatitude()%></p>
                                                </div>
                                            </div>
                                        </div> 

                                        <div class="idea-full"  id="idea-full-<%=elem.getId()%>">
                                            <div class="idea-main-card" id="idea-main-card">
                                                <div class="idea-card-head">
                                                    <h1>Edit Plannification</h1>
                                                    <span class="idea-close" id="idea-close-<%=elem.getId()%>">&times</span>
                                                </div>
                                                <div class="idea-card-body">
                                                    <div class="idea-form">
                                                        <form action="update_plannification" method="GET">
                                                            <label for="formFile">Personnage</label>
                                                            <p>

                                                            </p> 

                                                    </div>
                                                    <div class="idea-form">
                                                        <label>Scene</label>
                                                        <select class="form-control"name="sceneid" value="<%=elem.getId()%>">
                                                            <%
                                                                for (int jd = 0; jd < lScene.size(); jd++) {
                                                                    Scene Selem = lScene.get(jd);
                                                            %>
                                                            <option value="<%=Selem.getId()%>">
                                                                <%=Selem.getTitre()%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                    <input type='hidden' class='form-control' value='<%=elem.getId()%>' name="id"/>
                                                    <div class="idea-form">
                                                        <label>Debut:<%=elem.getDatedebut()%></label>
                                                        <input type="datetime-local" class="form-control" name="debut" value="<%=elem.getDatedebut()%>">
                                                    </div>
                                                    <div class="idea-form">
                                                        <label>Fin:<%=elem.getDatefin()%></label>
                                                        <input type="datetime-local" class="form-control" name="fin" value="<%=elem.getDatefin()%>">
                                                    </div>
                                                    <div class="idea-form">
                                                        <input type="submit"  id="idea-close-<%=elem.getId()%>"class="form-control"  value="Valider">
                                                    </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <% }
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

            <div class="idea-full"  id="idea-full-add">
                <div class="idea-main-card" id="idea-main-card">
                    <div class="idea-card-head">
                        <h1>Add Plannification</h1>
                        <span class="idea-close" id="idea-close-add">&times</span>
                    </div>
                    <div class="idea-card-body">
                        <div class="idea-form">
                            <form action="add_plannification" method="GET">
                                <label for="formFile">Personnage</label>
                                <p>

                                </p> 

                        </div>
                        <div class="idea-form">
                            <label>Plateau</label>
                            <select class="form-control"name="plateauid" >
                                <%
                                    for (int jd = 0; jd < lPlateau.size(); jd++) {
                                        Plateau Selem = lPlateau.get(jd);
                                %>
                                <option value="<%=Selem.getId()%>">
                                    <%=Selem.getNom()%>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="idea-form">
                            <label>Scene</label>
                            <select class="form-control"name="sceneid" >
                                <%
                                    for (int jd = 0; jd < lScene.size(); jd++) {
                                        Scene Selem = lScene.get(jd);
                                %>
                                <option value="<%=Selem.getId()%>">
                                    <%=Selem.getTitre()%>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="idea-form">
                            <label>Debut></label>
                            <input type="datetime-local" class="form-control" name="debut" >
                        </div>
                        <div class="idea-form">
                            <label>Fin</label>
                            <input type="datetime-local" class="form-control" name="fin" >
                        </div>
                        <div class="idea-form">
                            <input type="submit"  id="idea-close-add"class="form-control"  value="Valider">
                        </div>
                        </form>
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
            <script src="assets/js/wow.min.js"></script>
            <!-- main -->                    <script src="assets/js/index.js"></script>

            <script src="assets/js/main.js"></script>
    </body>


</html>