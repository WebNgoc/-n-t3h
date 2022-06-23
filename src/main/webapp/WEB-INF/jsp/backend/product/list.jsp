<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_1.jsp"></jsp:include>
<div id="content" class="container-fluid">
    <div class="card">
        <div class="card-header font-weight-bold d-flex justify-content-between align-items-center">
            <h5 class="m-0 ">Sản phẩm</h5>

        </div>
        <div class="card-body">
            <div class="">
                        <div class="row">
                            <div class="col-sm-4">
                                <a class="btn btn-success" href="/backend/product/create">Tạo mới</a>
                                <a class="btn btn-warning" href="/backend/product/list">Danh sách</a>
                            </div>
                            <div class="col-sm-4">
                            </div>
                            <div class="col-sm-4">
                                    <form action="#">
                                        <div class="row">
                                            <input type="" class="form-control form-search" placeholder="Tìm kiếm">
                                            <input type="submit" name="btn-search" value="Tìm kiếm" class="btn btn-primary">
                                        </div>

                                    </form>
                                </div>
                        </div>
                </div>
            </div>
            <table class="table table-striped table-checkall">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Brand</th>
                    <th>Size</th>
                    <th>Option</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.data}" var="product">

                    <tr>
                        <td>${product.id}</td>
                        <td width="100"><img alt="" src="${product.image}" width="80" height="70"></td>

                        <td>${product.nameProduct}</td>
                        <td>${product.price}</td>
                        <td>${product.quantity}</td>
                        <td>${product.description}</td>
                        <td>${product.categoryEntity.name}</td>
                        <td>${product.brandEntity.nameBrand}</td>
                        <td>
                        <a class="btn btn-success" href="/backend/product/size/${product.id}">Size</a>
                        </td>
                        <td>
                            <a href="/backend/product/edit/${product.id}"
                               class="btn btn-success btn-sm rounded-0 text-white" type="button" data-toggle="tooltip"
                               data-placement="top" title="Edit"><i class="fa fa-edit"></i></a>
                            <a href="/backend/product/delete/${product.id}"
                               class="btn btn-danger btn-sm rounded-0 text-white" type="button" data-toggle="tooltip"
                               data-placement="top" title="Delete"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <%--        </c:forEach>--%>
                </c:forEach>
                </tbody>
            </table>
            <div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item <c:if test="${list.page==1}">disabled</c:if>">
                            <a class="page-link"
                               href="/backend/${path}/list?page=${list.page - 1}&perpage=${listProduct.perpage}">Trước</a>
                        </li>
                        <c:forEach begin="${list.begin}" step="1" end="${list.numberPage}" var="num">
                            <c:if test="${num > 0 && num <= list.numberPage}">
                                <li class="page-item  <c:if test="${list.page==num}"> active </c:if>">
                                    <a class="page-link "
                                       href="/backend/${path}/list?page=${num}&perpage=${list.perpage}">${num}
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <li class="page-item <c:if test="${list.page==list.numberPage}">disabled</c:if>">
                            <a class="page-link"
                               href="/backend/${path}/list?page=${list.page + 1}&perpage=${list.perpage}">Sau</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>
<script>
    $(document).ready(function () {// sẽ chay sau khi web tải xong html và css

        // $ <-> viết tắt Jquery
        // # lấy phần có id
        // . lấy phần tử class  $(".btn-primary")
        $("#fileUploadId").on("change", function (event) {

            var file = $(this)[0].files[0];// lấy file
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

            $.ajax({// gọi api từ client (trình duyệt)
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
                    alert("upload thành công")

                },
                error: function (e) {
                    alert("upload thất bại")

                }
            });

        });

    });

</script>



