
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic Page</title>
        <!------ Include the above in your HEAD tag ---------->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/footer.css"/>
        <link rel="stylesheet" href="./css/paging.css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
        <link rel="stylesheet" href="./css/header.css"/>
        <style>
            .list-group-item.active {
                background-color: #35dc5dc2;
            }
            .list-group-item:hover {
                background-color: pink !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container my-5">
                <h3 class="display-5 p-2 mb-4 text-center bg-info border-light text-light">Statistic</h3>
                <div class="row justify-content-center">
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header">Number of products sold: ${total}</div>
                            <div class="card-body">
                                <c:forEach var="s" items="${requestScope.list}" >
                                     <p>Product ID ${s.product.id}: <b>${s.total}</b></p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header">The total amount: ${totalAmount}$</div>
                            <div class="card-body">
                                <c:forEach var="s" items="${requestScope.list}" >
                                     <p>Product ID ${s.product.id}: <b>${s.total*s.product.price}$</b></p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="./js/menu.js"></script>
    </body>
</html>
