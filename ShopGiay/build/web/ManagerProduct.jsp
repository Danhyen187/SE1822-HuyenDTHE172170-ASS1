

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Products</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/paging.css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
        <link rel="stylesheet" href="./css/header.css"/>
        <link href="css/manager.css" rel="stylesheet" type="text/css" /> 
        <link rel="stylesheet" href="./css/footer.css"/>
        <style>
            table img {
                width: 150px;
                height: auto;
            }

            h1{
                text-align: center;
            }
            .nav-link{
                font-size: 18px !important;
            }
            .modal .modal-dialog {
                width: 700px !important;
            }
            @media (min-width: 576px){
                .modal-dialog {
                    max-width: 1024px;
                    margin: 1.75rem auto;
                }
            }
        </style>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Products</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <button  type="button" data-target="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> <span>Add New Product</span></button>
                            </div>
                        </div>
                    </div>
                <c:if test="${listP.size() == 0}">
                    <h1>Contains no products </h1>
                </c:if>
                <c:if test="${listP.size() > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th class="text-center">Quantity</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>


                            <c:forEach items="${listP}" var="o">
                                <c:set var="pid" value="${o.id}" />
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}">
                                    </td>
                                    <td>${o.price} $</td>
                                    <td class="text-center">${o.quantity}</td>
                                    <td>
                                        <a href="loadProduct?pid=${o.id}" class="edit btn btn-info mb-3"><i
                                                class="material-icons"
                                                title="Edit">&#xE254;</i></a>
                                        <button id="buttonDelete" class="delete btn btn-info" product-id ="${o.id}" data-target="#deleteEmployeeModal" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" 
                                               title="Delete">&#xE872;</i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                    </tbody>
                </table>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button> </a>

        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="addEmployeeModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Product</h4>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                    </div>
                    <form action="add" method="post" id="f1" >
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.cid}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-success" id="btnSubmit">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade" tabindex="-1" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delete" id="f2">
                        <input name="productId" value="" id="productId" hidden/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete Product?</p>
                            <p class="text-warning"><span>This action cannot be undone.</span></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button class="btn btn-danger" id="cofirmDelete">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://cdn.tiny.cloud/1/qe14wbo2e3d1morsjxg5kufktky9kvfntr0082y4w45lj1da/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="./js/tinymce-config.js"></script>
        <script type="text/javascript">
            const f1 = document.getElementById("f1");
            const f2 = document.getElementById("f2");
            const btnSubmit = document.getElementById("btnSubmit");
            const buttonDeletes = document.querySelectorAll("[product-id]");
            const cofirmDelete = document.getElementById("cofirmDelete");
            btnSubmit.addEventListener("click", (e) => {
                f1.submit();
            });

            buttonDeletes.forEach((button) => {
                button.addEventListener("click", (e) => {
                    cofirmDelete.addEventListener("click", (ev) => {
                        ev.preventDefault();
                        const productId = button.getAttribute("product-id");
                        document.getElementById("productId").value = productId;
                        f2.submit();
                    });
                });
            });


        </script>
    </body>

</html>