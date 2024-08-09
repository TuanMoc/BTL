<%-- 
    Document   : chart
    Created on : 02-Nov-2022, 20:18:07
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    </head>
    <body>

        
        <%--<c:if test="${requestScope.chart == 1}">--%>
        <!--<canvas id="orderPerDay-bar-chart" width="800" height="450"></canvas>-->
        <%--</c:if>--%>
        <div style="width: 30%; height: 30%">
        <canvas id="orderPerDay-bar-chart" width="800" height="450"></canvas>
        </div>
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
    
</body>
</html>
