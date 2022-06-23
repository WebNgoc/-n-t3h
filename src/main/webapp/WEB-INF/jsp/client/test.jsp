<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ISMART STORE</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/public/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/reset.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/css/carousel/owl.carousel.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/css/carousel/owl.theme.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/style.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/public/responsive.css" rel="stylesheet" type="text/css"/>

    <script src="/resources/public/js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="/resources/public/js/elevatezoom-master/jquery.elevatezoom.js" type="text/javascript"></script>
    <script src="/resources/public/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="/resources/public/js/carousel/owl.carousel.js" type="text/javascript"></script>
    <script src="/resources/public/js/main.js" type="text/javascript"></script>
</head>
<body>
<div id="site">
    <div id="container">
        <div  class="checkout-page">
            <div class="section" id="breadcrumb-wp">
                <div class="wp-inner">
                    <div class="section-detail">
                        <ul class="list-item clearfix">
                            <li>
                                <a href="?page=home" title="">Trang chủ</a>
                            </li>
                            <li>
                                <a href="" title="">Thanh toán</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="wrapper" class="wp-inner clearfix">
                <div class="section" id="customer-info-wp">
                    <div class="section-head">
                        <h1 class="section-title">Thông tin khách hàng</h1>
                    </div>
                    <div class="section-detail">
                        <form method="POST" action="" name="form-checkout">
                            <div class="form-row clearfix">
                                <div class="form-col fl-left">
                                    <label for="fullname">Họ tên</label>
                                    <input type="text" name="fullname" id="fullname">
                                </div>
                                <div class="form-col fl-right">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" id="email">
                                </div>
                            </div>
                            <div class="form-row clearfix">
                                <div class="form-col fl-left">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" name="address" id="address">
                                </div>
                                <div class="form-col fl-right">
                                    <label for="phone">Số điện thoại</label>
                                    <input type="tel" name="phone" id="phone">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-col">
                                    <label for="notes">Ghi chú</label>
                                    <textarea name="note"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="section" id="order-review-wp">
                    <div class="section-head">
                        <h1 class="section-title">Thông tin đơn hàng</h1>
                    </div>
                    <div class="section-detail">
                        <table class="shop-table">
                            <thead>
                            <tr>
                                <td>Sản phẩm</td>
                                <td>Tổng</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="cart-item">
                                <td class="product-name">Son môi nữ cá tính<strong class="product-quantity">x 1</strong></td>
                                <td class="product-total">350.000đ</td>
                            </tr>
                            <tr class="cart-item">
                                <td class="product-name">Đồ tẩy trang nhập khẩu Mỹ<strong class="product-quantity">x 2</strong></td>
                                <td class="product-total">500.000đ</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr class="order-total">
                                <td>Tổng đơn hàng:</td>
                                <td><strong class="total-price">800.000đ</strong></td>
                            </tr>
                            </tfoot>
                        </table>
                        <div id="payment-checkout-wp">
                            <ul id="payment_methods">
                                <li>
                                    <input type="radio" id="direct-payment" name="payment-method" value="direct-payment">
                                    <label for="direct-payment">Thanh toán tại cửa hàng</label>
                                </li>
                                <li>
                                    <input type="radio" id="payment-home" name="payment-method" value="payment-home">
                                    <label for="payment-home">Thanh toán tại nhà</label>
                                </li>
                            </ul>
                        </div>
                        <div class="place-order-wp clearfix">
                            <input type="submit" id="order-now" value="Đặt hàng">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer-wp">
            <div id="foot-body">
                <div class="wp-inner clearfix">
                    <div class="block" id="info-company">
                        <h3 class="title">ISMART</h3>
                        <p class="desc">ISMART luôn cung cấp luôn là sản phẩm chính hãng có thông tin rõ ràng, chính
                            sách ưu đãi cực lớn cho khách hàng có thẻ thành viên.</p>
                        <div id="payment">
                            <div class="thumb">
                                <img src="/resources/public/images/img-foot.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="block menu-ft" id="info-shop">
                        <h3 class="title">Thông tin cửa hàng</h3>
                        <ul class="list-item">
                            <li>
                                <p>106 - Trần Bình - Cầu Giấy - Hà Nội</p>
                            </li>
                            <li>
                                <p>0987.654.321 - 0989.989.989</p>
                            </li>
                            <li>
                                <p>vshop@gmail.com</p>
                            </li>
                        </ul>
                    </div>
                    <div class="block menu-ft policy" id="info-shop">
                        <h3 class="title">Chính sách mua hàng</h3>
                        <ul class="list-item">
                            <li>
                                <a href="" title="">Quy định - chính sách</a>
                            </li>
                            <li>
                                <a href="" title="">Chính sách bảo hành - đổi trả</a>
                            </li>
                            <li>
                                <a href="" title="">Chính sách hội viện</a>
                            </li>
                            <li>
                                <a href="" title="">Giao hàng - lắp đặt</a>
                            </li>
                        </ul>
                    </div>
                    <div class="block" id="newfeed">
                        <h3 class="title">Bảng tin</h3>
                        <p class="desc">Đăng ký với chung tôi để nhận được thông tin ưu đãi sớm nhất</p>
                        <div id="form-reg">
                            <form method="POST" action="">
                                <input type="email" name="email" id="email" placeholder="Nhập email tại đây">
                                <button type="submit" id="sm-reg">Đăng ký</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="foot-bot">
                <div class="wp-inner">
                    <p id="copyright">© Bản quyền thuộc về unitop.vn | Php Master</p>
                </div>
            </div>
        </div>
    </div>
    <div id="menu-respon">
        <a href="?page=home" title="" class="logo">VSHOP</a>
        <div id="menu-respon-wp">
            <ul class="" id="main-menu-respon">
                <li>
                    <a href="?page=home" title>Trang chủ</a>
                </li>
                <li>
                    <a href="?page=category_product" title>Điện thoại</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="?page=category_product" title="">Iphone</a>
                        </li>
                        <li>
                            <a href="?page=category_product" title="">Samsung</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?page=category_product" title="">Iphone X</a>
                                </li>
                                <li>
                                    <a href="?page=category_product" title="">Iphone 8</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="?page=category_product" title="">Nokia</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="?page=category_product" title>Máy tính bảng</a>
                </li>
                <li>
                    <a href="?page=category_product" title>Laptop</a>
                </li>
                <li>
                    <a href="?page=category_product" title>Đồ dùng sinh hoạt</a>
                </li>
                <li>
                    <a href="?page=blog" title>Blog</a>
                </li>
                <li>
                    <a href="#" title>Liên hệ</a>
                </li>
            </ul>
        </div>
    </div>
</div>


</body>
</html>