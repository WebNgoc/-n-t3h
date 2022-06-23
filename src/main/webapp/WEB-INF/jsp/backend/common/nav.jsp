<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<div id="warpper" class="nav-fixed">
    <nav class="topnav shadow navbar-light bg-white d-flex">
        <div class="navbar-brand"><a href="/">UNITOP ADMIN</a></div>
        <div class="nav-right ">
            <div class="btn-group mr-auto">
                <button type="button" class="btn dropdown" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                    Quản lý
                    <i class="plus-icon fas fa-plus-circle"></i>
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/backend/product/list">Sản phẩm</a>
                    <a class="dropdown-item"  href="/backend/category/list">Danh mục</a>
                    <a class="dropdown-item" href="/backend/brand/list">Thương hiệu</a>
                    <a class="dropdown-item"  href="/backend/order/list">Đơn hàng</a>
                    <a class="dropdown-item"  href="/backend/customer/list">Khách hàng</a>
                    <a class="dropdown-item"  href="/backend/user/list">User</a>
                </div>
            </div>
            <div class="btn-group">
                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">

                    <sec:authentication property="principal.fullName"></sec:authentication>

                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Tài khoản</a>
                    <a class="dropdown-item" href="/logout">Thoát</a>
                </div>
            </div>
        </div>
    </nav>