<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.products" %>

<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Review" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

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

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
<!-- HEADER -->
<header>
	<!-- TOP HEADER -->
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i>0723658910</a></li>
				<li><a href="#"><i class="fa fa-envelope-o"></i> shopntt@email.com</a></li>
				<li><a href="#"><i class="fa fa-map-marker"></i> Linh Trung, Thủ Đức</a></li>
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
			<!-- NAV --><ul class="main-nav nav navbar-nav">
			<ul class="main-nav nav navbar-nav">
				<li ><a href="/index">Trang chủ</a></li>
				<li class="active"><a href="/store">Sản phẩm</a></li>
				<li><a href="/about">Về chúng tôi</a> </li>
				<li><a href="/contactControl">Liên hệ</a></li>

			</ul>
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
					<li><a href="/store">Sản phẩm</a></li>
					<li class="active">${detail.nameProduct}</li>
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
			<!-- Product main img -->
			<div class="col-md-5 col-md-push-2">
				<div id="product-main-img">


					<div class="product-preview">
						<img src="${detail.image}" alt="">
					</div>
				</div>
			</div>
			<!-- /Product main img -->

			<!-- Product thumb imgs -->
			<div class="col-md-2  col-md-pull-5">
				<div id="product-imgs">


					<div class="product-preview">
						<img src="${detail.image}" alt="">
					</div>
				</div>
			</div>
			<!-- /Product thumb imgs -->

			<!-- Product details -->
			<div class="col-md-5">
				<div class="product-details">
					<h2 class="product-name">${detail.nameProduct}</h2>
					<div>
						<div class="product-rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star-o"></i>
						</div>
						<a class="review-link" href="#">10 đánh giá | Thêm đánh giá của bạn</a>
					</div>
					<div>
						<h4 class="product-price">${detail.priceNew}<del class="product-old-price">${detail.priceOld}</del></h4>
						<c:if test="${detail.quantityStock == 0}"> <span class="product-available" style="color:darkred">Sản phẩm hết hàng</span></c:if>
						<c:if test="${detail.quantityStock != 0}"> <span class="product-available">số lượng còn lại : ${detail.quantityStock}</span></c:if>
					</div>
					<p>${detail.description}</p>
					<div class="add-to-cart">
						<div class="qty-label">
							Số lượng
							<div class="input-number">
								<input type="number">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
					</div>

					<ul class="product-btns">
						<c:if test="${detail.quantityStock != 0}">
							<li><a href="addcart?proid=${detail.idProduct}"><i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</a></li></c:if>
						<li><a href="addwish?proid=${detail.idProduct}"><i class="fa fa-heart-o"></i> Thêm vào yêu thích</a></li>
						<li><a href="#"><i class="fa fa-exchange"></i> Thêm để so sánh</a></li>
					</ul>



					<ul class="product-links">
						<li>Chia sẻ:</li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-envelope"></i></a></li>
					</ul>

				</div>
			</div>
			<!-- /Product details -->

			<!-- Product tab -->
			<div class="col-md-12">
				<div id="product-tab">
					<!-- product tab nav -->
					<ul class="tab-nav">
						<li class="active"><a data-toggle="tab" href="#tab1">Mô tả</a></li>
						<li><a data-toggle="tab" href="#tab3">Bình luận(${countAllReview })</a></li>
					</ul>
					<!-- /product tab nav -->

					<!-- product tab content -->
					<div class="tab-content">
						<!-- tab1  -->
						<div id="tab1" class="tab-pane fade in active">
							<div class="row">
								<div class="col-md-12">
									<p>${detail.description}</p>
								</div>
							</div>
						</div>
						<!-- /tab1  -->
						<!-- tab3  -->
						<div id="tab3" class="tab-pane fade in">
							<div class="row">
								<!-- Rating -->
								</div>
								<!-- /Rating -->
<%--								<c:forEach items="${requestScope.listAllReview}" var="r">--%>
								<!-- Reviews -->
<c:set var="listR" value="${requestScope.listAllReview}"/>
								<div class="col-md-6">
									<div id="reviews">
										<ul class="reviews">
	<c:forEach var="re" items="${listR}">
		<li>
			<div class="review-heading">
				<h5 class="name">${re.nameID}</h5>
				<p class="date">${re.dateReview}</p>
				<div class="review-rating">
					<p>${re.contentReview}</p>
				</div>
			</div>
			<div class="review-body">
				<a data-toggle="tab" href="#">Trả lời</a>

			</div>

		</li>

	</c:forEach>
										</ul>

										<ul class="reviews-pagination">
											<li class="active">1</li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
										</ul>
									</div>
								</div>
								<!-- /Reviews -->
								<form action="addReview" method="post">
								<!-- Review Form -->
								<div class="col-md-3">
									<div id="review-form">
										<form class="review-form">

											<textarea name="content"class="input" placeholder="Bình luận của bạn"></textarea>
											<input type="hidden" name="idpro" value="${detail.getIdProduct()}">
<%--											<div class="input-rating">--%>
<%--												<span>Bình luận của bạn: </span>--%>
<%--&lt;%&ndash;												<div class="stars">&ndash;%&gt;--%>
<%--&lt;%&ndash;													<input name="score" class="input" type="text" placeholder="Nhập điểm trên thang điểm 5">&ndash;%&gt;--%>
<%--&lt;%&ndash;												</div>&ndash;%&gt;--%>

<%--											</div>--%>
											<button class="primary-btn">GỬI</button>
										</form>
									</div>
								</div>
								</form>
								<!-- /Review Form -->
							</div>
						</div>
						<!-- /tab3  -->
					</div>
					<!-- /product tab content  -->
				</div>
			</div>
			<!-- /product tab -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<div class="col-md-12">
				<div class="section-title text-center">
					<h3 class="title">Sản phẩm liên quan</h3>
				</div>
			</div>

			<!-- product -->

			<!-- /product -->

			<!-- product -->

			<!-- /product -->

			<%

				List<products> listlq = (List<products>) request.getAttribute("listlq");
				for (products re : listlq) {
			%>
			<!-- product -->
			<div class="col-md-4 col-xs-6">
				<div class="product">
					<div class="product-img">
						<img src="<%=re.getImage()%>" alt="">

					</div>
					<div class="product-body">
						<h3 class="product-name"><a href="detail?pid=<%=re.getIdProduct()%>"><%=re.getNameProduct()%></a></h3>
						<h4 class="product-price"><%=re.getPriceNew()%><del class="product-old-price"><%=re.getPriceOld()%></del></h4>
						<div class="product-btns">
							<button class="add-to-wishlist"><a href="addwish?proid=<%=re.getIdProduct()%>" ><i class="fa fa-heart-o"></i></a><span class="tooltipp">Thêm vào yêu thích</span></button>
							<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
						</div>
					</div>
					<div class="add-to-cart">

						<%--                           <a herf="addcart?proid=${detail.idProduct}"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>--%>
						<a href="addcart?proid=<%=re.getIdProduct()%>"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
					</div>
				</div>
			</div>
			<!-- /product -->
			<%}%>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>

<!-- /Section -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="newsletter">
					<p>Đăng ký để nhận <strong>thông báo</strong></p>
					<form>
						<input class="input" type="email" placeholder="NHẬP EMAIL CỦA BẠN">
						<button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng ký</button>
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
		<!-- /row -->
	</div>
	<!-- /container -->
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
						<p>Ntt Store</p>
						<ul class="footer-links">
							<li><a href="#"><i class="fa fa-map-marker"></i>Linh Trung, Thủ Đức</a></li>
							<li><a href="#"><i class="fa fa-phone"></i>0723658910</a></li>
							<li><a href="#"><i class="fa fa-envelope-o"></i>Shopntt@email.com</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">Thể loại</h3>
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
							<li><a href="#">Liên hệ với chúng tôi</a></li>
							<li><a href="#">Chính sách bảo mật</a></li>
							<li><a href="#">Đặt và trả hàng</a></li>
							<li><a href="#">Điều khoản và điều kiện</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">Dịch vụ</h3>
						<ul class="footer-links">
							<li><a href="#">Tài khoản</a></li>
							<li><a href="#">Giỏ hàng</a></li>
							<li><a href="#">Yêu thích</a></li>
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