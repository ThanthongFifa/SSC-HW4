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
                <i class="fa fa-sign-out"></i>Log Out</a>
        </div>
    </nav>
    <h3 class="mt-4">Welcome, ${username}</h3>
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
                    <button class="btn btn-warning btn-sm" type="button"><i class="fa fa-pencil"></i>Edit</button>
                    <button class="btn btn-danger btn-sm" type="button"><i class="fa fa-trash"></i>Delete</button>
                </th>
            </tr>
        </c:forEach>
        </tbody>
</div>
</table>
</body>
</html>
