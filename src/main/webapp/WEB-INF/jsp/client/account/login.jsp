<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

    <title>Login #7</title>
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
                            <h3>Sign In</h3>
                            <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur
                                adipisicing.</p>
                        </div>
                        <form action="/account/login" method="post" >
                            <span class="alert-success">${message}</span>
                            <span class="alert-danger">${error}</span>
<%--                            <input hidden name="id" value="${}">--%>
                            <div class="form-group first">
                                <label>Email</label>
                                <input type="text" name="email" class="form-control" value="${cookie.customerEntity.value}"/>

                            </div>
                            <div class="form-group last mb-4">
                                <label>Password</label>
                                <input type="password" name="password" class="form-control" value="${cookie.pass.value}"/>

                            </div>

                            <div class="d-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                    <input type="checkbox" checked="checked"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <span class="ml-auto"><a href="/forgot" class="forgot-pass"><spring:message code="menu.Forgot_Password"/></a></span>
                            </div>

                            <input type="submit" value="Log In" class="btn btn-block btn-primary">

                            <span class="d-block text-left my-4 text-muted">&mdash; or login with &mdash;</span>

                            <div class="social-login">
                                <a href="#" class="facebook">
                                    <span class="icon-facebook mr-3"></span>
                                </a>
                                <a href="#" class="twitter">
                                    <span class="icon-twitter mr-3"></span>
                                </a>
                                <a href="#" class="google">
                                    <span class="icon-google mr-3"></span>
                                </a>
                            </div>
                            <label>Nếu bạn chưa có tài khoản vui lòng đăng ký</label>
                            <span class="ml-auto"><a href="/account/register" class="forgot-pass"><spring:message code="menu.Register"/> </a></span>

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