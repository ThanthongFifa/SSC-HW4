<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid mt-4">
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand">SSC - Login Webapp</a>
            <a class="btn btn-danger" type="button" href="/logout">
                <i class="fa fa-sign-out"></i>LogOut</a>
        </div>
    </nav>

    <div class="row">
        <div class="col-12">
            <h3 class="mt-4">Welcome, ${username}</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <c:if test="${not empty message}">
                <c:choose>
                    <c:when test="${hasError}">
                        <div class="alert alert-danger" role="alert">
                                ${message}
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-success" role="alert">
                                ${message}
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-12">
            <a class="btn btn-success" type="button" href="/user/create">
                <i class="fa fa-user"></i> &nbsp; Create Account
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th class="py-2">id</th>
                    <th class="py-2">Username</th>
                    <th class="py-2">DisplayName</th>
                    <th class="py-2">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <th class="py-3">${user.id}</th>
                        <th class="py-3">${user.username}</th>
                        <th class="py-3">${user.displayName}</th>
                        <th class="align-middle">
                            <a class="btn btn-warning" type="button" href="/user/edit?username=${user.username}">Edit<i class="fa fa-pencil"></i></a>
                            <c:if test="${currentUser.username != user.username}">

                                <button class="btn btn-danger"
                                        type="button"
                                        href="/user/delete?username=${user.username}"
                                        data-bs-toggle="modal"
                                        data-bs-target="#delete-modal-${user.id}">
                                    Delete<i class="fa fa-trash"></i>
                                </button>

                                <div class="modal" tabindex="-1" id="delete-modal-${user.id}" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">User Deleting Confirmation</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Do you want to delete user <b>${user.displayName}</b> (<b>${user.username}</b>) ?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <a class="btn btn-danger" type="button" href="/user/delete?username=${user.username}">Delete<i class="fa fa-trash"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
