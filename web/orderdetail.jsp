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
        <title>Order Detail</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    </head>
    <!--
    
    Simple House
    
    
    -->
    <script type="text/javascript">
        function doDeleteCate(id) {
        if (confirm("Are you sure to delete this category!?")) {
        window.location = "deletecategory?id=" + id;
        }
        }
    </script>
    <script type="text/javascript">
        function doDeleteProd(id) {
        if (confirm("Are you sure to delete this product!?")) {
        window.location = "deleteproduct?id=" + id;
        }
        }
    </script>

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
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "alist" : "list"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "getorderbydate" : ""} " class="tm-nav-link  ">${a.role == 1 && a.id!=null ? "Statistic detail" : ""}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile.jsp"} " class="tm-nav-link">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>
                <div class="col-md-4" style="margin-left: 50px">
                    <a href="revenue"  target="_parent" class="tm-register"  >
                        <i> <-Back </i>
                    </a>
                </div>



                <div class="container px-3 my-5 clearfix">
                    <!-- Shopping cart table -->
                    <div class="card">
                        <div class="card-header">
                            <h2>Order Detail in ${requestScope.currentdate}</h2>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered m-0">
                                    <thead>
                                        <tr>
                                            <!-- Set columns width -->

                                            <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name </th>
                                            <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                            <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                            <th class="text-right py-3 px-4" style="width: 100px;">Total</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="sum" value="0"/>
                                        <c:forEach var="o" items="${requestScope.ord}" >
                                            <tr>
                                                <td class="p-4">
                                                    <div class="media align-items-center">

                                                        <div class="media-body">
                                                            ${o.pName}
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="align-middle p-4"> ${o.price} </td>
                                                <td class="align-middle p-4">

                                                    <input class="form-control text-center" type="text" readonly="" value="${o.quantity}" />

                                                </td>
                                                <td  class="text-right font-weight-semibold align-middle p-4" >${o.price * o.quantity}đ  </td>

                                                <c:set var="sum" value="${o.price * o.quantity +sum}"/>

                                            </tr>
                                        </c:forEach>



                                    </tbody>
                                </table>

                            </div>
                            <div style="width: 70%; height: 70%">
                                <canvas id="productPerDay-bar-chart" width="800" height="450"></canvas>
                            </div>
                            <div style="width: 70%; height: 70%">
                                <canvas id="revenuePerDay-bar-chart" width="800" height="450"></canvas>
                            </div>          
                            <!-- / Shopping cart table -->

                            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">

                                <div class="d-flex">

                                    <div class="text-right mt-4">
                                        <label class="text-muted font-weight-normal m-0">Total revenue</label>
                                        <div class="text-large"><strong>${sum}đ</strong></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>



                <!-- Gallery -->



            </main>
            <script type="text/javascript">

                new Chart(document.getElementById("productPerDay-bar-chart"), {
                type: 'bar',
                        data: {
                        labels: [<c:forEach var="ord" items="${requestScope.ord}">"${ord.pName}",</c:forEach>],
                                datasets: [
                                        {
                                        label: "Pcs",
                                                backgroundColor: [<c:forEach var="ord" items="${requestScope.ord}">"#2F956D", </c:forEach>],
                                                data: [<c:forEach var="ord" items="${requestScope.ord}">${ord.quantity},</c:forEach>]
                                                }
                                ]
                                },
                        options: {
                        legend: {display: false},
                                title: {
                                display: true,
                                        text: 'Product sold in: ${requestScope.currentdate} '
                                        }
                        }
                });
            </script>
            <script type="text/javascript">

                new Chart(document.getElementById("revenuePerDay-bar-chart"), {
                type: 'bar',
                        data: {
                        labels: [<c:forEach var="ord" items="${requestScope.ord}">"${ord.pName}",</c:forEach>],
                                datasets: [
                                        {
                                        label: "đ",
                                                backgroundColor: [<c:forEach var="ord" items="${requestScope.ord}">"#2F956D", </c:forEach>],
                                                data: [<c:forEach var="ord" items="${requestScope.ord}">${ord.quantity*ord.price},</c:forEach>]
                                                }
                                ]
                                },
                        options: {
                        legend: {display: false},
                                title: {
                                display: true,
                                        text: 'Revenue in: ${requestScope.currentdate} '
                                        }
                        }
                });
            </script>

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
        </script>
    </body>
</html>
