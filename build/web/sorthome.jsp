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
        <title>Đức Anh Food</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
    </head>

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
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "" : "shophome"}" class="tm-nav-link active ">${a.role == 1 && a.id!=null ? "" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "alist" : "list"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : "Shop"}</a></li>
                                        <c:set var="size" value="${sessionScope.size}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart.jsp"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"} ${size}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile.jsp"} " class="tm-nav-link">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>


                <h3></h3>
                <div class="tm-container-inner-2 tm-contact-section">
                    <div class="row">
                        <div class="col-md-4">
                            <form action="shophome" class="tm-contact-form">
                                <div class="form-group">
                                    <!--<input type="hidden" name="cid" value="${param.cid}"/>-->
                                    <div class=" tm-d-flex" >
                                        <select name="sortbyday"> 
                                            <option value="today">Today</option> 
                                            <option value="3dayslast">Last 3 days</option>
                                            <option value="7dayslast">last 7 days</option>
                                            <option value="all">All</option>
                                        </select>
                                        <div class="form-group tm-d-flex">
                                            <input type="submit" class="tm-btn tm-btn-success tm-btn" value="Select by day">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                 
                <c:if test="${requestScope.sortby!=null}">  
                    <h2 class="form-group" style="text-align: center">${requestScope.sortby}&nbsp; Feature Products</h2>
                    <div class="row tm-gallery">
                        <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.prodRevenue}" var="f">
                                <form action="buy" method="post" id="myform">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item" >
                                        <figure><a cursor-p href="detail?id=${f.id}&?cid=${f.cid}">
                                                <img src="img/${f.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                            <figcaption>
                                                <h4 class="tm-gallery-title">${f.name}</h4>

                                                <p class="tm-gallery-price">${f.price} đ</p>

                                                <div class="form-group tm-d-flex">
                                                    <div class="form-group">
                                                        <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                        <input type="hidden" name="id" value="${f.id}"/>
                                                    </div>
                                                    <input type="submit" class="tm-btn tm-btn-success tm-btn" onclick="buy('${f.id}')"  value="Buy now!">
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>

                    <h2 class="form-group" style="text-align: center">New Product</h2>
                    <div class="row tm-gallery">
                        <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.newp}" var="n">
                                <form action="buy" method="post" id="myform">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item" >
                                        <figure><a cursor-p href="detail?id=${n.id}&?cid=${n.cid}">
                                                <img src="img/${n.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                            <figcaption>
                                                <h4 class="tm-gallery-title">${n.name}</h4>

                                                <p class="tm-gallery-price">${n.price} đ</p>

                                                <div class="form-group tm-d-flex">
                                                    <div class="form-group">
                                                        <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                        <input type="hidden" name="id" value="${n.id}"/>
                                                    </div>
                                                    <input type="submit" class="tm-btn tm-btn-success tm-btn" onclick="buy('${n.id}')"  value="Buy now!">
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>
                    <h2 class="form-group" style="text-align: center">${requestScope.sortby}&nbsp; Most Sold</h2>
                    <div class="row tm-gallery">
                        <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.prodQuantity}" var="m">
                                <form action="buy" method="post" id="myform">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item" >
                                        <figure><a cursor-p href="detail?id=${m.id}&?cid=${m.cid}">
                                                <img src="img/${m.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                            <figcaption>
                                                <h4 class="tm-gallery-title">${m.name}</h4>

                                                <p class="tm-gallery-price">${m.price} đ</p>

                                                <div class="form-group tm-d-flex">
                                                    <div class="form-group">
                                                        <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                        <input type="hidden" name="id" value="${m.id}"/>
                                                    </div>
                                                    <input type="submit" class="tm-btn tm-btn-success tm-btn" onclick="buy('${m.id}')"  value="Buy now!">
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>

                </c:if> 


                <style>
                    .page-link {
                        padding: 0.375rem 0.75rem;
                    }
                    .pagination {
                        display: flex;
                        padding-left: 0;
                        list-style: none;
                        justify-content: center
                    }
                    .page-link-detail{
                        background-color: #319966;
                        color: white;
                        padding: 5px
                    }
                    .page-item-detail{

                    }
                    .page-item.active .page-link {
                        z-index: 3;
                        text-decoration: none;
                        color: #319966;
                        background-color: transparent
                    }
                    .page-item.disabled .page-link {

                        pointer-events: none;
                        color: #319966;
                        background-color: transparent;
                        border-color: #dee2e6;
                    }
                    .pagination-lg .page-item:first-child .page-link {
                        border-top-left-radius: 0.3rem;
                        border-bottom-left-radius: 0.3rem;
                    }
                    .pagination-lg .page-item:last-child .page-link {
                        border-top-right-radius: 0.3rem;
                        border-bottom-right-radius: 0.3rem;
                    }
                </style>

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
        </div>
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
                                                    function buy(id) {
                                                        document.f.action = "buy?id=" + id;
                                                        document.f.submit();
                                                        //                                                          document.getElementById('myform').submit();
                                                    }
        </script>

    </body>
</html>
