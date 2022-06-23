<%@page pageEncoding="UTF-8" %>
<div id="page-body" class="d-flex">
    <div id="sidebar" class="bg-white">
        <ul id="sidebar-menu">
            <li class="nav-link">
                <a href="?view=dashboard">
                    <div class="nav-link-icon d-inline-flex">
                        <i class="far fa-folder"></i>
                    </div>
                    Dashboard
                </a>
                <i class="arrow fas fa-angle-right"></i>
            </li>

            <li class="nav-link">
                <a href="">
                    <div class="nav-link-icon d-inline-flex">
                        <i class="far fa-folder"></i>
                    </div>
                   Thống kê
                </a>
                <i class="arrow fas fa-angle-right"></i>
                <ul class="sub-menu">
                    <li><a href="/backend/report">Hàng tồn</a></li>
<%--                    <li><a href="/backend/report/sales_cus">Doanh số</a></li>--%>
<%--                    <li><a href="?view=cat">Danh mục</a></li>--%>
                </ul>
            </li>

            <li class="nav-link">

                    <div class="nav-link-icon d-inline-flex">
                        <i class="far fa-folder"></i>
                    </div>
                    Quản lý
                <i class="arrow fas fa-angle-right"></i>
                <ul class="sub-menu">
                    <li><a href="/backend/product/list">Sản phẩm</a></li>
                    <li><a href="/backend/category/list">Danh mục</a></li>
                    <li><a href="/backend/brand/list">Thương hiệu</a></li>
                    <li><a href="/backend/order">Đơn hàng</a></li>
                    <li><a href="/backend/customer/list">Khách hàng</a></li>
                    <li><a href="/backend/user/list">User</a></li>
                </ul>
            </li>

        </ul>
    </div>
    <div id="wp-content">



