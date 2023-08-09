<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TeaComic - Followed Comic</title>
        <link rel="icon" href="img/IMG_2483.PNG" type="image/x-icon">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>   
        <link href="css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div id="content" class="row">
            <c:forEach items="${listComic}" var="o">
                <c:forEach items="${listFollowed}" var="fl">
                    <c:if test="${o.comicId == fl.comicId and sessionScope.account.username eq fl.username and fl.flStatus eq true}">
                        <div class="product col-12 col-md-6 col-lg-4">
                            <div class="card">
                                <img class="card-img-top" src="${o.comicAvatar}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="detail?cid=${o.comicId}" title="View Product">${o.comicName}</a></h4>
                                    <p class="card-text show_txt">${o.comicDescrible}</p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script>
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
