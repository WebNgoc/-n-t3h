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
            Thêm người dùng
        </div>
        <div class="card-body">
            <form action="/backend/user/edit-form" method="post" modelAttribute="user">
                <input hidden name="id" value="${user.id}">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="name">Tên tài khoản</label>
                            <input class="form-control" type="text" name="userName">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="name">Họ và tên</label>
                            <input class="form-control" type="text" name="fullName" id="name" value="${user.fullName}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input class="form-control" type="password" name="passWord">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label>Email</label>
                            <input class="form-control" type="text" name="email" value="${user.email}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input class="form-control" type="text" name="phone" value="${user.phone}">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="">Chọn quyền</label>
                            <input class="form-control" type="text" name="role" value="${user.role}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="mb-3">
                            <label class="form-label">Giới tính</label>
                            <select name="gender" class="form-select" aria-label="Default select example">
                                <option
                                        <c:if test="${user.gender == 1}">selected</c:if> value="1">Nam
                                </option>
                                <option
                                        <c:if test="${user.gender != 1}">selected</c:if> value="2">Nữ
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="mb-3">
                            <label class="form-label">Trạng thái</label>
                            <select name="status" class="form-select" aria-label="Default select example">
                                <option
                                        <c:if test="${user.status == 0}">selected</c:if> value="0">Tạm dừng
                                </option>
                                <option
                                        <c:if test="${user.status == 1}">selected</c:if> value="1">Kích hoạt
                                </option>
                            </select>
                        </div>
                    </div>
                </div>


                <button type="submit" class="btn btn-primary">Thêm mới</button>
            </form>
        </div>
    </div>
</div>