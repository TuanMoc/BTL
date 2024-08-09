<%-- 
    Document   : index
    Created on : Nov 1, 2017, 4:58:44 PM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Java Date Picker</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript">
            $(function () {
            $("#datepicker").datepicker();
            });
        </script>
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
            <script type="text/javascript">

                new Chart(document.getElementById("productXDay-bar-chart"), {
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
                                        text: 'Product sold in ${requestScope.searchbyday} '
                                }
                        }
                });
            </script>
            <script type="text/javascript">

                new Chart(document.getElementById("revenueXDay-bar-chart"), {
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
                                        text: 'Revenue in ${requestScope.searchbyday} '
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
    </head>
    <body>
        <Pre>
        <form action="testdate">
            <label for="datepicker">Enter Your Date of Birth:</label>
                <input type="text" name="dob" id="datepicker">
            
            <input type="submit" value="Submit">
        </form>
        </pre>  
        
        <p>
            ${requestScope.data}
        </p> 
    </body>
</html>

