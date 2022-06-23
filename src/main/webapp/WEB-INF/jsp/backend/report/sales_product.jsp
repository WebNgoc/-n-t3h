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
            <h5 class="m-0 ">Thống kê hàng tồn kho theo sản phẩm</h5>

        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-success" href="/backend/report/product">Thống kê theo danh mục</a>
                        <label>Tháng</label>

                    </div>
                    <div class="col-sm-4">
                        <form action="/backend/report/product" method="post">
                            <input id="startTime" type="text" name="date" >
                            <script>
                                $('#startTime').datepicker({
                                    format: 'yyyy-mm-dd',
                                    autoclose: true
                                })
                            </script>
                            <button class="btn" type="submit" href=""> <i class="fa fa-calendar"></i></button>
                        </form>
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
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="col-sm-1">STT</td>
                    <td class="col-sm-2">Ảnh</td>
                    <td class="col-sm-3">Tên sản phẩm</td>
                    <td class="col-sm-2">Đơn giá</td>
                    <td class="col-sm-1">Số lượng nhập</td>
                    <td class="col-sm-1">Số lượng tồn kho</td>
                    <td class="col-sm-2">Ngày tạo</td>
                </tr>
                </thead>
                <tbody>
                <c:set value="1" var="stt"></c:set>
                <c:forEach items="${listSale}" var="a">
                    <tr>
                        <td>
                            <h4>${stt}</h4>
                        </td>

                        <td width="100"><img alt="" src="${a[7]}" width="80" height="70"></td>

                        <td hidden>
                            <h4>${a[0]}</h4>
                        </td>
                        <td hidden>
                            <p>${a[1]}</p>
                        </td>
                        <td hidden>
                            <h5>${a[2]}</h5>
                        </td>
                        <td>
                            <p>${a[3]}</p>
                        </td>
                        <td>
                            <p class="btn btn-danger">${a[4]} đ</p>
                        </td>
                        <td>
                            <p class="btn btn-warning">${a[5]}</p>
                        </td>
                        <td>
                            <p class="btn btn-success">${a[13]}</p>
                        </td>
                        <td>
                            <p class="btn btn-primary">${a[10]}</p>
                        </td>
                        <td>
                                <%--                            <a class="btn btn-success check_out" href="/backend/order/detail/${order.id}">Chi tiết</a>--%>
                        </td>
                    </tr>
                    <c:set var="stt" value="${stt + 1}"></c:set>
                </c:forEach>

                </tbody>
            </table>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>