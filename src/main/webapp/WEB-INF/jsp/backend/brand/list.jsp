<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>

<div class="container">
    <h2>DANH SACH BRAND</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Option</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listBrand}" var="brand">
            <tr>
                <td>${brand.id}</td>
                <td>${brand.nameBrand}</td>
                <td>${brand.description}</td>

                <td><a class="btn btn-primary btn-sm" href="/backend/brand/edit/${brand.id}">Edit</a> | |
                    <a class="btn btn-danger btn-sm" href="/delete/${brand.id}">Del</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
