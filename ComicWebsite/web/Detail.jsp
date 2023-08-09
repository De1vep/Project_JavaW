<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }


            #follow-button {
                color: #3399FF;
                font-family: "Helvetica";
                font-size: 10pt;
                background-color: #ffffff;
                border: 1px solid;
                border-color: #3399FF;
                border-radius: 3px;
                width: 85px;
                height: 30px;
                position: absolute;
                top: 50px;
                left: 50px;
                cursor: hand;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">

                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> 
                                                    <a href="#">
                                                        <img src="${comic.comicAvatar}">
                                                </a>
                                            </div>
                                        </div> 
                                    </article> 
                                </aside>

                                <aside class="col-sm-7">
                                    <article class="card-body">

                                        <h3 class="title mb-3">${comic.comicName}</h3>
                                        <p>(Post date: ${comic.comicPostDate})</p>
                                        <p>View: ${allView.viewed}</p>

                                        <c:forEach items="${comicc.categories}" var="ca">
                                            ${ca.categoryName}
                                        </c:forEach>

                                        <p>Author: ${comic.comicAuthor}</p>
                                        <p>Status: ${(comic.comicStatus)?"Update":"Finished"}</p>

                                        <c:forEach items="${listFollowed}" var="fl">
                                            <c:if test="${sessionScope.account.username eq fl.username}">
                                                <c:if test="${comic.comicId == fl.comicId}">
                                                    <button class="btn btn-danger"> 
                                                        <a href="following?username=${fl.username}&cid=${fl.comicId}&status=${fl.flStatus}">
                                                            ${(fl.flStatus)?"UnFollow":"Follow"}
                                                        </a>
                                                    </button>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>

                                        <div class="col">
                                            <c:forEach items="${listChapter}" var="ch">
                                                <c:if test="${ch.comicId eq comic.comicId}">
                                                    <c:if test="${ch.chapterNo == 1}">
                                                        <p class="btn btn-danger btn-block">                                
                                                            <a href="chapter?cid=${comic.comicId}&chno=1" title="View Chapter">Read First</a>
                                                        </p>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </article>
                                </aside>

                            </div>
                        </div>
                    </div> 

                    <dl class="item-property">
                        <dt>Description</dt>
                        <dd>
                            <p>${comic.comicDescrible}</p>
                        </dd>
                    </dl>  

                    <div class="col">
                        <c:forEach items="${listChapter}" var="ch">
                            <c:if test="${ch.comicId eq comic.comicId}">
                                <p class="btn btn-danger btn-block">                                
                                    <a href="chapter?cid=${comic.comicId}&chno=${ch.chapterNo}" title="View Chapter">Chapter ${ch.chapterNo}</a>
                                </p>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <jsp:include page="Right2.jsp"></jsp:include>
                </div>
            </div>

        <c:forEach items="${listComment}" var="co">
            <div>
                <h4>${co.username}, Chapter ${co.chapterId}</h4>
                <br>
                <p>${co.comment}</p>
            </div>
        </c:forEach>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script>
            function myFunction() {
                var element = document.body;
                element.classList.toggle("dark-mode");
            }
        </script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-color/2.1.2/jquery.color.min.js"></script>
    </body>
</html>
