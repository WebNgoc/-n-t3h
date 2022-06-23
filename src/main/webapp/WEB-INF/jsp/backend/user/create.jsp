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
            <form action="/backend/user/create-form" method="post" modelAttribute="user">
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
                            <input class="form-control" type="text" name="fullName" id="name">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="email">Mật khẩu</label>
                            <input class="form-control" type="text" name="passWord">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input class="form-control" type="text" name="email" id="email">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="email">Số điện thoại</label>
                            <input class="form-control" type="text" name="phone">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="">Chọn quyền</label>
                            <input class="form-control" type="text" name="role">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Gender</label>
                            <div class="radio">
                                <!--value = 1 => Nam| 0 =>Nu -->
                                <label class="checkbox-inline">
                                    <input type="radio" name="gender" value="1" id="gender1">Nam</label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="gender" checked="checked" value="0"
                                           id="gender2">Nữ</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label>Status</label>
                            <div class="radio">

                                <label class="checkbox-inline">
                                    <input type="radio" name="status" value="1" id="">Kích Hoạt</label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="status" checked="checked" value="0" id="">Tạm Dừng</label>
                            </div>
                        </div>
                    </div>
                </div>


                <button type="submit" class="btn btn-primary">Thêm mới</button>
            </form>
        </div>
    </div>
</div>