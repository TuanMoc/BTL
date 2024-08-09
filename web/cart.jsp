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
        <title>Cart</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <script src="ckeditor/ckeditor.js"></script> 
        <script src="ckfinder/ckfinder.js"></script>
    </head>
    <!--
    
    Simple House
    
    
    
    -->
    <body> 
         <script>
        // Kiểm tra tham số success trong URL để hiển thị thông báo
        var urlParams = new URLSearchParams(window.location.search);
        var success = urlParams.get('success');
        if (success === 'true') {
            alert('Đơn hàng của bạn đã được đặt thành công!');
        }
       </script>
        <script >
            CKEDITOR.replace('edit');
        </script>


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
                                    <!--<li class="tm-nav-li"><a href="${a.role == 1 ? "alist" : "list"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : ""}</a></li>-->
                                    <li class="tm-nav-li"><a href="list" class="tm-nav-link ">Shop</a></li>
                                        <c:set var="size" value="${sessionScope.size}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart.jsp"}" class="tm-nav-link active ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"} ${size}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile.jsp"} " class="tm-nav-link">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main> 
                <div class="container px-3 my-5 clearfix">
                    <!-- Shopping cart table -->
                    <div class="card">
                        <div class="card-header">
                            <h2>Shopping Cart</h2>
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
                                            <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="o" value="${sessionScope.cart}" />
                                        <c:set var="sum" value="0"/>
                                        <c:forEach  items="${o.items}" var="i" >

                                            <tr>

                                                <td class="p-4">
                                                    <div class="media align-items-center">
                                                        <img src="img/${i.product.image}" height="20%" width="20%"   alt="">
                                                        <div class="media-body">
                                                            <a href="detail?id=${i.product.id}" class="d-block text-dark">    ${i.product.name}</a>
                                                        </div>
                                                    </div>
                                                </td>



                                                <td class="align-middle p-4"> <button>${i.product.price} </button> </td>
                                                <td class="align-middle p-4">
                                                    <button><a href="process?num=-1&id=${i.product.id}">-</a></button>
                                                    <input class="form-control text-center" type="number" readonly="" value="${i.quantity}" />

                                                    <button><a <c:if test="${i.quantity >= 30}" >onclick="wait()" </c:if> href="process?num=1&id=${i.product.id}">+</a></button>
                                                    <c:if test="${i.quantity >= 30}" > <c:set var="highQuantity" value="${i.quantity}"/> </c:if> 
                                                    <!--<button><a onclick="wait()" href="process?num=1&id=${i.product.id}">+</a></button>-->

                                                </td>
                                                <td  class="text-right font-weight-semibold align-middle p-4" >${i.quantity * i.product.price}đ  </td>
                                                <c:set var="total" value="${ i.quantity * i.product.price}" />
                                                <c:set var="sum" value="${total+sum}"/>
                                                <td>


                                                    <form action="process" method="post">
                                                        <input type="hidden" name="id" value="${i.product.id}">
                                                        <input class="shop-tooltip close float-none text-danger" data-original-title="Remove" type="submit" value="×">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>



                                    </tbody>
                                </table>
                            </div>
                            <!-- / Shopping cart table -->

                            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                                <div class="form-group">
                                    <label class="text-muted font-weight-normal m-0">Name</label>
                                    <input type="text" name="address" class="form-control" value="${sessionScope.account.fullname}"  placeholder="Enter your fullname" required="" />
                                </div>
                                <div class="form-group">
                                    <label class="text-muted font-weight-normal m-0">Phone Number</label>
                                    <input type="text" name="address" class="form-control" value="${sessionScope.account.phonenum}"  placeholder="Enter your phone number" required="" />
                                </div>  


                                <div class="d-flex">

                                    <div class="text-right mt-4">
                                        <label class="text-muted font-weight-normal m-0">Total price</label>
                                        <div class="text-large"><strong>${sum}đ</strong></div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-12 tm-faq" style="margin-left: 0px">
                                <div class="d-flex flex-wrap justify-content-between align-items-center pb-4" >
                                    
                                    <button class="accordion" >Choose place to eat</button>
                                    <div class="panel"> 
                                        <div class="form-group">
                                            <input type="radio" name="placeToEat" value="1" />
                                            <label class="text-muted font-weight-normal m-0">Eat in site</label>
                                        </div> 
                                        <div class="form-group">
                                            <input type="radio" name="placeToEat" value="2" />
                                            <label class="text-muted font-weight-normal m-0">Ship to: </label>
                                            <input type="text" name="address" class="form-control" value="${sessionScope.account.address}"  placeholder="Enter your address" required="" />
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-8">
                                <label class="text-muted font-weight-normal m-0">Note</label>
                                <div class="form-group">
                                    <textarea id="edit" rows="5" name="message" class="form-control" placeholder="Message" required=""></textarea>
                                </div>

                            </div>


                            <div class="float-right">

                                <a href="list"><button type="submit"  class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</button></a>

                                <form action="checkout" method="POST" onclick="overtime()">

                                    <input <c:if test="${highQuantity >= 30}" >onclick="waitCheckOut()" </c:if>  class="btn btn-lg btn-primary mt-2" type="submit" name="" value="Checkout" />
                                </form>

                            </div>

                        </div>
                    </div>
                </div>
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
        <style type="text/css">
            body{
                margin-top:20px;
                background:#eee;
            }
            .ui-w-40 {
                width: 40px !important;
                height: auto;
            }

            .card{
                box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
            }

            .ui-product-color {
                display: inline-block;
                overflow: hidden;
                margin: .144em;
                width: .875rem;
                height: .875rem;
                border-radius: 10rem;
                -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                vertical-align: middle;
            }
        </style>

        <script type="text/javascript">
            function buy(id) {
                document.f.action = "buy?id=" + id;
                document.f.submit();
            }


        </script>
        <script type="text/javascript">
            function wait() {
                if (confirm("Because of high quantity of products, you have to wait about 1-2 hours for making and shipping, are you sure to add more!?")) {
                    window.location = "cart";
                }
            }
            function waitCheckOut() {
                if (confirm("Because of high quantity of products, you have to wait about 1-2 hours for making and shipping, are you sure to checkout!?")) {
                    window.location = "checkout";
                }
            }
            function overtime() {
                var now = new Date();
                var hour = (now.getHours());
                if (hour < 6 || hour >= 21) {
                    if (confirm("We only sell from 6:00 to 21:00, please comeback in time!")) {
                        window.location = "cart";
                    }
                }
            }
        </script>

    </body>
    <script >

        CKEDITOR.replace('edit', {
            filebrowserBrowseUrl: 'ckfinder/ckfinder.html',
            filebrowserUploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
        });
    </script>
</html>
