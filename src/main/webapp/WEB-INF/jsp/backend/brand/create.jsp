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

            <h2>Tạo thương hiệu mới</h2>
            <form action="/backend/brand/create" method="post">
                <span style="color: green">${message}</span>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Tên thương hiệu</label>
                    <input class="form-control" name="nameBrand" id="exampleFormControlInput1"
                           placeholder="Nhập tên">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Mô tả thương hiệu</label>
                    <textarea class="form-control" name="description" id="exampleFormControlTextarea1"
                              rows="3"></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
                <button type="reset" class="btn btn-primary">Cancel</button>
                <a class="btn btn-primary" href="/backend/brand/list">Display List brand</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>

