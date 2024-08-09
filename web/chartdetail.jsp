<%-- 
    Document   : chartdetail
    Created on : 07-Nov-2022, 10:03:46
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <title>Chart Detail</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <!--<link href="css/all.min.css" rel="stylesheet" />-->
        <!--<link href="css/templatemo-style.css" rel="stylesheet" />-->
    </head>
    <body>
        <div style="">
            <a href="getorderbydate"  target="_parent" class="tm-register"  >
                <i> <- Back </i>
            </a>
            <h2 class="text-center tm-section-title">Order Statistics in ${requestScope.searchbyday}</h2>
            <canvas id="productXDay-bar-chart" width="800" height="450"></canvas>
            <canvas id="revenueXDay-bar-chart" width="800" height="450"></canvas>
        </div>
    </body>

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
</html>
