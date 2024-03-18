
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css"/>
        <link rel="stylesheet" href="./css/profile.css"/>
        <link rel="stylesheet" href="./css/menu.css"/>
         <link rel="stylesheet" href="./css/footer.css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="page-content page-container" id="page-content">
                <div class="padding">
                    <form action="updateProfile" method="post" id="f1" enctype="multipart/form-data">
                        <div class="row container d-flex justify-content-center">
                            <div class="col-xl-12 col-md-12">
                                <div class="card user-card-full">
                                    <div class="row m-l-0 m-r-0">
                                        <input name="id" type="text" value="${acc.id}" hidden/>
                                        <div class="col-lg-4 col-sm-12 bg-c-lite-green user-profile">
                                            <div class="m-b-25">
                                                <div class="card-block text-center text-white">
                                                <c:if test="${acc.avatar == ''}">
                                                        <img src="https://img.icons8.com/bubbles/100/000000/user.png" upload-image-preview class="image-preview" alt="User-Profile-Image">
                                                </c:if>
                                                  <c:if test="${acc.avatar !=''}">
                                                      <img src="./uploads/${acc.avatar}" upload-image-preview class="image-preview" alt="User-Profile-Image">
                                                </c:if>
                                                </div>
                                                <div class="form-group" upload-image>
                                                    <input type="file" class="form-control-file form-control-sm" name="file" id="file"
                                                           upload-image-input accept = "image/*"/>
                                                    <span close-image-preview class="close-image" ></span>
                                                </div>
                                            <c:if test="${acc.fullname != ''}">
                                                <h6 class="f-w-600 text-center" id="user-name">${acc.fullname}</h6>
                                            </c:if>
                                            <c:if test="${acc.fullname == ''}">
                                                <h6 class="f-w-600 text-center" id="user-name">${acc.user}</h6>
                                            </c:if>

                                            <c:if test="${acc.isSell == 1}">
                                                <p class="text-center">Seller</p>
                                            </c:if>
                                            <c:if test="${acc.isAdmin == 1}">
                                                <p class="text-center">Admin</p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-sm-12 justify-content-center">
                                        <p>${mess}</p>
                                        <div class="card-block">
                                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                            <div class="row justify-content-center">
                                                <div class="col-lg-6 col-md-8 col-sm-12">
                                                    <p class="m-b-10 f-w-600">Full Name</p>
                                                    <input name="fullname" type="text" value="${acc.fullname}" id="name" required />
                                                    <input name="image" value="${acc.avatar}" hidden/>
                                                </div>
                                                <div class="col-lg-6 col-md-8 col-sm-12">
                                                    <p class="m-b-10 f-w-600">Email</p>
                                                    <input name="email" type="email" value="${acc.email}"  required/>
                                                </div>
                                                <div class="col-lg-6 col-md-8 col-sm-12">
                                                    <p class="m-b-10 f-w-600">Phone</p>
                                                    <span class="messError" style="color: red"></span>
                                                    <input name="phone" type="text" value="${acc.phone}" id="phone" required />
                                                </div>
                                                <div class="col-lg-6 col-md-8 col-sm-12">
                                                    <p class="m-b-10 f-w-600">Gender</p>
                                                    <span class="messErrorGender" style="color: red"></span>
                                                    <select name="gender" id="gender">
                                                        <option value="">--Select Gender--</option>
                                                        <option value="1" ${acc.gender == '1' ? 'selected' : ''}>Male</option>
                                                        <option value="0" ${acc.gender == '0' ? 'selected' : ''} >Female</option>
                                                    </select>
                                                </div>
                                                    <div class="col-lg-6 col-md-8 col-sm-12 text-center mt-3">
                                                        <a class="btn btn-primary btn-sm" href="changePass?cid=${acc.id}">Change Password</a>
                                                    </div>
                                                <div class="col-lg-6 col-md-8 col-sm-12 text-center mt-3">
                                                    <button class="btn btn-primary btn-sm" type="submit" id="updateBtn">Update</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/monaco-editor@0.36.1/min/vs/loader.js"></script>
        <script src="./js/profile.js"></script>
        <script >
            const f1 = document.getElementById("f1");
            const messError = f1.querySelector(".messError");
            const messErrorGender = f1.querySelector(".messErrorGender");
            const gender = document.getElementById("gender");
            f1.addEventListener("submit", (e) => {
                e.preventDefault();
                const regex = /^0[3-9]{3}[0-9]{6}/;
                if (!regex.test(phone.value)) {
                    messError.innerHTML = "Phone number is digit and Have 10 number digit";
                } else if (!gender.value) {
                    messErrorGender.innerHTML = "Select gender";
                } else {
                    f1.submit();
                }
            });
        </script>
    </body>
</html>
