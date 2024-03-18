
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
        <link rel="stylesheet" href="./css/orderForm.css"/>
         <link rel="stylesheet" href="./css/footer.css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="info container">
                <div class="row text-center">
                    <div class="col-12 order-success"><h1>Order Success!</h1></div>
                </div>
                <div>
                    <h3>Congratulations on your successful order! We will process the order as soon as possible.</h3>
                </div>
                <div class="row">
                    <div class="col-12">
                        <h4 class="mb-2 bg-light">Information</h4>
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td>Full name</td>
                                    <td>${requestScope.name}</td>
                            </tr>
                            <tr>
                                <td>Phone Number</td>
                                <td>${requestScope.phone}</td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>${requestScope.address}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
