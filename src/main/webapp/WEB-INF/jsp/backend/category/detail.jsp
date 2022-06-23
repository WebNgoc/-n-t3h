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
        <div class="col-sm-12">

            <h2>Chỉnh sửa danh muc sản phẩm </h2>
            <form action="/backend/category/edit" method="post">
                <input hidden name="id" value="${editCat.id}">
                <span style="color: green">${message}</span>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Tên danh muc</label>
                    <input class="form-control" name="nameCategory" id="exampleFormControlInput1"
                           value="${editCat.name}">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Mô tả thương hiệu</label>
                    <textarea class="form-control" name="description" id="exampleFormControlTextarea1"
                              rows="3">${editCat.description}</textarea>
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
                <button type="reset" class="btn btn-primary">Cancel</button>
                <a class="btn btn-primary" href="/backend/category/list">Display List category</a>
            </form>
        </div>
    </div>
</div>
</body>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>
</html>

