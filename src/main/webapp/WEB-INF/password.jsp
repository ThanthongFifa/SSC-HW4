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
<title>Home Page</title>
<body>
<div class="container-fluid mt-4">
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="">SSC - Login Webapp</a>
            <a class="btn btn-danger" type="button" href="/logout">
                <i class="fa fa-sign-out"></i>LogOut</a>
        </div>
    </nav>
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

    <div class="row justify-content-md-center">
        <div class="col-sm 12 col-md-6 col-lg-4 mt-4">
            <h3 style="text-align: center" class="mb-3">Edit Password (<b>${username}</b>)</h3>
            <p>${error}</p>
            <form action="/user/password?username=${username}" method="post" autocomplete="off">
                <div class="input-group mb-3 input-group-md">
                    <span class="input-group-text" id="displayName" ><i class="fa fa-user"></i></span>
                    <input type="password" class="form-control"
                           name="password" placeholder="Password"
                           aria-label="Password" aria-describedby="password" autocomplete="off" value="${password}">
                </div>
                <div class="input-group mb-3 input-group-md">
                    <span class="input-group-text" id="cpassword" ><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control"
                           name="cpassword" placeholder="Confirm Password"
                           aria-label="Confirm Password" aria-describedby="cpassword" autocomplete="off" value="${cpassword}">
                </div>
                <div class="d-grid gap-2" style="text-align: right">
                    <button class="btn btn-success" type="submit">Save <i class="fa fa-save"></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
