<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_1.jsp"></jsp:include>
<div id="content" class="container-fluid">
    <div class="card">
        <div class="card-header font-weight-bold d-flex justify-content-between align-items-center">
            <h5 class="m-0 ">Thống kê hàng tồn kho và doanh thu theo sản phẩm</h5>

        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-success" href="/backend/report">Thống kê theo danh mục</a>
                    </div>
                    <div class="col-sm-4">
                        <form action="/backend/report/product" method="post">
                            <input id="startTime" type="text" name="date" >
                            <script>
                                $('#startTime').datepicker({
                                    format: 'yyyy-mm-dd',
                                    autoclose: true
                                })
                            </script>
                            <button class="btn" type="submit" href=""> <i class="fa fa-calendar"></i></button>
                        </form>
                    </div>
                    <div class="col-sm-4">
                        <form action="#">
                            <div class="row">
                                <input type="" class="form-control form-search" placeholder="Tìm kiếm">
                                <input type="submit" name="btn-search" value="Tìm kiếm" class="btn btn-primary">
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="col-sm-1">STT</td>
                    <td class="col-sm-1">Ảnh</td>
                    <td class="col-sm-2">Tên sản phẩm</td>
                    <td class="col-sm-2">Đơn giá</td>
                    <td class="col-sm-1">Số lượng nhập</td>
                    <td class="col-sm-1">Số lượng tồn kho</td>
                    <td class="col-sm-2">Doanh thu</td>
                    <td class="col-sm-2">Ngày tạo</td>
                </tr>
                </thead>
                <tbody>
                <c:set value="1" var="stt"></c:set>
                <c:forEach items="${listSale}" var="a">
                    <tr>
                        <td>
                            <h4>${stt}</h4>
                        </td>

                        <td width="100"><img alt="" src="${a[1]}" width="80" height="70"></td>

                        <td>
                            <p>${a[2]}</p>
                        </td>
                        <td>
                            <p class="btn btn-danger"><fmt:formatNumber value="${a[3]}"/> đ</p>
                        </td>
                        <td>
                            <p class="btn btn-warning">${a[4]}</p>
                        </td>
                        <td>
                            <p class="btn btn-success">${a[5]}</p>
                        </td>
                        <td>
                            <p class="btn btn-danger"><fmt:formatNumber value="${a[6]}"/> đ</p>
                        </td>
                        <td>
                            <p class="btn btn-primary">${a[7]}</p>
                        </td>
                        <td>
<%--                            <a class="btn btn-success check_out" href="/backend/order/detail/${order.id}">Chi tiết</a>--%>
                        </td>
                    </tr>
                    <c:set var="stt" value="${stt + 1}"></c:set>
                </c:forEach>

                </tbody>
            </table>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>