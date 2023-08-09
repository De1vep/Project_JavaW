<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last Comic</div>
        <div class="card-body">
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
        </div>
    </div>    
</div>