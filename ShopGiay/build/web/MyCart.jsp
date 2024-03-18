<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
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
                        <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
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
                                    <th style="width:16%; text-align: center">Action</th>
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
                                        <td data-th="Price">${i.price* i.quantity}</td>
                                        <td data-th="size">${i.size}</td>
                                        <td data-th="Quantity">
                                            <input type="number" product-id ="${i.product.id}" size-id ="${i.size}" id="quantity" class="form-control form-control-lg text-center" name="num" value="${i.quantity}" 
                                                   />
                                            <input name="cid" value="${i.category.cid}" hidden/>
                                            <input name="cName" value="${i.category.name}" hidden/>
                                        </td>
                                        <td class="actions" data-th="">
                                            <button hidden> </button>
                                            <div class="text-center">
                                                <a class="btn btn-black border-primary bg-white btn-md mb-2" href="deleteItem?id=${i.product.id}&size=${i.size}"><i class="fas fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </form>
                            </tbody>
                        </table>
                        <div class="float-right text-right">
                            <h4>Subtotal:</h4>
                            <h1><fmt:formatNumber pattern="##.##" value="${o.totalMoney}"/> $</h1>
                        </div>
                    </div>
                </div>
                <div class="row mt-4 d-flex align-items-center">
                    <div class="col-sm-6 order-md-2 text-right">
                        <a href="checkout" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Checkout</a>
                    </div>
                    <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                        <a href="home" class="btn btn-success">
                            <i class="fas fa-arrow-left mr-2"></i> Continue Shopping</a>
                    </div>
                </div>
            </div>
        </section>
        <script type="text/javascript">
            const quantity = document.querySelectorAll("input[name='num']");
            quantity.forEach((item) => {
                item.addEventListener("change", (e) => {
                    const num = e.target.value;
                    const id = item.getAttribute("product-id");
                    const size = item.getAttribute("size-id");
                    console.log(num);
                    console.log(id);
                    window.location.href = "process?num=" + num + "&id=" + id + "&size=" + size;
                });
            });

        </script>
    </body>

</html>