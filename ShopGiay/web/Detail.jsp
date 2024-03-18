<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
        <link rel="stylesheet" href="./css//footer.css"/>
        <link rel="stylesheet" href="./css/productSimalar.css"/>
        <link rel="stylesheet" href="./css/footer.css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .swiper {
                width: 100%;
                height: 100%;
            }

            .swiper-slide {
                text-align: center;
                font-size: 13px;
                background: #fff;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 20px;
            }

            .swiper-slide img {
                display: block;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .off{
                opacity:  0.7;
                pointer-events: none;
            }
            .mess-stock{
                display: none;
            }
            .mess-stock.on{
                display: block;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">

                <%--<jsp:include page="Left.jsp"></jsp:include>--%>
                <c:set var="p" value="${requestScope.detail}"/>
                <div class="col-12 col-lg-12">
                    <div class="row">
                        <!-- Image -->
                        <div class="col-12 col-lg-6">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <a href="" data-toggle="modal" style="text-align: center;display: block" data-target="#productModal">
                                        <img class="img-fluid" src=${p.image} />
                                        <p class="text-center">Zoom</p>
                                    </a>
                                </div>
                            </div>
                            <div class="card bg-light mb-3 text-white bg-dark">
                                <b class="text-info">Name</b>
                                <p class="text-center font-weight-bold">${p.name}</p>
                            </div>
                        </div>

                        <!-- Add to cart -->
                        <div class="col-12 col-lg-6 add_to_cart_block">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <p class="price">${p.price} $</p>
                                    <p class="price_discounted">${p.price*1.5} $</p>
                                    <p class="mess-stock bg-danger text-center card text-white ${p.quantity == 0 ? 'on':''}">The product is out of stock</p>
                                    <form method="get" action="buy" id="formBuy">
                                        <input type="text" name="id" value="${p.id}" hidden/>
                                        <div class="form-group">
                                            <label for="colors">Size</label>
                                            <select class="custom-select" id="sizes" name="size" required>
                                                <option value="null" selected disabled>----------------Select-----------</option>
                                                <c:forEach items="${requestScope.sizes}" var="s">
                                                    <option name="size" value="${s}">${s}</option>
                                                </c:forEach>
                                            </select>
                                            <span id="mess" class="card-text text-white d-md-block bg-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity :</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control"  id="quantity" name="quantity" min="1" max="${p.quantity}" value="1">
                                                <div class="input-group-append">
                                                    <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-lg btn-block text-uppercase ${p.quantity == 0 ? 'off':''}">
                                            <i class="fa fa-shopping-cart"></i> Add To Cart
                                        </button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Description -->
                        <div class="col-12">
                            <div class="card border-light mb-3">
                                <div class="card-header bg-info text-white text-uppercase"><i class="fa fa-align-justify"></i> Title</div>
                                <div class="card-body">
                                    <p class="card-text">
                                        ${p.title}
                                    </p>
                                </div>
                                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> Description</div>
                                <div class="card-body">
                                    <p class="card-text">
                                        ${p.description}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Reviews -->
                        <!--                        <div class="col-12" id="reviews">
                                                    <div class="card border-light mb-3">
                                                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-comment"></i> Reviews</div>
                                                        <div class="card-body">
                                                            <div class="review">
                                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                                                <meta itemprop="datePublished" content="01-01-2016">January 01, 2018
                        
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                by Paul Smith
                                                                <p class="blockquote">
                                                                <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                                                </p>
                                                                <hr>
                                                            </div>
                                                            <div class="review">
                                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                                                <meta itemprop="datePublished" content="01-01-2016">January 01, 2018
                        
                                                                <span class="fa fa-star" aria-hidden="true"></span>
                                                                <span class="fa fa-star" aria-hidden="true"></span>
                                                                <span class="fa fa-star" aria-hidden="true"></span>
                                                                <span class="fa fa-star" aria-hidden="true"></span>
                                                                <span class="fa fa-star" aria-hidden="true"></span>
                                                                by Paul Smith
                                                                <p class="blockquote">
                                                                </p>
                                                                <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                                                <hr>
                                                            </div>
                                                            <div class="feedback">
                                                                <form action="feedback" method="post" class="row pl-2"> 
                                                                    <input type="text" name="review" placeholder="Feedback for this product" class="col-10 mr-2 pl-1"/>
                                                                    <button class="btn btn-primary col-1">Send</button>
                                                                </form>
                                                            </div>
                                                        </div>
                        
                                                    </div>
                        
                                                </div>-->
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal image -->
        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel">${p.name}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <img class="img-fluid" src="${p.image}" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Same Category -->
        <div class="col-12" id="reviews">
            <div class="card border-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa-brands fa-product-hunt"></i> Product Similarly</div>
                <div>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="pc" items="${requestScope.pCate}">

                                <div class="swiper-slide">
                                    <div class="slide__product">
                                        <img class="slide__product-image" src="${pc.image}" alt="Card image cap">
                                        <div class="slide__product-detail">
                                            <h6 class="card-title show_txt bg-light text-center"><a href="detail?pid=${pc.id}" title="View Product">${pc.name}</a></h6>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${pc.price}$</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
        </div>  

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script type="text/javascript">
            //Plus & Minus for Quantity product
            $(document).ready(function () {
                var quantity = 1;
                const maxQuantity = document.getElementById("quantity").max;
                console.log(maxQuantity);
                $('.quantity-right-plus').click(function (e) {
                    e.preventDefault();
                    var quantity = parseInt($('#quantity').val());
                    if (quantity <= maxQuantity - 1) {
                        $('#quantity').val(quantity + 1);
                    }
                });

                $('.quantity-left-minus').click(function (e) {
                    e.preventDefault();
                    var quantity = parseInt($('#quantity').val());
                    if (quantity > 1) {
                        $('#quantity').val(quantity - 1);
                    }
                });

            });

            const formBuy = document.getElementById("formBuy");
            const sizes = document.getElementById("sizes");
            formBuy.addEventListener("submit", (e) => {
                const mess = document.getElementById("mess");
                e.preventDefault();
                const elementQuantity = document.getElementById("quantity");
                const messStock = document.querySelector(".mess-stock");
                if (parseInt(elementQuantity.value) < 0) {
                    messStock.innerHTML = "Quantity can't nagative number";
                    messStock.classList.add("on");
                    return;
                } else if (parseInt(elementQuantity.max) < parseInt(elementQuantity.value)) {
                    messStock.innerHTML = "The number of stock in the shop is not enough<br>Please decrease quantity";
                    messStock.classList.add("on");
                    return;
                }
                else if (sizes.value === 'null') {
                    mess.innerHTML = "Please choice my size!";
                    return;
                } else {
                    formBuy.submit();
                }
                ;
            });
            var swiper = new Swiper(".mySwiper", {
                slidesPerView: 3,
                spaceBetween: 30,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
            });
        </script>
    </body>
</html>
