<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/backend/common/hearder.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_1.jsp"></jsp:include>

<div class="container">
    <h2>DANH SACH Danh Mục</h2>
    <span class="alert-success">${message}</span>
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
        <c:forEach items="${listCat}" var="cat">
            <tr>
                <td>${cat.id}</td>
                <td>${cat.name}</td>
                <td>${cat.description}</td>

                <td><a class="btn btn-primary btn-sm" href="/backend/category/edit/${cat.id}">Edit</a> | |
                    <a class="btn btn-danger btn-sm" href="/backend/category/delete/${cat.id}">Del</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/jsp/backend/common/slidebar_2.jsp"></jsp:include>
