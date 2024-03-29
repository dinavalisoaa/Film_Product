<%@page import="model.Emotion"%>
<%@page import="model.Personnage"%>
<%@page import="service.EmotionService"%>
<%@page import="service.PersonnageService"%>
<%@page import="service.SceneService"%>
<%@page import="service.DialogueService"%>
<%@page import="dao.HibernateDao"%>
<%@page import="model.Dialogue"%>
<%@page import="java.util.List"%>
<%
    List<Dialogue> dialogue = (List<Dialogue>) request.getAttribute("dialogue");
    List<Personnage> personnage = (List<Personnage>) request.getAttribute("personnage");
    List<Emotion> emotion = (List<Emotion>) request.getAttribute("emotion");
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
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-6 d-xl-block d-lg-block d-flex align-items-center">
                            
                                <h1><a href="index.html">E-FILM</a></h1>
                            
                        </div>
                        <div class="d-xl-none d-lg-none d-block col-6">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                                        <a class="nav-link " href="about.html">About <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="movie.html">Movie</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="gallery.html">Scene</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="planning">Planning</a>
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
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <div class="add-space section-title text-center">
                    </div>
                </div>
            </div>
            <div class="add-space section-title spacing" >
                <h2 class="title-scene" style="font-size: 50px;">Dialogue</h2>
                <a href="dialogue_formulaire?idScene=<%=request.getParameter("idScene")%>"><div class="ajout"><b>Ajout <i class="fa fa-plus"></i></b></div></a>
            </div>
            <div class="row">
                <table width="1000">
                <form action="dialogue" method="get">
                    <tr>
                    <input type="hidden" name="search" value="1">
                    <input type="hidden" name="idScene" value="<%=request.getParameter("idScene")%>">
                    <td><input type="text" name="mot"></td>
                    <td><select name="personnage">
                        <option value="">Personnage</option>
                    <% for (int idx = 0; idx < personnage.size(); idx++) { %>
                    <option value="<%=personnage.get(idx).getId()%>"><%=personnage.get(idx).getNom()%></option>
                    <% } %>
                        </select></td>
                        <td><select name="emotion">
                        <option value="">Emotion</option>
                    <% for (int idx = 0; idx < emotion.size(); idx++) { %>
                    <option value="<%=emotion.get(idx).getId()%>"><%=emotion.get(idx).getType()%></option>
                    <% } %>
                            </select></td>
                            <td><div class="form-scene-item">
                            <button type="submit">Rechercher</button>
                            </div></td>    
                    </tr>
                </form>
                </table>
            </div>
                            <br/><br/>
            <% for (int idx = 0; idx < dialogue.size(); idx++) { %>
            <div class="dialogue-container">
                    <p><%=dialogue.get(idx).getContenu()%></p>
                    <div class="info-tiers">
                        <p><b>Dur�e:</b> <%=dialogue.get(idx).getDuree()%></p>
                    </div>
                </div>         
            </div>
            <% } %><div class="tab-content" id="v-pills-tabContent">
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
                            </div></div>
                            </div>
<!--            <div class="dialogue-container">
                <img src="assets/img/dj-2.jpg"/>
                <div class="info"><b>Nom</b>
                <p>Texte</p>
                <div class="info-tiers">
                    <p><b>Emotion:</b>Joie</p>
                    <p><b>Dur�e:</b>10s</p>
                </div>
               
            </div>
            
            </div>-->
<!--            <div class="dialogue-container">
                <img src="assets/img/dj-3.jpg"/>
                <div class="info"><b>Nom</b>
                <p>Texte</p>
                <div class="info-tiers">
                    <p><b>Emotion:</b>Joie</p>
                    <p><b>Dur�e:</b>10s</p>
                </div>
               
            </div>
            
            </div>-->
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
    <!-- main -->
    <script src="assets/js/main.js"></script>
</body>


</html>