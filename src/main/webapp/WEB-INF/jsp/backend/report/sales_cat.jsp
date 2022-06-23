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
            <h5 class="m-0 ">Thống kê hàng tồn kho theo danh mục</h5>

        </div>
        <div class="card-body">
            <div class="">
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-success" href="/backend/report/product">Thống kê theo sản phẩm</a>
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
                    <td class="col-sm-2">STT</td>
                    <td class="col-sm-2">Tên danh mục</td>
                    <td class="col-sm-2">Số lượng bán được</td>
                    <td class="col-sm-2">Doanh số</td>
                </tr>
                </thead>
                <tbody>
                <c:set value="1" var="stt"></c:set>
                <c:forEach items="${listInventory}" var="a">
                    <tr>
                        <td>
                            <h4>${stt}</h4>
                        </td>
                        <td>
                            <p>${a[0]}</p>
                        </td>
                        <td>
                            <h5 class="btn btn-success">${a[1]}</h5>
                        </td>
                        <td>
                            <h5 class="btn btn-primary">${a[2]}</h5>
                        </td>
                            <%--                        <td>--%>
                            <%--                                &lt;%&ndash;                            <a class="btn btn-success check_out" href="/backend/order/detail/${order.id}">Chi tiết</a>&ndash;%&gt;--%>
                            <%--                        </td>--%>
                    </tr>
                    <c:set var="stt" value="${stt + 1}"></c:set>
                </c:forEach>

                </tbody>
            </table>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>