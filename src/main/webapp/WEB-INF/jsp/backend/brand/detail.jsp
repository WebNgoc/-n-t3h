<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>

<div class="container" style="margin-top: 10px;">
    <div class="row"
         style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
        <div class="col-sm-12">

            <h2>Sửa thương hiệu </h2>
            <form action="/backend/brand/edit" method="post">
                <span style="color: green">${message}</span>
                <c:forEach items="${listBrandById}" var="brand">
                    <input name="id" value="${brand.id}" hidden>
                    <div class="mb-3">
                        <label class="form-label">Tên thương hiệu</label>
                        <input class="form-control" name="nameBrand" value="${brand.nameBrand}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mô tả thương hiệu</label>
                        <textarea class="form-control" name="description"
                                  rows="3">${brand.description}</textarea>
                    </div>
                </c:forEach>
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="reset" class="btn btn-primary">Cancel</button>
                <a class="btn btn-primary" href="/backend/brand/list">Display List brand</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>

