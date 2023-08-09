<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Comic</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/pagger.css" rel="stylesheet" type="text/css"/>
        <script>
            function renderPagger(id, pageIndex, totalPages, gap) {

                var container = document.getElementById(id);
                if (pageIndex - gap >= 1)
                    container.innerHTML += '<a href="manager?page=1">First</a>';


                for (var i = pageIndex - gap; i < pageIndex; i++)
                    if (i > 0)
                        container.innerHTML += '<a href="manager?page=' + i + '">' + i + '</a>';

                container.innerHTML += '<span>' + pageIndex + '</span>';

                for (var i = pageIndex + 1; i <= pageIndex + gap; i++)
                    if (i <= totalPages)
                        container.innerHTML += '<a href="manager?page=' + i + '">' + i + '</a>';

                if (pageIndex + gap < totalPages)
                    container.innerHTML += '<a href="manager?page=' + totalPages + '">Last</a>';

            }
        </script>
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
                            <h2>Manage <b>Comic</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addComicModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add Comic</span></a>
                            <a href="#addChapterModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add Chapter</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Avatar</th>
                            <th>Author</th>
                            <th>Describle</th>
                            <th>PostDate</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listComic}" var="o">
                            <tr>
                                <td>${o.comicId}</td>
                                <td>${o.comicName}</td>
                                <td>
                                    <img src="${o.comicAvatar}">
                                </td>
                                <td>${o.comicAuthor}</td>
                                <td>    <textarea>${o.comicDescrible}</textarea> </td>
                                <td>${o.comicPostDate}</td>
                                <td>${(comic.comicStatus)?"Update":"Finished"}</td>
                                <td>
                                    <a href="loa    d?cid=${o.comicId}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="delete?cid=${o.comicId}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    <a href="managerChapter?cid=${o.comicId}" class="editChapter" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit Chapter">&#xE254;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="paggerbot" class="pagination pagg">
                    <script>
                        renderPagger('paggerbot',${requestScope.pageIndex},${requestScope.totalPages}, 2);
                    </script>
                </div>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addComicModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="insert" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Comic</h4>
                            <a href="manager"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="cname" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Avatar</label>
                                <input name="cavatar" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Author</label>
                                <input name="cauthor" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Describle</label>
                                <textarea name="cdescrible" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Comic Status</label>
                                <input name="cstatus" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label><br/>
                                <c:forEach items="${listCategory}" var="o">
                                    <input class="form-check-input" type="checkbox" name="caid" value="${o.categoryId}"/> ${o.categoryName}   
                                </c:forEach>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add Chapter Modal HTML -->
        <div id="addChapterModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="insertChapter" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Chapter</h4>
                            <a href="manager"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Comic</label><br/>
                                <select name="comicId" class="form-control" required>
                                    <c:forEach items="${listComicc}" var="c">
                                        <option value="${c.comicId}" >${c.comicName}</option>
                                    </c:forEach>
                                </select>    
                            </div>    
                            <div class="form-group">
                                <label>Name</label>
                                <input name="chapterName" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="chapterImg" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Chapter No</label>
                                <input name="chapterNo" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>