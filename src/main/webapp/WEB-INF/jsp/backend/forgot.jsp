<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/admin_login/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/admin_login/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/admin_login/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="/resources/admin_login/css/style.css">

    <title>Forgot</title>
</head>
<body>


<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="/resources/admin_login/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
            </div>
            <div class="col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="mb-4">
                            <h3>Forgot Password Form</h3>
                            <p class="mb-4">Vui lòng nhập email của bạn!</p>
                        </div>
                        <form action="/forgot-form" method="post">
                            <span style="color: green">${message}</span>
                            <span style="color: red">${error}</span>
                            <div class="form-group last mb-4">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control"/>

                            </div>

                            <input type="submit" value="Send" class="btn btn-block btn-primary">


                        </form>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>


<script src="/resources/admin_login/js/jquery-3.3.1.min.js"></script>
<script src="/resources/admin_login/js/popper.min.js"></script>
<script src="/resources/admin_login/js/bootstrap.min.js"></script>
<script src="/resources/admin_login/js/main.js"></script>
</body>
</html>