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
            <h5 class="m-0 ">Chi tiết đơn hàng</h5>

        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-success" href="/backend/order">Danh sách đơn hàng</a>
                        <%--                        <a class="btn btn-warning" href="/backend/product/list">Danh sách</a>--%>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-5">
                <div class="section" id="customer-info-wp">
                    <div class="section-head">
                        <h3 class="section-title">Thông tin khách hàng</h3>
                    </div>
                    <div class="section-detail">

                        <%--                                                                <input hidden name="${InfoCustomer.id}">--%>
                        <div class="form-group">
                            <label>Họ tên</label>
                            <input class="form-control" name="fullName" value="${listOrderId.customerEntity.fullName}" readonly="true"/>

                            <label for="email">Email</label>
                            <input class="form-control" type="email" name="customerEmail" id="email" value="${listOrderId.customerEntity.email}" readonly="true"/>

                            <label for="address">Địa chỉ</label>
                            <input type="text" class="form-control" name="customerAddress" id="address" value="${listOrderId.customerEntity.address}" readonly="true"/>

                            <label for="phone">Số điện thoại</label>
                            <input type="tel" class="form-control" name="customerPhone" id="phone" value="${listOrderId.customerEntity.phone}" readonly="true"/>

                            <label>Order Date</label>
                            <input class="form-control" name="orderDate" cssClass="form-control"
                                   readonly="true" value="${listOrderId.orderDate}"/>


                        </div>

                        <div class="form-group">
                            <label for="intro">Ghi chú</label>
                            <textarea name="description" class="form-control" id="intro" cols="30"
                                      rows="5"></textarea>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-6">

                <div class="section" id="order-review-wp">
                    <div class="section-head">
                        <h3 class="section-title">Thông tin đơn hàng</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr class="cart_menu">
                                <td class="image col-sm-3">Item</td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listOrder}" var="item">
                                <tr>
                                    <td class="cart_product col-sm-1">
                                        <a href=""><img src="${item.imageProduct}" alt=""
                                                        width="50" height="50"></a>
                                        <h6>${item.nameProduct}</h6>
                                    </td>
                                    <td class="cart_price col-sm-2">
                                        <h6><fmt:formatNumber value="${item.priceProduct}" /> VNĐ</h6>
                                    </td>
                                    <td class="cart_price col-sm-3">
                                        <h6>${item.quantity}</h6>
                                    </td>
                                    <td class="cart_total col-sm-4">
                                        <h6><fmt:formatNumber value="${item.priceProduct*item.quantity}" /> VNĐ</h6>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="section-detail">
                        <table class="shop-table">
                            <thead>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <tr class="order-total">
                                <td>Tổng đơn hàng:${count}</td>

                            </tr>
                            <tr>
                                <td>Tổng tiền thanh toán : ${amount} VNĐ</td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-1"></div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>