<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="editAccountModal" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editAccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Comic</h4>
                            <a href="managerAccount"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Username</label>
                                <input value="${listAccount.username}" name="username" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input value="${listAccount.password}" name="password" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Display Name</label>
                                <input value="${listAccount.displayName}" name="displayName" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Group</label><br/>
                                <c:forEach items="${listGroup}" var="o">
                                    <input type="radio" class="form-check-input"
                                           <c:if test="${o.gid eq listAccount.gro.gid}">
                                               checked="checked"
                                           </c:if>
                                           name="group" value="${o.gid}"/> ${o.gname}<br/>   
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
    </body>
</html>
