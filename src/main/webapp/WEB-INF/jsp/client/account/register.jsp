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
                        <form:form action="/account/register" method="post" modelAttribute="customer" >
                            <span class="alert-success">${message}</span>
                            <span class="alert-danger">${error}</span>
                            <input hidden name="id" value="${customer.id}">
                            <div class="form-group first">
                                <label>full name</label>
                                <form:input type="text" path="fullName" class="form-control" value="${customer.fullName}"/>
                                <form:errors path="fullName" cssClass="error"></form:errors>
                            </div>
                            <div class="form-group first">
                                <label>Email</label>
                                <form:input type="text" path="email" class="form-control" />

                            </div>
                            <div class="form-group last mb-4">
                                <label>Password</label>
                                <form:input type="password" path="passWord" class="form-control" />

                            </div>
                            <div class="form-group last mb-4">
                                <label>Confirm Password</label>
                                <input type="password" name="passWord2" class="form-control" />

                            </div>
                            <div class="form-group first">
                                <label>Address</label>
                                <form:input type="text" path="address" class="form-control" />

                            </div>

                            <input type="submit" value="Register" class="btn btn-block btn-primary">

                        </form:form>
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