<%-- 
    Document   : index
    Created on : 14-Oct-2022, 21:47:53
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Profile</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/templatemo-style.css" rel="stylesheet" />
    </head>
    <!--
    
    Simple House
    
    
    
    -->
    <body> 

        <div class="container">
            <!-- Top box -->
            <!-- Logo & Site Name -->
            <div class="placeholder">
                <div class="parallax-window" data-parallax="scroll" data-image-src="img/simple-house-01.jpg">
                    <div class="tm-header">
                        <div class="row tm-header-inner">
                            <div class="col-md-6 col-12">
                                <img src="img/simple-house-logo.png" alt="Logo" class="tm-site-logo" /> 
                                <div class="tm-site-text-box">
                                    <h1 class="tm-site-title">Đức Anh Food</h1>
                                    <h6 class="tm-site-description">best for students in HOLA</h6>		
                                </div>
                            </div>
                            <nav class="col-md-8 col-12 tm-nav">
                                <ul class="tm-nav-ul">
                                    <c:set var="a" value="${sessionScope.account}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "" : "shophome"}" class="tm-nav-link  ">${a.role == 1 && a.id!=null ? "" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "alist" : "list"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : ""}</a></li>
                                    <li class="tm-nav-li"><a href="list" class="tm-nav-link ">Shop</a></li>
                                    <c:set var="size" value="${sessionScope.size}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart.jsp"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"} ${size}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile.jsp"} " class="tm-nav-link active">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>
                <header class="row tm-welcome-section">
                    <c:set var="a" value="${sessionScope.account}"/>
                    <h2 class="col-12 text-center tm-section-title">User ${a.fullname}</h2>
                    <h3 style="color: red">${requestScope.ms}</h3>
                    <a href="profile.jsp" target="_parent" class="tm-register">
                        <i> <-Back </i>
                    </a>
                    <h2 class="col-12 text-center tm-section-title"></h2>
                    <form action="changeprf" >

                        <div class="form-group">
                            <input type="text" name="fullname" class="form-control" value="${a.fullname}"  required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" value="${a.email}"  required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="phonenum" class="form-control" value="${a.phonenum}"  required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="address" class="form-control" value="${a.address}"  required="" />
                        </div>
                        <input type="hidden" name="user" value="${sessionScope.account.username}"/>
                        <input type="hidden" name="pass" value="${sessionScope.account.password}"/>
                        <input type="submit" class="tm-btn tm-btn-success tm-btn" value="Change Profile">
                    </form>

                    <h2 class="col-12 text-center tm-section-title"></h2>
                    <h2 class="col-12 text-center tm-section-title"></h2> 
                    <h2 class="col-12 text-center tm-section-title"></h2>  
                </header>

            </main>
            <div class="tm-container-inner tm-featured-image">
                <div class="row">
                    <div class="col-12">
                        <div class="placeholder-2">
                            <div class="parallax-window-2" data-parallax="scroll" data-image-src="img/simple-house-01.jpg"></div>		
                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer">
                <div class="tm-address">
                    <h4 class="tm-info-title tm-text-success">Our Address</h4>
                    <address>
                        Somewhere in HOLA
                    </address>
                    <a href="tel:0395931502" class="tm-contact-link">
                        <i class="fas fa-phone tm-contact-icon"></i>0395931502
                    </a>
                    <a href="mailto:no.72bylc@gmail.com" class="tm-contact-link">
                        <i class="fas fa-envelope tm-contact-icon"></i>no.72bylc@gmail.com
                    </a>
                    <div class="tm-contact-social">
                        <a href="https://www.facebook.com/btrg2112/" class="tm-social-link"><i class="fab fa-facebook tm-social-icon"></i></a>
                        <a href="https://www.instagram.com/maura.2112/" class="tm-social-link"><i class="fab fa-instagram tm-social-icon"></i></a>
                    </div>
                </div>
            </footer>


            <script src="js/jquery.min.js"></script>
            <script src="js/parallax.min.js"></script>
            <script>
                $(document).ready(function () {
                    // Handle click on paging links
                    $('.tm-paging-link').click(function (e) {
                        e.preventDefault();

                        var page = $(this).text().toLowerCase();
                        $('.tm-gallery-page').addClass('hidden');
                        $('#tm-gallery-page-' + page).removeClass('hidden');
                        $('.tm-paging-link').removeClass('active');
                        $(this).addClass("active");
                    });
                });
            </script>
    </body>
</html>
