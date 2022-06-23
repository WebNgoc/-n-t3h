<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<form action="/webshop/search" method="get">
    <div class="left-sidebar">
        <h2><spring:message code="title.category"/></h2>
        <div class="panel-group category-products" id="accordian"><!--category-productsr-->
            <c:forEach items="${danhsachCategory}" var="cat">
                <div class="item">
                    <div class="pretty p-svg p-curve">
                        <input class="filter-checkbox" type="checkbox" name="idCat" value="${cat.id}"/>
                        <label class="checkbox-label" text="">
                            <a
                                    <c:if test="${category == null}">style="color: black"  </c:if>
                                    <c:if test="${category != null && cat.id == category.id}">style="color: red" </c:if>
                                    <c:if test="${category != null && cat.id != category.id}">style="color: black"  </c:if>
                                    href="/webshop/category/${cat.id}">${cat.name}
                            </a>
                        </label>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="brand content">
            <div class="title" data-toggle="collapse" href="#brand-collapse" role="button" aria-expanded="false"
                 aria-controls="brand-collapse">
                <h2 class="text-center">Thương hiệu</h2>
            </div>
            <div class="select-filter collapse show" id="brand-collapse">
                <c:forEach items="${listBrand}" var="brandList">
                    <div class="item">
                        <div class="pretty p-svg p-curve">
                            <input class="filter-checkbox check-brand" type="checkbox" name="idBrand"
                                   value="${brandList.id}"/>
                            <label class="checkbox-label" text="">
                                <a
                                <c:if test="${brand == null}">style="color: black"  </c:if>
                                <c:if test="${brand != null && brandList.id == brand.id}">style="color: red" </c:if>
                                <c:if test="${brand != null && brandList.id != brand.id}">style="color: black"  </c:if>
                                href="/webshop/brand/${brandList.id}" name="">${brandList.nameBrand}
                                </a>
                            </label>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="price-range"><!--price-range-->
            <h2>Price Range</h2>

            <div class="well text-center row">
                <div class="col-sm-4">
                    <input type="number" name="minPrice"  min="1" style="width: 90px;height: 30px"
                           placeholder="đ Từ"/>
                </div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="number" name="maxPrice"  min="1" style="width: 90px;height: 30px"
                           placeholder="đ Đến"/>
                </div>
                <%--                <button type="submit" class="btn btn-primary">Áp dụng</button>--%>
            </div>

        </div><!--/price-range-->
    </div>
    <button class="btn btn-warning center-block" type="submit">Bộ lọc tìm kiếm</button>

</form>