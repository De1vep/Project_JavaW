<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Comic</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Comic</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editComicModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editChapter" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Chapter</h4>
                                <a href="manager"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                            </div>
                            <div class="modal-body">					
                              
                                <div class="form-group">
                                    <c:forEach items="${comic.chapters}" var="c">
                                        <c:forEach items="${listChapter}" var="ch">
                                            <c:if test="${c.chapterNo == ch.chapterNo}">
                                                <label>Comic Id</label>
                                                <input value="${ch.comicId}" name="cid" type="text" class="form-control" readonly required>
                                                <label>Chapter Name</label><br/>
                                                <input name="chapterName" type="text" class="form-control" value="${ch.chapterName}"/><br/>
                                                <label>Chapter No</label><br/>
                                                <input name="chapterNo" type="text" class="form-control" value="${ch.chapterNo}"/><br/>
                                                <label>Chapter Image</label>
                                                <input name="chapterImg" type="text" class="form-control" value="${ch.chapterImg}" />
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>  
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>