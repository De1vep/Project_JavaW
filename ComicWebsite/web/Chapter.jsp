<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TeaComic - Đọc truyện tranh online</title>
        <link rel="icon" href="img/IMG_2483.PNG" type="image/x-icon">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

        <c:forEach items="${readComic.chapters}" var="ch">
            <select name="chapter" onchange="window.location.href = this.value;">
                <c:forEach items="${listChapter}" var="o">
                    <c:if test="${ch.comicId == o.comicId}">
                        <option <c:if test="${o.chapterNo == chap}">
                                selected="selected"
                            </c:if> 
                            <c:set var="comicId" value="${ch.comicId}"></c:set>
                            value="chapter?cid=${ch.comicId}&chno=${o.chapterNo}" >Chuong ${o.chapterNo}
                        </option>
                    </c:if>
                </c:forEach>
            </select>

            <img class="rounded mx-auto d-block" src="${ch.chapterImg}" alt="thangdz">
        </c:forEach>



        <div>
            <c:forEach items="${listComment}" var="co">
                <div>
                    <h4>${co.username}</h4>
                    <span>- 20 October, 2018</span>
                    <br>
                    <p>${co.comment}</p>
                </div>
            </c:forEach>
        </div>

        <form action="postComment" method="POST">  
            Enter Comment:<br/>  
            <textarea name="comment" required></textarea>
            <br/>  
            <input type="hidden" value="${comicId}" name="cid">  
            <input type="hidden" value="${chap}" name="chno">  
            <input type="hidden" value="${sessionScope.account.username}" name="username">  
            <input type="submit" value="Post Comment">  
        </form>  

        <jsp:include page="Footer.jsp"></jsp:include>
        <script>
            function myFunction() {
                var element = document.body;
                element.classList.toggle("dark-mode");
            }
        </script>
    </body>
</html>

