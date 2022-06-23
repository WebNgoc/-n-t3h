<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/jsp/client/common/header.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/client/common/menu.jsp"></jsp:include>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb alert alert-success">
                <li><a href="#">Home</a></li>
                <li class="active">Check out</li>
            </ol>
        </div><!--/breadcrums-->
        <span class="alert-success">${message}</span>
        <div id="wrapper" class="wp-inner clearfix">
            <form method="POST" action="/order/purchase">
                <div class="row">
                    <div class="col-sm-5 alert alert-warning">
                        <div class="section" id="customer-info-wp">
                            <div class="section-head">
                                <h1 class="section-title">Thông tin khách hàng</h1>
                            </div>
                            <div class="section-detail">

<%--                                                                <input hidden name="${InfoCustomer.id}">--%>
                                <div class="form-group">
                                    <label>Họ tên</label>
                                    <input class="form-control" name="fullName" value="${InfoCustomer.fullName}"/>

                                    <label for="email">Email</label>
                                    <input class="form-control" type="email" name="customerEmail" id="email" value="${InfoCustomer.email}"/>

                                    <label for="address">Địa chỉ</label>
                                    <input type="text" class="form-control" name="customerAddress" id="address" value="${InfoCustomer.address}"/>

                                    <label for="phone">Số điện thoại</label>
                                    <input type="tel" class="form-control" name="customerPhone" id="phone" value="${InfoCustomer.phone}"/>

                                    <label>Order Date</label>
                                    <input class="form-control" name="orderDate" cssClass="form-control"
                                           readonly="true" value="${order}"/>


                                </div>

                                <div class="form-group">
                                    <label for="intro">Ghi chú</label>
                                    <textarea name="description" class="form-control" id="intro" cols="30"
                                              rows="5"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-6 alert alert-warning">

                        <div class="section" id="order-review-wp">
                            <div class="section-head">
                                <h1 class="section-title">Thông tin đơn hàng</h1>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-dark">
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
                                    <c:forEach items="${listItem}" var="item">
                                        <tr>
                                            <td class="cart_product col-sm-1">
                                                <a href=""><img src="${item.imageProduct}" alt=""
                                                                width="50" height="50"></a>
                                                <h6>${item.nameProduct}</h6>
                                            </td>
                                            <td class="cart_price col-sm-2">
                                                <h6>${item.priceProduct} VNĐ</h6>
                                            </td>
                                            <td class="cart_price col-sm-3">
                                                <h6>${item.quantity}</h6>
                                            </td>
                                            <td class="cart_total col-sm-4">
                                                <h6>${item.priceProduct*item.quantity} VNĐ</h6>
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
                                        <td>Tổng đơn hàng: ${count}</td>

                                    </tr>
                                    <tr>
                                        <td>Tổng tiền thanh toán : <fmt:formatNumber value="${amount}"/>  VNĐ</td>
                                    </tr>
                                    </tfoot>
                                </table>
<%--                                <div id="payment-checkout-wp">--%>
<%--                                    <ul id="payment_methods">--%>
<%--                                        <li>--%>
<%--                                            <input type="radio" id="direct-payment" name="payment-method"--%>
<%--                                                   value="direct-payment">--%>
<%--                                            <label for="direct-payment">Thanh toán tại cửa hàng</label>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <input type="radio" id="payment-home" name="payment-method"--%>
<%--                                                   value="payment-home">--%>
<%--                                            <label for="payment-home">Thanh toán tại nhà</label>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
                                <div class="place-order-wp clearfix">
                                    <input type="submit" id="order-now" value="Đặt hàng">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
</section><!--/#cart_items-->

<jsp:include page="/WEB-INF/jsp/client/common/footer.jsp"></jsp:include>