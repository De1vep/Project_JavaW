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
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Comic</h4>
                                <a href="manager"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Comic Id</label>
                                    <input value="${comic.comicId}" name="cid" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Comic Name</label>
                                    <input value="${comic.comicName}" name="cname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Comic Avatar</label>
                                    <input value="${comic.comicAvatar}" name="cavatar" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Comic Author</label>
                                    <input value="${comic.comicAuthor}" name="cauthor" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Comic Describle</label>
                                    <textarea name="cdescrible" class="form-control" required>${comic.comicDescrible}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Comic Status</label>
                                    <input value="${comic.comicStatus}" name="cstatus" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Category</label><br/>       
                                    <c:forEach items="${listCategory}" var="o">
                                        <input type="checkbox" class="form-check-input"
                                               <c:forEach items="${requestScope.comic.categories}" var="p">
                                                   <c:if test="${o.categoryId eq p.categoryId}">
                                                       checked="checked"
                                                   </c:if>
                                               </c:forEach>
                                               name="caid" value="${o.categoryId}"/> ${o.categoryName}<br/>   
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