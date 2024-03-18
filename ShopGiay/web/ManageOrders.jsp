

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    </head>
    <body>
        <section class="pt-5 pb-5">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 mb-2 text-center">Management Orders</h3>
                        <h3>${requestScope.num_raw}</h3>
                        <p class="mb-5 text-center bg-light p-2">
                            Total:<i class="text-info font-weight-bold"> ${requestScope.size}</i> Orders
                        </p>
                        <table id="shoppingCart" class="table table-condensed table-responsive">
                            <thead>
                                <tr>
                                    <th style="width:9%">Order ID</th>
                                    <th style="width:25%">Name buy</th>
                                    <th style="width:15%">Amount</th>
                                    <th style="width:35%">Date buy</th>
                                    <th style="width:40%;margin-left : 20px;text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            <form>
                                <c:forEach var="i" items="${requestScope.orders}">
                                    <tr>
                                        <td data-th="Product">
                                            <div class="row">
                                                <div class="col-md-9 text-left mt-sm-2">
                                                    <p>${i.orderId}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="name-buy">${i.nameBuy}</td>
                                        <td data-th="Price">${i.totalMoney}$</td>
                                        <td data-th="date">${i.dateBuy}</td>
                                        <td data-th="action" class="ml-5">
                                            <div class="text-center "> 
                                                <a href="order-detail?oid=${i.orderId}" class="btn btn-primary">Detail order</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </form>
                            </tbody>
                        </table>
                        <div class="price text-right mr-2">
                            <h4 class="d-inline">Subtotal:</h4>
                            <h1 class="d-inline text-info"><fmt:formatNumber pattern="##.##" value="${requestScope.total}"/> $</h1>
                        </div>
                    </div>
                </div>
                <div class="row mt-4 d-flex align-items-center">
                    <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                        <a href="home" class="btn btn-success">
                            <i class="fas fa-arrow-left mr-2"></i> Back to Home</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
