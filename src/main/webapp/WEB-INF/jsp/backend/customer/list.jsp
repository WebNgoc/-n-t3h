<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>

<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_1.jsp"></jsp:include>
<div id="content" class="container-fluid">
    <div class="card">
        <div class="card-header font-weight-bold d-flex justify-content-between align-items-center">
            <h5 class="m-0 ">Danh sách thành viên</h5>
        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
<%--                        <a class="btn btn-success" href="/backend/product/create">Tạo mới</a>--%>
<%--                        <a class="btn btn-warning" href="/backend/product/list">Danh sách</a>   --%>
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
        <div class="card-body">
            <table class="table table-striped table-checkall">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" name="checkall">
                    </th>
                    <th scope="col">#</th>
                    <th scope="col">Họ tên</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Email</th>
                    <th scope="col">SĐT</th>
<%--                    <th scope="col">Giới tính</th>--%>
                    <th scope="col">Status</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Tác vụ</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.data}" var="customer">
                    <tr>
                        <td>
                            <input type="checkbox">
                        </td>
                        <th scope="row">${customer.id}</th>

                        <td>${customer.fullName}</td>
                        <td>${customer.address}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phone}</td>
<%--                        <td><c:if test="${customer.status == 1}">Nam</c:if><c:if--%>
<%--                                test="${customer.gender != 1}">Nữ</c:if></td>--%>
                        <td><c:if test="${customer.status == 0}">Tạm dừng</c:if><c:if
                                test="${customer.status == 1}">Kích hoạt</c:if></td>
                        <td>${customer.createdDate}</td>
                        <td>
                            <a href="/backend/customer/edit/${customer.id}"
                               class="btn btn-success btn-sm rounded-0 text-white"
                               type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i
                                    class="fa fa-edit"></i></a>
                            <a href="/backend/customer/delete/${customer.id}"
                               class="btn btn-danger btn-sm rounded-0 text-white"
                               type="button" data-toggle="tooltip" data-placement="top" title="Delete"><i
                                    class="fa fa-trash"></i></a>
                        </td>
                    </tr>
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