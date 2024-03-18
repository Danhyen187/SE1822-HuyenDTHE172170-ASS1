
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="logreg-forms">
            <c:set var="cookie" value="${pageContext.request.cookies}"/>
            <form class="form-signin" id="formChange" action="changePass" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Change Password</h1>
                <input name="user"  type="text" id="inputEmail" class="form-control mb-2" readonly
                       value="${cookie.cuser.value}"   >
                <input value="" name="cid" hidden/>
                <input name="oldpass"  type="password" id="inputPasswordOld" class="form-control mb-2" placeholder="Old Password" required=""
                       value="" >
                <input name="newpass"  type="password" id="inputPasswordNew" class="form-control" placeholder="New Password" required=""
                       value="" >
                <p class="text-danger" id="mess">${requestScope.mess}</p>

                <button class="btn btn-success btn-block mt-2" type="submit"><i class="fa-regular fa-pen-to-square"></i>Change Password</button>
            </form>


        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
//            const oldPass = document.getElementById("inputPasswordOld");
//            const newPass = document.getElementById("inputPasswordNew");
//            const formChange = document.getElementById("formChange");
//            const mess = document.getElementById("mess");
//            formChange.addEventListener("submit",(e) =>{
//                e.preventDefault();
//                if(newPass.value != oldPass.value){
//                    mess.innerHTML = "Old Password incor";
//                }
//            });
        </script>
    </body>
</html>
