
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link rel="stylesheet" href="./css/orderForm.css"/>
    </head>
    <body>
        <section class="pt-5 pb-5">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 mb-2 text-center">Checkout Cart</h3>
                        <h3>${requestScope.num_raw}</h3>
                        <p class="mb-5 text-center">
                            <i class="text-info font-weight-bold">${requestScope.cart.list.size()}</i> items in your cart
                        </p>
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
                                <c:set var="o" value="${requestScope.cart}"/>
                                <c:set var="cate" value="${requestScope.cate}"/>
                            <form action="process" id="f1" method="post">
                                <c:forEach var="i" items="${o.list}">
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
                                        <td data-th="Price">${i.size}</td>
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
                        <div class="price">
                            <h4 class="d-inline">Subtotal:</h4>
                            <h1 class="d-inline"><fmt:formatNumber pattern="##.##" value="${o.totalMoney}"/> $</h1>
                        </div>
                    </div>
                </div>
                <div class="order-form">
                    <form action="checkout" method="post" class="form-signup">
                        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Delivery information</h1>
                        <input name="name" type="text" id="user-name" class="form-control" placeholder="Full name" required="" autofocus="">
                        <input name="phone" type="text" id="user-pass" class="form-control mt-2 mb-2" placeholder="Phone number" pattern="^0[2-9]{3}[0-9]{6}" required autofocus="">
                        <input name="address" type="text" id="user-repeatpass" class="form-control mb-2" placeholder="Address" required autofocus="">

                        <button class="btn btn-primary btn-block" type="submit"> Buy</button>
                    </form>
                </div>
                <div class="row mt-4 d-flex align-items-center">
                    <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                        <a href="home" class="btn btn-success">
                            <i class="fas fa-arrow-left mr-2"></i> Continue Shopping</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
