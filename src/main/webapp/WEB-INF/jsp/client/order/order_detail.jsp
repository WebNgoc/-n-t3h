<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

        <div id="wrapper" class="wp-inner clearfix">

                        <div class="section" id="order-review-wp">
                            <div class="section-head">
                                <h1 class="section-title">Thông tin chi tiết đơn hàng</h1>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-dark">
                                    <thead>
                                    <tr class="cart_menu">
                                        <td class="image"></td>
                                        <td class="image">Tên sản phẩm</td>
                                        <td class="price">Giá</td>
                                        <td class="quantity">Số lượng đã mua</td>
                                        <td class="total">Tổng tiền</td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listOrder}" var="item">
                                        <tr>
                                            <td class="cart_product col-sm-1">
                                                <a href=""><img src="${item.imageProduct}" alt=""
                                                                width="50" height="50"></a>

                                            </td>
                                            <td class="cart_price col-sm-2">
                                                <h5>${item.nameProduct}</h5>
                                            </td>
                                            <td class="cart_price col-sm-2">
                                                <h4 class="btn btn-success"><fm:formatNumber value="${item.priceProduct}" /> đ</h4>
                                            </td>
                                            <td class="cart_price col-sm-3">
                                                <h4 class="btn btn-danger">${item.quantity}</h4>
                                            </td>
                                            <td class="cart_total col-sm-4">
                                                <h4 class="btn btn-info"><fm:formatNumber value="${item.priceProduct*item.quantity}" /> đ</h4>
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
                                        <td>Tổng tiền thanh toán : ${amount} VNĐ</td>
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
                            </div>
                        </div>
                    </div>
                </div>

        </div>
    </div>
    </div>
</section><!--/#cart_items-->

<jsp:include page="/WEB-INF/jsp/client/common/footer.jsp"></jsp:include>