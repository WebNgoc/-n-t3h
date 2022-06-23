<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_1.jsp"></jsp:include>
<div id="content" class="container-fluid">
    <div class="card">
        <div class="card-header font-weight-bold">
            Thêm size cho sản phẩm
        </div>
        <div class="card-body">
            <form action="/backend/product/add/${product.id}" method="post" >
                <span style="color: green">${message}</span>
                <div class="form-group">
                    <label for="">Kích thước</label>
                        <%--                    <select name="sizeId" class="form-control">--%>
                        <%--                        <option>Chọn kích thước</option>--%>
                        <%--                        <c:forEach items="${listSize}" var="size">--%>
                        <%--                            <option value="${size.id}">${size.nameSize}</option>--%>
                        <%--                        </c:forEach>--%>
                        <%--                    </select>--%>
                    <div class="select-filter collapse show" id="brand-collapse">
                        <c:forEach items="${listSize}" var="size">
                            <div class="item">
                                <div class="pretty p-svg p-curve">
                                    <input class="filter-checkbox check-brand" type="checkbox" name="idSize"
                                           value="${size.id}"/>
                                    <label class="checkbox-label" >${size.nameSize}
                                    </label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Thêm mới</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>


