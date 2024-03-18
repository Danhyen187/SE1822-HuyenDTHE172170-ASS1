<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/footer.css"/>
        <link rel="stylesheet" href="./css/paging.css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
        <link rel="stylesheet" href="./css/header.css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-8">
                    <h1 class="text-center">Nhập mã OTP xác thực</h1>
                    <form action="otp-password" method="POST">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input class="form-control" type="email" id="email" name="email" value="${cookie.cEmail.value}" required readonly>
                        </div>
                        <div class="form-group">
                            <label for="otp">Mã OTP</label>
                            <input class="form-control" type="text" id="otp" name="otp" required>
                        </div>
                        <c:if test="${error != null}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        <div class="form-group">
                            <button class="btn btn-primary btn-block" type="submit">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <!--Script-->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    </body>
</html>
