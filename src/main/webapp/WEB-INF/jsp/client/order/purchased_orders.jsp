<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/jsp/client/common/header.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/client/common/menu.jsp"></jsp:include>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Orders</li>
            </ol>
        </div>
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu">
                        <td class="">STT</td>
                        <td class="col-sm-3">Địa chỉ</td>

                        <td class="col-sm-2">Tổng hoá đơn</td>
                        <td class="col-sm-2">Tổng số lượng</td>
                        <td class="col-sm-2">Ngày mua hàng</td>
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
                                <h4 class="btn btn-default">${order.customerEntity.address}</h4>
                            </td>

                            <td>
                                <h4 class="btn btn-success"><fm:formatNumber value="${order.amount}"/> đ</h4>
                            </td>
                            <td>
                                <h4 class="btn btn-danger">${order.quantity}</h4>
                            </td>
                            <td>
                                <h4 class="btn btn-info">${order.orderDate}</h4>
                            </td>
                            <td>
                                <a class="btn btn-default check_out" href="/order/orderDetail/${order.id}">Chi tiết</a>
                            </td>
                        </tr>
                        <c:set var="stt" value="${stt + 1}"></c:set>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

    </div>
</section> <!--/#cart_items-->
<%--<section id="do_action">--%>
<%--    <div class="container">--%>
<%--                <div class="total_area">--%>
<%--                    <ul>--%>
<%--                        <li>Cart Sub Total <span>${amount} VNĐ</span></li>--%>
<%--                        <li>Shipping Cost <span>Free</span></li>--%>
<%--                        <li>Total <span>$61</span></li>--%>
<%--                    </ul>--%>

<%--                </div>--%>
<%--</section><!--/#do_action-->--%>
<jsp:include page="/WEB-INF/jsp/client/common/footer.jsp"></jsp:include>