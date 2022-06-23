<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a style="color: #d37e2e" href="index.jsp"><img src="" alt=""/>
                            <h3 style="text-shadow: 2px 2px 5px #cdc39d;">ShopBuiNgoc</h3></a>
                    </div>
                    <div class="btn-group pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                <spring:message code="menu.Language"/>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">

                                <li><a href="?lang=en">EN</a></li>
                                <li><a href="?lang=vn">VN</a></li>
                            </ul>
                        </div>


                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-user"><span> ${name}</span></i> </a></li>

                            <li><a href="/cart"><i class="fa fa-shopping-cart">
                                -<span>${count}</span></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="/webshop" class="active"><spring:message code="menu.Home"/> </a></li>
                            <li><a href="/webshop/products"><spring:message code="menu.Product"/> </a></li>
                            <li class="dropdown"><a href="#"><spring:message code="menu.Account"/><i
                                    class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.customer}">
                                            <li><a href="/account/login"><spring:message code="menu.Login"/></a></li>
                                            <li><a href="/accountfogot"><spring:message
                                                    code="menu.Forgot_Password"/></a></li>
                                            <li><a href="/account/register"><spring:message code="menu.Register"/> </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="/account/logout"><spring:message code="menu.Logout"/> </a></li>
                                            <li><a href="/account/change"><spring:message
                                                    code="menu.Change_Password"/> </a></li>
                                            <li><a href="/account/edit"><spring:message
                                                    code="menu.Edit_Information_Account"/> </a></li>
                                            <li class="divider"></li>
                                            <li><a href="/order/checkout"><spring:message code="menu.Order"/> </a></li>
                                            <li><a href="/order/orders"><spring:message
                                                    code="menu.Purchased_orders"/> </a></li>
                                        </c:otherwise>
                                    </c:choose>


                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">

                        <form method="post" action="/webshop/key">
                            <div class="row">
                                <input class="col-sm-9" name="txt" type="text" placeholder="Search"/>
                                <button  type="submit" class="col-sm-3 alert-success"><i class="fa fa-search"></i></button>
                            </div>
                        </form>

                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>
<!--/header-->
