
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/paging.css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
        <link rel="stylesheet" href="./css/header.css"/>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/footer.css"/>
        <style>
            .img-preview{
                width: 400px;
                height: auto;
            }
            .nav-link{
                font-size: 18px !important;
            }
            h4{
                color: black;
            }
            .modal-dialog {
                max-width: 1111px;
                margin: 1.75rem auto;
            }
        </style>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Product</b></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4> Edit Product </h4>
                                <a href="manager" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID Product</label>
                                    <input type="text" name="id" value="${detail.id}" readonly class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" value="${detail.name}" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" name="image" value="${detail.image}" class="form-control" required>
                                <img src="${detail.image}" alt="${detail.name}" class="img-preview"/>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input value="${detail.price}" name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="number" value="${detail.quantity}" class="form-control" required/>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea  class="form-control" name="title" required>${detail.title}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="description" required rows="10">${detail.description}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <c:set value="${cateID}" var="id"/>
                                        <option ${(id==c.cid)?"selected":""} value="${c.cid}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>				
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="manager">Cancel</a>
                            <input type="submit" class="btn btn-success" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        
        <script src="https://cdn.tiny.cloud/1/qe14wbo2e3d1morsjxg5kufktky9kvfntr0082y4w45lj1da/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="js/tinymce-config.js"></script>
    </body>
</html>