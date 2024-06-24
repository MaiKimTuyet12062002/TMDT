<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ntt Store</title>

  <!-- Google font -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

  <!-- Slick -->
  <link type="text/css" rel="stylesheet" href="css/slick.css"/>
  <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

  <!-- nouislider -->
  <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

  <!-- Font Awesome Icon -->
  <link rel="stylesheet" href="css/font-awesome.min.css">

  <!-- Custom stlylesheet -->
  <link type="text/css" rel="stylesheet" href="css/style.css"/>

  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<!-- HEADER -->
<header>
  <!-- TOP HEADER -->
  <div id="top-header">
    <div class="container">
      <ul class="header-links pull-left">
        <li><a href="#"><i class="fa fa-phone"></i>0723658910</a></li>
        <li><a href="#"><i class="fa fa-envelope-o"></i>shopntt@email.com</a></li>
        <li><a href="#"><i class="fa fa-map-marker"></i>Linh Trung, Thủ Đức</a></li>
      </ul>
      <ul class="header-links pull-right">
        <%
          User user = (User) session.getAttribute("user");
          if (user != null) {
        %>
        <li><a href="/successAccount"><i class="fa fa-user-o"></i> <%= user.getNameUser() %></a></li>
        <li><a href="/historyinvoice"><i class="fa fa-bars"></i>Lịch sử mua hàng</a></li>
        <%--    Nếu Roleus = 1 thì là admin hiện chữ tài khoản     --%>
        <%
          if (user.getRoleUs() == 1) {
        %>
        <li><a href="/adminpage"><i class="fa fa-cog"></i>Quản lý</a></li>
        <%
          }
        %>
        <%--					--%>
        <li><a href="logout"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>

        <%
        } else {
        %>
        <li><a href="/login"><i class="fa fa-user-o"></i> Tài Khoản</a></li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
  <!-- /TOP HEADER -->

  <!-- MAIN HEADER -->
  <div id="header">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- LOGO -->
        <div class="col-md-3">
          <div class="header-logo">
            <a href="/index" class="logo">
              <img src="./image/ntt.png" alt="">
            </a>
          </div>
        </div>
        <!-- /LOGO -->

        <!-- SEARCH BAR -->
        <div class="col-md-6">
          <div class="header-search">
            <form>
              <input class="input" placeholder="Tìm kiếm tại đây">
              <button class="search-btn">Tìm kiếm</button>
            </form>
          </div>
        </div>
        <!-- /SEARCH BAR -->

        <!-- ACCOUNT -->
        <div class="col-md-3 clearfix">
          <div class="header-ctn">
            <!-- Wishlist -->
            <div>
              <a href="/wishlist">
                <i class="fa fa-heart-o"></i>
                <span>Yêu thích</span>
                <div class="qty"><%=request.getAttribute("sizeW")%></div>
              </a>
            </div>
            <!-- /Wishlist -->

            <!-- Cart -->
            <div class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                <i class="fa fa-shopping-cart"></i>
                <span>Giỏ hàng</span>
                <div class="qty">${cart.size() > 0 ? cart.size() : 0}</div>
              </a>
              <div class="cart-dropdown">
                <div class="cart-btns">
                  <a href="/cart">Xem giỏ hàng</a>
                  <a href="/invoice">Thanh toán<i class="fa fa-arrow-circle-right"></i></a>
                </div>
              </div>
            </div>
            <!-- /Cart -->

            <!-- Menu Toogle -->
            <div class="menu-toggle">
              <a href="#">
                <i class="fa fa-bars"></i>
                <span>Menu</span>
              </a>
            </div>
            <!-- /Menu Toogle -->
          </div>
        </div>
        <!-- /ACCOUNT -->
      </div>
      <!-- row -->
    </div>
    <!-- container -->
  </div>
  <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
  <!-- container -->
  <div class="container">
    <!-- responsive-nav -->
    <div id="responsive-nav">
      <!-- NAV -->
      <ul class="main-nav nav navbar-nav">
        <li><a href="/index">Trang chủ</a></li>
        <li><a href="/store">Sản phẩm</a></li>
        <li class="active"><a href="/about">Về chúng tôi</a></li>
        <li><a href="/contactController">Liên hệ</a></li>
      </ul>
      <!-- /NAV -->
    </div>
    <!-- /responsive-nav -->
  </div>
  <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="col-md-12">
        <ul class="breadcrumb-tree">
          <li><a href="/index">Trang chủ</a></li>
          <li class="active">Về chúng tôi</li>
        </ul>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="billing-details">
        <div class="section-title">
          <h2 class="title" style="text-align: center">Về cửa hàng của chúng tôi</h2>
        </div>
        <br>
        <p>
          Chào mừng bạn đến với cửa hàng đồ ăn vặt của chúng tôi! Chúng tôi cung cấp một loạt các món ăn vặt ngon miệng từ khắp nơi trên thế giới, từ bánh kẹo, snack, đến đồ uống và nhiều hơn nữa. Mỗi sản phẩm đều được chọn lựa kỹ càng để đảm bảo chất lượng và hương vị tuyệt vời nhất cho khách hàng.
        </p>
        <p>
          Tại cửa hàng chúng tôi, bạn sẽ tìm thấy những món ăn vặt mà bạn yêu thích, từ những hương vị truyền thống đến những sản phẩm độc đáo và mới lạ. Chúng tôi cam kết mang đến cho bạn trải nghiệm mua sắm thú vị và thuận tiện nhất.
        </p>
        <p>
          Hãy đến với chúng tôi để khám phá và thưởng thức những món ăn vặt tuyệt vời, mang lại niềm vui và sự hài lòng cho bạn và gia đình.
        </p>
      </div>
    </div>
  </div>
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="newsletter">
          <p>Đăng ký <strong>để nhận thông báo</strong></p>
          <form>
            <input class="input" type="email" placeholder="NHẬP EMAIL CỦA BẠN">
            <button class="newsletter-btn"><i class="fa fa-envelope"></i>Đăng ký</button>
          </form>
          <ul class="newsletter-follow">
            <li>
              <a href="#"><i class="fa fa-facebook"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-twitter"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-instagram"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-pinterest"></i></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
  <!-- top footer -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Về chúng tôi</h3>
            <p>Chúng tôi là cửa hàng đồ ăn vặt hàng đầu, mang đến cho bạn những sản phẩm chất lượng và dịch vụ tuyệt vời.</p>
            <ul class="footer-links">
              <li><a href="#"><i class="fa fa-map-marker"></i>Linh Trung, Thủ Đức</a></li>
              <li><a href="#"><i class="fa fa-phone"></i>0723658910</a></li>
              <li><a href="#"><i class="fa fa-envelope-o"></i>shopntt@email.com</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Danh mục</h3>
            <ul class="footer-links">
              <li><a href="/category?cid=BT">Bánh tráng</a></li>
              <li><a href="/category?cid=BB">Bim Bim</a></li>
              <li><a href="/category?cid=H">Hạt</a></li>
              <li><a href="/category?cid=K">Khô</a></li>
              <li><a href="/category?cid=CB">Combo</a></li>
            </ul>
          </div>
        </div>

        <div class="clearfix visible-xs"></div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Thông tin</h3>
            <ul class="footer-links">
              <li><a href="#">Về chúng tôi</a></li>
              <li><a href="#">Liên hệ</a></li>
              <li><a href="#">Chính sách bảo mật</a></li>
              <li><a href="#">Điều khoản & Điều kiện</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Dịch vụ</h3>
            <ul class="footer-links">
              <li><a href="#">Tài khoản của tôi</a></li>
              <li><a href="#">Xem giỏ hàng</a></li>
              <li><a href="#">Danh sách yêu thích</a></li>
              <li><a href="#">Theo dõi đơn hàng</a></li>
              <li><a href="#">Trợ giúp</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /top footer -->

  <!-- bottom footer -->
  <div id="bottom-footer" class="section">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-12 text-center">
          <ul class="footer-payments">
            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
          </ul>
          <span class="copyright">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Bản quyền &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Trang web được thiết kế <i class="fa fa-heart-o" aria-hidden="true"></i> bởi <a href="https://colorlib.com" target="_blank">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </span>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
