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
            <h5 class="m-0 ">Sản phẩm</h5>

        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
<%--                        <a class="btn btn-success" href="/backend/product/create">Tạo mới</a>--%>
<%--                        <a class="btn btn-warning" href="/backend/product/list">Danh sách</a>--%>
                    </div>
                    <div class="col-sm-4">
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
                    <td class="col-sm-2">STT</td>
                    <td class="col-sm-2">Khách hàng</td>
                    <td class="col-sm-2">Ngày mua hàng</td>
                    <td class="col-sm-2">Tổng hoá đơn</td>
                    <td class="col-sm-2"></td>
                </tr>
                </thead>
                <tbody>
                <c:set value="1" var="stt"></c:set>
                <c:forEach items="${listOrders}" var="order">
                    <tr>
                        <td>
                            <h4>${stt}</h4>
                        </td>
                        <td>
                            <h4>${order.customerEntity.fullName}</h4>
                        </td>
                        <td>
                            <h4>${order.orderDate}</h4>
                        </td>
                        <td>
                            <h4><fmt:formatNumber value="${order.amount}" /> VNĐ</h4>
                        </td>
                        <td>
                            <a class="btn btn-success check_out" href="/backend/order/detail/${order.id}">Chi tiết</a>
                        </td>
                    </tr>
                    <c:set var="stt" value="${stt + 1}"></c:set>
                </c:forEach>

                </tbody>
            </table>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>