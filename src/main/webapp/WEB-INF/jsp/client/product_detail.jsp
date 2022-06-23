<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/jsp/client/common/header.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/client/common/menu.jsp"></jsp:include>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2><spring:message code="title.category"/></h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <c:forEach items="${danhsachCategory}" var="cat">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a
                                            <c:if test="${category != null && cat.id == category.id}">style="color: red" </c:if>
                                            href="/category/${cat.id}">${cat.name}</a></h4>
                                </div>
                            </div>
                        </c:forEach>

                    </div><!--/category-products-->

                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="product-details"><!--product-details-->
                    <div class="col-sm-5">
                        <div class="view-product">
                            <img src="${product.image}" alt=""/>
                        </div>
                        <div id="similar-product" class="carousel slide" data-ride="carousel">

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <a href=""><img src="${product.image}" alt="" width="80" height="70"></a>
                                    <a href=""><img src="${product.image}" alt="" width="80" height="70"></a>
                                    <a href=""><img src="${product.image}" alt="" width="80" height="70"></a>
                                </div>
                                <div class="item">
                                    <a href=""><img src="${product.image}" alt="" width="80" height="70"></a>
                                    <a href=""><img src="${product.image}" alt="" width="80" height="70"></a>
                                    <a href=""><img src="${product.image}" alt="" width="80" height="70"></a>
                                </div>
                            </div>

                            <!-- Controls -->
                            <a class="left item-control" href="#similar-product" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right item-control" href="#similar-product" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-7">
                        <div class=""><!--/product-information-->
                            <div>
                                <h3>${product.nameProduct}</h3>
                                <span class="price_new" style="font-size: 30px">
                                   <fmt:formatNumber value="${product.price}"/> đ
                                </span>
                            </div>
                            <div>
                                <h4>Kích thước : </h4>
                                <c:forEach items="${product.size}" var="size">

                                    <button class="btn-warning">${size.nameSize}</button>

                                </c:forEach>
                            </div>
                            <br>
                            <span>

									<label>Số lượng: ${product.quantity}</label>
									<input type="number" value="1" min="1" max="${product.quantity}"/>
                                <a href="/cart/add/${pro.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </a>
                            </span>


                            <p><b>Tình trạng:</b><c:if test="${product.quantity > 0}"> Còn hàng</c:if><c:if
                                    test="${product.quantity <= 0}">Cháy hàng</c:if></p>
                            <p><b>Trạng thái:</b> mới</p>
                            <p><b>Thương hiệu:</b> E-SHOPPER</p>
                            <a href=""><img src="<%--/image-product/${product.image}--%>" class="share img-responsive"
                                            alt=""/></a>
                        </div><!--/product-information-->
                    </div>
                </div><!--/product-details-->

                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Sản phẩm liên quan</h2>
                    <div class="main-content fl-right">
                        <div class="section" id="feature-product-wp">
                            <div class="section-detail">
                                <ul class="list-item">
                                    <c:forEach items="${category.listProduct}" var="pro">
                                        <li>
                                            <a href="/webshop/product/${pro.id}" title="" class="thumb">
                                                <img src="${pro.image}" width="90%" height="100%"/>
                                            </a>
                                            <div class="overlay-content text-center">

                                                <div class="text1">
                                                    <p class="product-name">${pro.nameProduct}</p>
                                                        <%--                                <span class="new">${pro.price}đ</span>--%>
                                                    <span class="price_new"><fmt:formatNumber
                                                            value="${pro.price}"/> đ</span>
                                                </div>

                                                <div class="action clearfix">
                                                    <button class="btn btn-success">
                                                        <a class="glyphicon glyphicon-shopping-cart"
                                                           href="/cart/add/${pro.id}"></a>
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" data-favorite="${pro.id}">
                                                        <span class="glyphicon glyphicon-heart"></span>
                                                    </button>
                                                    <button class="btn btn-info btn-sm" data-send="${pro.id}">
                                                        <span class="glyphicon glyphicon-envelope"></span>
                                                    </button>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<jsp:include page="/WEB-INF/jsp/client/common/footer.jsp"></jsp:include>