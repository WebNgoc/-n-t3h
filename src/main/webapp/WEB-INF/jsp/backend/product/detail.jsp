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
            Thêm sản phẩm
        </div>
        <div class="card-body">
            <form:form action="/backend/product/edit" method="post" modelAttribute="product">
                <span style="color: green">${message}</span>
                <input hidden name="id" value="${product.id}">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="name">Tên sản phẩm</label>
                            <form:input class="form-control" path="nameProduct" id="exampleFormControlInput1"
                                        value="${product.nameProduct}"/>
                            <form:errors path="nameProduct" cssClass="error"></form:errors>
                        </div>
                        <div class="form-group">
                            <label for="name">Giá</label>
                            <form:input class="form-control" path="price" value="${product.price}"/>
                            <form:errors path="price" cssClass="error"></form:errors>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="intro">Mô tả sản phẩm</label>
                            <form:textarea class="form-control" path="description" rows="3"></form:textarea>
                            <form:errors path="description" cssClass="error"></form:errors>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">Danh mục</label>
                    <select name="categoryId" class="form-select" aria-label="Default select example">
                        <c:forEach items="${category}" var="cat">
                            <option
                                    <c:if test="${product.categoryEntity.id == cat.id}">selected</c:if>
                                    value="${cat.id}">${cat.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="">Thương Hiệu</label>
                    <select name="brandId" class="form-select" aria-label="Default select example">
                        <c:forEach items="${brand}" var="brand">
                            <option
                                    <c:if test="${product.brandEntity.id == brand.id}">selected</c:if>
                                    value="${brand.id}">${brand.nameBrand}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="fileUploadId" class="form-label">Tải ảnh</label>
                            <input type="file" class="form-control" id="fileUploadId" aria-describedby="emailHelp">
                        </div>
                    </div>
                    <div class="col-6">
                        <img id="outputImage" width="100px"></img>
                        <div class="mb-3">
                            <input hidden type="text" name="image" class="form-control" id="fileUploadName">
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Sửa</button>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>
<script>
    $(document).ready(function () { // sẽ chay sau khi web tải xong html và css

        // $ <-> viết tắt Jquery
        // # lấy phần có id
        // . lấy phần tử class  $(".btn-primary")
        $("#fileUploadId").on("change", function (event) {

            var file = $(this)[0].files[0]; // lấy file
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('outputImage');
                output.src = reader.result;
            };
            reader.readAsDataURL(file);
            var formData = new FormData();

            // add assoc key values, this will be posts values
            formData.append("file", file, file.name);
            formData.append("upload_file", true);

            $.ajax({ // gọi api từ client (trình duyệt)
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/backend/product/upload",
                data: formData,
                processData: false, //prevent jQuery from automatically transforming the data into a query string
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $('#fileUploadName').val(data);
                    // alert("upload thành công")

                },
                error: function (e) {
                    // alert("upload thất bại")

                }
            });

        });

    });
</script>