<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<div class="container-fluid mt-4">
    <body>
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
                <th class="py-2">${user.id}</th>
                <th class="py-2">${user.username}</th>
                <th class="py-2">${user.displayName}</th>
                <th class="align-middle">
                    <button class="btn btn-warning btn-sm" type="button">Edit</button>
                    <button class="btn btn-danger btn-sm" type="button">Delete</button>
                </th>
            </tr>
        </c:forEach>
        </tbody>
</div>
</table>
</body>
</html>
