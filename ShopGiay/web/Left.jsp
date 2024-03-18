

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:set var="cid" value="${requestScope.cid}"/>
            <!--FORM-->
            <form id="formCategory" action="home" method="get">

                <li class="list-group-item text-left ${chid[0] ? "active" : ""}">
                    <input type="checkbox" name="cidd" id="c0" 
                           ${chid[0]?"checked":""}
                           value="${0}" onclick="setCheck(this)"/>
                    <label for="c0">ALL</label>
                </li>

                <c:forEach begin="0" end="${listC.size()-1}" var="i">

                    <li class="list-group-item text-left ${chid[i+1]? "active" : ""}">
                        <input type="checkbox" id="c${i+1}" name="cidd" 
                               ${listC.get(i).getCid()==cid?"checked":""}
                               ${chid[i+1]?"checked":""}
                               value="${listC.get(i).getCid()}" onclick="setCheck(this)"/> 
                        <label for="c${i+1}">${listC.get(i).getName()}</label>
                    </li>
                </c:forEach>
                <input name = "page" id="paging" value="1" hidden />
                <input name = "sort" id="sortForm" value="default" hidden />
            </form>

            <!--END FORM-->
        </ul>

        <!--Price filter-->
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Prices</div>
        <ul class="list-group category_block">
            <c:set var="pp" value="${requestScope.pp}"/>
            <c:set var="pb" value="${requestScope.pb}"/>
            <!--FORM-->
            <form id="formPrice" action="home" method="get">
                <li class="list-group-item text-left ${pb[0]? "active" : ""}">
                    <input type="checkbox" id ="g0" name="price"
                           ${pb[0]?"checked":""}
                           value="0" onclick="setCheck1(this)"/>
                    <label for="g0">ALL</label>
                </li>
                <c:forEach begin="0" end="${4}"  var="i">
                    <li class="list-group-item text-left ${pb[i+1]? "active" : ""}">
                        <input type="checkbox" id="g${i+1}" name="price" 
                               ${pb[i+1]?"checked":""}
                               value="${(i+1)}" onclick="setCheck1(this)"/>
                        <label for="g${i+1}">${pp[i]}</label>
                    </li>
                </c:forEach>      
                <input name = "page" id="paging" value="1" hidden />
                <input name = "sort" id="sortForm" value="default" hidden />
            </form>

            <!--END FORM-->
        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last product</div>
        <div class="card-body card-product">
            <img class="img-fluid" src="${pnew.image}" />
            <h5 class="card-title"><a href="detail?pid=${pnew.id}">${pnew.name}</a></h5>
            <p class="bloc_left_price">${pnew.price} $</p>
            <p class="card-text">${pnew.title}</p>
        </div>
    </div>
</div>