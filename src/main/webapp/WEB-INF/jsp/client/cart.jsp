<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/client/common/header.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/client/common/menu.jsp"></jsp:include>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>
        <div class="alert alert-warning"><c:if test="${count==0}">Chưa có sản phẩm nào trong giỏ hàng!</c:if></div>
        <c:if test="${count!=0}">
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu">
                        <td class="col-sm-2"></td>
                        <td class="col-sm-2">Sản phẩm</td>
                        <td class="col-sm-2">Đơn giá</td>
                        <td class="col-sm-2">Số lượng</td>
                        <td class="col-sm-2">Thành tiền</td>
                        <td class="col-sm-2"></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${items}" var="cart">
                        <tr>
                            <td class="cart_product">
                                <a href="/webshop/product/${cart.productId}"><img
                                        src="${cart.imageProduct}" alt="" width="100" height="100"></a>
                            </td>
                            <td class="cart_description">
                                <p><a href="/webshop/product/${cart.productId}"
                                      style="color: black;font-size: 15px;">${cart.nameProduct}</a></p>
                            </td>
                            <td class="cart_price">
                                <p style="color: black;font-size: 15px;">${cart.priceProduct} VNĐ</p>
                            </td>
                            <td class="cart_quantity">
                                <form method="post" action="/cart/update/${cart.productId}" >
                                <input type="number" name="quantity" value="${cart.quantity}" min="1" max=""
                                       style="width: 60px; height: 40px"/>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                    </form>

                             </td>
                        <td class="cart_total">
                            <p style="color: black;font-size: 15px;">${cart.priceProduct*cart.quantity} VNĐ</p>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete" href="/cart/delete/${cart.productId}">
                                <i class="fa fa-times"></i></a>
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tr>
                        <td>
                            <a class="btn btn-default update" href="/cart/update/${cart.productId}">Update</a>
                        </td>
                        <td>
                            <a class="btn btn-default check_out" href="/order/checkout">Check Out</a>

                        </td>
                        <td>
                            <a class="btn btn-default check_out" href="/cart/delete">Clear</a>

                        </td>
                        <td>
                            <h4>Tổng sản phẩm : ${count}</h4>
                        </td>
                        <td>
                            <h4>Tổng tiền : ${amount}</h4>
                        </td>
                        <td>

                        </td>


                    </tr>
                </table>

            </div>
        </c:if>
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