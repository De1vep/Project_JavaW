<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Chapter</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script>
            function loadChapter(id) {
                window.location.href = "loadChapter?cid="+${comic.comicId} + "&chno=" + id;
            }

        </script>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manager <b>Chapter</b></h2>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Comic Name</th>
                            <th>Chapter Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${comic.comicName}</td>
                            <td>
                                <c:forEach items="${comic.chapters}" var="c">
                                    <c:forEach items="${listChapter}" var="ch">
                                        <c:if test="${c.chapterNo == ch.chapterNo}">
                                            <input type="button" onclick="loadChapter(${ch.chapterNo});" value="${ch.chapterName}"/><br/>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </td>
                        </tr>        
                    </tbody>
                </table>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>
        </div>

    </body>
</html>


