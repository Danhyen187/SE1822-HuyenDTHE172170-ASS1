<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <!------ Include the above in your HEAD tag ---------->
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
            <div class="container">
                <div class="row">
                    <div class="col-12 text-right mb-5">
                        <form action="home" id="f1">
                            <select name="sort" id="sort">
                                <option value="default" ${sort=='default'?"selected":""}>Default</option>
                            <option value="sortByCreasePrice" ${sort=='sortByCreasePrice'?"selected":""}>Sort by increasing Price </option>
                            <option value="sortByDecresePrice" ${sort=='sortByDecresePrice'?"selected":""}>Sort by descending Price </option>
                            <option value="sortByName" ${sort=='sortByName'?"selected":""}>Sort by name </option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="row">
                        <c:forEach items="${requestScope.listP}" var="p">
                            <div class="col-12 col-md-6 col-lg-4 mb-2">
                                <div class="card card-product">
                                    <img class="card-img-top" src="${p.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt bg-light text-center"><a href="detail?pid=${p.id}" title="View Product">${p.name}</a></h4>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${p.price}$</p>
                                            </div>
                                        </div>
                                        <p class="card-text show_txt ">${p.title}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-12">
                        <c:if test="${requestScope.error != null}">
                                <h3 class="text-warning bg-info text-center p-2">${requestScope.error}</h3>
                            </c:if>
                        </div>
                    </div>
                    <jsp:useBean class="dao.DAO" scope="request" id="a"/>
                    <div class="paging">
                        <ul class="paging-items">
                            <c:forEach begin="${1}" end="${a.numberPage}" var="i">
                                <a href="home?page=${i}" paging-current ="${i}" class=""><li class="paging-items-numbers ${page==i?"active1":""}">${i}</li></a>
                                    </c:forEach>
                            <input data-path = "${requestScope.path}" hidden/>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="./js/menu.js"></script>
        <script>
            const f1 = document.getElementById("f1");
            const sort = document.getElementById("sort");
            sort.addEventListener("change", (e) => {
                let sortType = sort.value;
                const path = window.location.search;
                if (path.includes("?cidd")) {
                    document.getElementById('formCategory').querySelector("#sortForm").value = sortType;
                    document.getElementById('formCategory').submit();
                } else {
                    document.getElementById('formPrice').querySelector("#sortForm").value = sortType;
                    document.getElementById('formPrice').submit();
                }
            });
            const pages = document.querySelectorAll("[paging-current]");
            const path = document.querySelector("[data-path]");
            pages.forEach(page => {
                page.addEventListener("click", (e) => {
                    let sortType = sort.value;
                    e.preventDefault();
                    const currentPage = page.getAttribute("paging-current");
                    const path = window.location.search;
                    if (path.includes("?cidd")) {
                        document.getElementById('formCategory').querySelector("#paging").value = currentPage;
                        document.getElementById('formCategory').querySelector("#sortForm").value = sortType;
                        document.getElementById('formCategory').submit();
                    } else {
                        document.getElementById('formPrice').querySelector("#paging").value = currentPage;
                        document.getElementById('formPrice').querySelector("#sortForm").value = sortType;
                        document.getElementById('formPrice').submit();
                    }
                });
            });

            function setCheck(Obj) {
                var fries = document.getElementsByName('cidd');
                if ((Obj.id === 'c0') && (fries[0].checked === true)) {
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked === true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('formCategory').submit();
            }
            function setCheck1(obj) {
                var fries = document.getElementsByName('price');
                if ((obj.id === 'g0') && (fries[0].checked === true))
                {
                    for (var i = 1; i < fries.length; i++)
                        fries[i].checked = false;
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked === true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('formPrice').submit();
            }
        </script>
    </body>
</html>

