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
<style>
    div {text-align: center;}
</style>
<body>
<div class="container">
    <div class="row justify-content-md-center h-100">
        <div class="col-sm 12 col-md-6 col-lg-4 my-auto">
        <h2>Login</h2>
        <p>${error}</p>
        <form action="/login" method="post">
            <div class="input-group mb-3 input-group-md">
                <span class="input-group-text" id="username"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="username" placeholder="Username" aria-label="Username" aria-describedby="username">
            </div>
            <div class="input-group mb-3 input-group-md">
                <span class="input-group-text" id="password"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="password" placeholder="Password" aria-label="Password" aria-describedby="password">
            </div>
            <div class="d-grid gap-2" style="text-align: right">
                <button class="btn btn-success" type="submit">Login <i class="fa fa-sign-in"></i></button>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>
