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
            <h5 class="m-0 ">Sản phẩm : ${product.nameProduct}</h5>

        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-success" href="/backend/product/add/${product.id}">Thêm size</a>
                        <a class="btn btn-warning" href="/backend/product/list">Danh sách sản phẩm</a>

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
    <h5>DANH SACH KÍCH THƯỚC</h5>
    <span class="alert-success">${message}</span>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>STT</th>
            <th>Size</th>
            <th>Option</th>
        </tr>
        </thead>
        <tbody>
        <c:set value="1" var="stt"></c:set>
        <c:forEach items="${product.size}" var="size">
            <tr>
                <td>${stt}</td>

                <td>${size.nameSize}</td>

                <td>
                    <a class="btn btn-danger btn-sm" href="/backend/size/delete/${size.id}">Del</a></td>
            </tr>
            <c:set value="${stt+1}" var="stt"></c:set>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>
