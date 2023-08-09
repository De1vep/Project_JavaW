<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TeaComic - Đọc truyện tranh online</title>
        <link rel="icon" href="img/IMG_2483.PNG" type="image/x-icon">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/pagger.css" rel="stylesheet" type="text/css"/>
        <script src="js/pagger.js" type="text/javascript"></script>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/> 
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
     
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <br/>
            <section class="categories">
                <div class="container">
                    <div class="row">
                        <div class="categories__slider owl-carousel">
                        <c:forEach items="${listComic}" var="o">
                            <a href="detail?cid=${o.comicId}">
                                <div class="col-lg-3">
                                    <div class="categories__item set-bg" data-setbg="${o.comicAvatar}">
                                        <h5>${o.comicName}</h5>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <br/>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Category</a></li>
                            <li class="breadcrumb-item active" >
                                <c:forEach items="${listCategory}" var="o">
                                    <c:if test="${tag == o.categoryId}">${o.categoryName}</c:if>
                                </c:forEach>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div id="content" class="row">
                        <c:forEach items="${listComic}" var="o">
                            <div class="product col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.comicAvatar}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?cid=${o.comicId}" title="View Product">${o.comicName}</a></h4>
                                        <p class="card-text show_txt">${o.comicDescrible}</p>
                                        <div class="col">
                                            <%int index = 0;%>
                                            <c:forEach items="${listChapter}" var="ch" varStatus="i">
                                                <c:if test="${ch.comicId eq o.comicId}">
                                                    <%if(index < 3) {%>
                                                    <p class="btn btn-danger btn-block">                                
                                                        <a href="chapter?cid=${o.comicId}&chno=${ch.chapterNo}" title="View Chapter">Chapter ${ch.chapterNo}</a>
                                                    </p>
                                                    <% index++;}%>    
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div id="paggerbot" class="pagg">
                        <script>
                            renderPagger('paggerbot',${requestScope.pageIndex},${requestScope.totalPages}, 2);
                        </script>
                    </div>
                </div>
                <jsp:include page="Right.jsp"></jsp:include>
                </div>
            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                            function searchByName(param) {
                                var txtSearch = param.value;
                                $.ajax({
                                    url: "/ComicWebsite/searchAjax",
                                    type: "get", //send it through get method
                                    data: {
                                        txt: txtSearch
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("content");
                                        row.innerHTML = data;
                                    },
                                    error: function (xhr) {
                                        //Do Something to handle error
                                    }
                                });
                            }
                            function load(cateid) {
                                $.ajax({
                                    url: "/ComicWebsite/category",
                                    type: "get", //send it through get method
                                    data: {
                                        cid: cateid
                                    },
                                    success: function (responseData) {
                                        document.getElementById("content").innerHTML = responseData;
                                    }
                                });
                            }

                            function myFunction() {
                                var element = document.body;
                                element.classList.toggle("dark-mode");
                            }

        </script>  
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min_1.js" type="text/javascript"></script>
        <script src="js/jquery.slicknav.js" type="text/javascript"></script>
        <script src="js/owl.carousel.min.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

