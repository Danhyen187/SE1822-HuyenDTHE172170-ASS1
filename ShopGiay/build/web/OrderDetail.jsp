
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail order Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            .info tr td{
                border: 1px solid #ddd;
                border-collapse: collapse;
                width: 70%;
                padding: 5px;
            }
            table{
                width: 100%;
                margin-bottom: 30px;
            }
            .info .title{
                width: 30%;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <section class="pt-5 pb-5">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 p-2 mb-4 text-center bg-info border-light text-light">Detail Order</h3>
                        <h3 class="display-5 p-1 mb-2 text-center border-light h2">Information customer</h3>
                        <table class="info table-info">
                            <tr>
                                <td class="title">Name buy</td>
                                <td>${requestScope.info.fullName}</td>
                            </tr>
                            <tr>
                                <td class="title">Phone number</td>
                                <td>${requestScope.info.phoneNumber}</td>
                            </tr>
                            <tr>
                                <td class="title">Address</td>
                                <td>${requestScope.info.address}</td>
                            </tr>
                        </table>
                        <h3 class="display-5 p-1 mb-2 text-center border-light">Information order</h3>
                        <table id="shoppingCart" class="table table-condensed table-responsive">
                            <thead>
                                <tr>
                                    <th style="width:60%">Product</th>
                                    <th style="width:12%">Price</th>
                                    <th style="width:12%">Size</th>
                                    <th style="width:10%">Quantity</th>
                                    <th style="width:16%; text-align: center">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                            <form>
                                <c:forEach var="i" items="${requestScope.orderDetail}">
                                    <tr>
                                        <td data-th="Product">
                                            <div class="row">
                                                <div class="col-md-3 text-left">
                                                    <img src="${i.product.image}" alt=""
                                                         class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                                </div>
                                                <div class="col-md-9 text-left mt-sm-2">
                                                    <h4>${i.product.name}</h4>
                                                    <p class="font-weight-light">
                                                        ${i.category.name}
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Price">${i.price}$</td>
                                        <td data-th="Size">${i.size}</td>
                                        <td data-th="Quantity">
                                            <div class="text-center"> 
                                                ${i.quantity}
                                            </div>
                                        </td>
                                        <td class="actions" data-th="">
                                            <div class="text-center">
                                                ${i.quantity*i.price}$
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
                        <button class="btn btn-success" id="back">
                            <i class="fas fa-arrow-left mr-2"></i> Back </button>
                    </div>
                </div>
            </div>
        </section>
        <script>
            const back = document.getElementById("back");
            back.addEventListener("click",(e) =>{
                window.history.back();
            });
        </script>
    </body>
</html>
