<%-- 
    Document   : contact
    Created on : 14-Oct-2022, 21:47:03
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
        <title>Revenue</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    </head>
    <!--
    
    
    
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
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "alist" : "list"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : ""}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "getorderbydate" : ""} " class="tm-nav-link  ">${a.role == 1 && a.id!=null ? "Statistic detail" : ""}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart.jsp"}" class="tm-nav-link active">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile.jsp"} " class="tm-nav-link">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>


                <div class="tm-container-inner-2 tm-info-section">
                    <div class="row">
                        <!-- FAQ -->
                        <div class="col-12 tm-faq">
                            <h2 class="text-center tm-section-title">Statistics</h2>

                            <div class="tm-accordion">
                                <button class="accordion">1. Shop</button>
                                <div class="panel">
                                    <p>Number of Catergories: ${requestScope.cate}</p>
                                    <p>Number of Products: ${requestScope.prod} </p>
                                    <p>Product's price from ${requestScope.pricemin}đ to ${requestScope.pricemax}đ </p>
                                    <p>Average product's price ~ ${requestScope.avg}đ </p>
                                    <!--                                    <p>Most sold Categories: </p>
                                                                        <p>Least sold Categories: </p>
                                                                        <p>Most sold Products: </p>
                                                                        <p>Least sold Products: </p>-->
                                </div>

                                <button class="accordion">2. Revenue</button>
                                <div class="panel">
                                    <p>Number of Orders:  ${requestScope.numOfOrd}</p>

                                    <p>Total money earned: ${requestScope.totalRevenue}đ</p>
                                    <p>Order has highest earning product: ${requestScope.highestEarningP.getName()} - ${requestScope.highestEarningP.getTotal()/requestScope.highestEarningP.getPrice()}pcs - ${requestScope.highestEarningP.getTotal()}đ </p>
                                    <p>Order has lowest earning product: ${requestScope.lowestEarningP.getName()} - ${requestScope.lowestEarningP.getTotal()/requestScope.lowestEarningP.getPrice()}pcs - ${requestScope.lowestEarningP.getTotal()}đ</p>


                                </div>

                                <button class="accordion">3. Orders</button>
                                <div class="panel">
                                    <p>
                                        Average orders per day: ${requestScope.avgOrd-1} - ${requestScope.avgOrd+1} orders
                                    </p>
                                    <p>Most orders per day:  ${requestScope.mostOrderPerDay.get(0).getNum()} orders 
                                        <a href="orderdetail?date=${requestScope.mostOrderPerDay.get(0).getDate()}"  target="_parent" class="tm-register"  >
                                            <i> click for detail </i>
                                        </a>
                                    </p>
                                    <p>Least orders per day:  ${requestScope.leastOrderPerDay.get(0).getNum()} orders 
                                        <a href="orderdetail?date=${requestScope.leastOrderPerDay.get(0).getDate()}"  target="_parent" class="tm-register"  >
                                            <i> click for detail </i>
                                        </a>
                                    </p>
                                    <p>Most revenue in a order:  ${requestScope.mostRevenuePerDay.get(0).getTotal()} đ 
                                        <a href="orderdetail?date=${requestScope.mostRevenuePerDay.get(0).getDate()}"  target="_parent" class="tm-register"  >
                                            <i> click for detail </i>
                                        </a>
                                    </p>
                                    <p>Least revenue in a order:  ${requestScope.leastRevenuePerDay.get(0).getTotal()} đ 
                                        <a href="orderdetail?date=${requestScope.leastRevenuePerDay.get(0).getDate()}"  target="_parent" class="tm-register"  >
                                            <i> click for detail </i>
                                        </a>
                                    </p>

                                </div>

                                <button class="accordion">4. Customer</button>
                                <div class="panel">
                                    <p>Customers who buy the most: ${requestScope.customerBuyMost.getFullname()} with ${requestScope.customerBuyMost.getNumOfOrds()} orders </p> 
                                </div>



                            </div>	
                        </div>
                    </div>
                </div>
            </main>

            <script type="text/javascript">

                new Chart(document.getElementById("orderPerDay-bar-chart"), {
                type: 'bar',
                        data: {
                        labels: ["0",<c:forEach var="ord" items="${requestScope.order}">"${ord.getDate()}",</c:forEach>],
                                datasets: [
                                {
                                label: "Orders",
                                        backgroundColor: ["#2F956D",<c:forEach var="ord" items="${requestScope.order}">"#2F956D", </c:forEach>],
                                        data: [0,<c:forEach var="ord" items="${requestScope.order}">${ord.getNum()},</c:forEach>]
                                }
                                ]
                        },
                        options: {
                        legend: {display: false},
                                title: {
                                display: true,
                                        text: 'Average orders per day: ${requestScope.avgOrd-1} - ${requestScope.avgOrd +1} orders'
                                }
                        }
                });
            </script>
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
                var acc = document.getElementsByClassName("accordion");
                var i;
                for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
                } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
                }
                });
                }
                });
        </script>
    </body>
</html>
