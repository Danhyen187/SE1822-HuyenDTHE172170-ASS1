<%-- 
    Document   : Register
    Created on : Oct 13, 2023, 1:16:01 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="./css/register.css"/>
    </head>
    <body>
        <div class="register">
            <form class="form" action="register" method="post">
            <p class="title">Register </p>
            <p class="mess">${mess}</p>
            <p class="message">Signup now and get full access to our web. </p>

            <label>
                <input class="input" type="text"  name="user" required="">
                <span>Username</span>
            </label> 

            <label>
                <input class="input" type="password" name="pass" required="">
                <span>Password</span>
            </label>
            <label>
                <input class="input" type="password" name="repass" required="">
                <span>Confirm password</span>
            </label>
            <button class="submit">Register</button>
            <p class="signin">Already have an acount ? <a href="login">Signin</a> </p>
        </form>
        </div>
    </body>
</html>
