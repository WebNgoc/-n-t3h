<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="features_items"><!--features_items-->
    <c:if test="${category == null && brand == null}">
    <h2 class="title text-center">Sản phẩm mới nhất </h2>
    </c:if>
    <c:if test="${category != null}">
    <h2 class="title text-center"></h2>
    </c:if>
    <div class="main-content fl-right">
        <div class="section" id="feature-product-wp">
            <div class="section-detail">
                <ul class="list-item">
                    <c:forEach items="${listFeaturesItemNew}" var="pro">
                        <li>
                            <a href="/webshop/product/${pro.id}" title="" class="thumb">
                                <img src="${pro.image}" width="90%" height="100%"/>
                            </a>
                            <div class="overlay-content text-center">

                                <div class="text1">
                                    <p class="product-name">${pro.nameProduct}</p>
                                        <%--                                <span class="new">${pro.price}đ</span>--%>
                                    <span class="price_new">
                                            <fm:formatNumber value="${pro.price}"/> đ</span>
                                </div>

                                <div class="action clearfix">
                                    <a href="/cart/add/${pro.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>


    <!--/recommended_items-->
