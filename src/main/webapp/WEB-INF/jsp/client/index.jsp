<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/jsp/client/common/header.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/client/common/menu.jsp"></jsp:include>

<jsp:include page="/WEB-INF/jsp/client/common/slider.jsp"></jsp:include>

<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <jsp:include page="/WEB-INF/jsp/client/left-sidebar.jsp"></jsp:include>
            </div>
            <div class="col-sm-9 padding-right">
                <c:if test="${listPrice == null && search == null && filter == null}">
                <jsp:include page="/WEB-INF/jsp/client/features_item.jsp"></jsp:include>
                </c:if>
                <c:if test="${listPrice != null}">
                <jsp:include page="/WEB-INF/jsp/client/search.jsp"></jsp:include>
                </c:if>
                <c:if test="${search != null}">
                    <jsp:include page="/WEB-INF/jsp/client/searchKeyWord.jsp"></jsp:include>
                </c:if>
                <c:if test="${filter != null}">
                    <jsp:include page="/WEB-INF/jsp/client/searchFilter.jsp"></jsp:include>
                </c:if>
            </div><!--features_items-->
            <c:if test="${listPrice == null && search == null && filter == null}">
            <div class="col-sm-12 padding-right">
                <jsp:include page="/WEB-INF/jsp/client/category-tab.jsp"></jsp:include>
            </div><!--/category-tab-->
            </c:if>
<%--            <div class="recommended_items"><!--recommended_items-->--%>
<%--                <h2 class="title text-center">recommended items</h2>--%>

<%--                <jsp:include page="/WEB-INF/jsp/client/recomened_items.jsp"></jsp:include>--%>
<%--            </div><!--/recommended_items-->--%>

        </div>
    </div>
    </div>
</section>
<jsp:include page="/WEB-INF/jsp/client/common/footer.jsp"></jsp:include>
