<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">


    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listCategory}" var="o">
                <li class="list-group-item text-white ${tag == o.categoryId ? "active":""}"><a href="category?caid=${o.categoryId}">${o.categoryName}</a></li>
                </c:forEach>
        </ul>
    </div>


    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last Comic</div>
        <div class="card-body">
            <a href="detail?cid=${p.comicId}">
                <img class="img-fluid" src="${p.comicAvatar}" />
                <h5 class="card-title">${p.comicName}</h5>
                <div class="col">
                    <c:forEach items="${listChapter}" var="ch">
                        <c:if test="${ch.comicId eq p.comicId}">
                            <p class="btn btn-danger btn-block">
                                <a href="chapter?cid=${p.comicId}&chno=${ch.chapterNo}" title="View Chapter">Chapter ${ch.chapterNo}</a>
                            </p>
                        </c:if>
                    </c:forEach>
                </div>
            </a>
        </div>
    </div>    
</div>