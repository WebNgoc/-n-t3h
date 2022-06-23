<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/jsp/client/common/header.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/client/common/menu.jsp"></jsp:include>

<section>
    <div class="container">
        <div class="row" >
            <div class="col-sm-3" >

            </div>
            <div class="col-sm-9" style="background-color: #f0edf6; ">
                <label class="btn ">Sản phẩm sắp xếp theo : </label>
                <a class="btn btn-default" href="/webshop/products/products_new">Mới nhất</a>
                <a class="btn btn-default" href="/webshop/products/products_order_desc">Bán chạy</a>
                <a class="btn btn-default">
                    <select class="form-select" style="background-color: white; " onchange="location = this.value;">
                        <option selected>Giá</option>
                        <option value="/webshop/products/products_price_asc">Giá : Tăng dần</option>
                        <option value="/webshop/products/products_price_desc">Giá : Giảm dần</option>
                    </select>
                </a>

            </div>
        </div>
        <div><br></div>
        <div class="row">
            <div class="col-sm-3">
                <jsp:include page="/WEB-INF/jsp/client/left-sidebar.jsp"></jsp:include>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                        <%--    <c:if test="${category == null}">--%>
                        <%--    <h2 class="title text-center"><spring:message code="title.Features_Items"/> </h2>--%>
                        <%--    </c:if>--%>
                        <%--    <c:if test="${category != null}">--%>
                    <h2 class="title text-center">Những sản phẩm mới nhất</h2>
                        <%--    </c:if>--%>
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
                                                    <span class="price_new"><fmt:formatNumber value="${pro.price}" /> đ</span>
                                                </div>

                                                <div class="action clearfix">
                                                    <a href="/cart/add/${pro.id}" class="btn btn-default add-to-cart"><i
                                                            class="fa fa-shopping-cart"></i>Add to cart</a>

                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <!--/recommended_items-->
                </div><!--features_items-->

            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/jsp/client/common/footer.jsp"></jsp:include>