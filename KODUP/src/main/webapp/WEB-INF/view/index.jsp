<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- NAV -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background-color: #bb2649 !important;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"
				style="color: white; line-height: 36px; margin-left: 150px; margin-right: 70px;">
				<img src="/images/로고3.png" alt="Logo"
				class="d-inline-block align-text-top"
				style="width: 60px; height: 32px;"> KODUP
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white; margin-right: 20px;">QnA</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white; margin-right: 20px;">정보공유</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white; margin-right: 20px;">커뮤니티</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white; margin-right: 20px;">구인</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white; margin-right: 20px;">구직</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white;">공지사항</a></li>
				</ul>
				<form class="d-flex" role="search">
					<div class="btn-group dropdown" style="margin-right: 150px;">
						<div class="btn btn-secondary dropdown-toggle"
							style="background-color: #bb2649 !important; border-color: #bb2649 !important; color: black;"
							data-bs-toggle="dropdown" aria-expanded="false">
							<img src="/images/로고3.png" alt="Logo"
								class="d-inline-block align-text-top"
								style="width: 32px; height: 32px; border-radius: 50%;">
						</div>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">포인트충전</a></li>
							<li><a class="dropdown-item" href="#">내프로필</a></li>
							<li><a class="dropdown-item" href="#">마이페이지</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">로그아웃</a></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</nav>
	<!-- MIDDLE -->
	<div id="middle" class="container">
		<!-- LEFT -->
		<div class="row">
			<div class="col-md-2">
				<aside id="left" style="float: left;">
					<div style="display: inline-block;">
						<span>#인기 태그</span>
						<hr />
						<span>#java</span> <span>45</span> <br /> <span>#java</span> <span>45</span>
						<br /> <span>#java</span> <span>45</span> <br /> <span>#java</span>
						<span>45</span> <br /> <span>#java</span> <span>45</span>
					</div>
					<br />
					<div style="display: inline-block;">
						<span>Top Writers</span>
						<hr />
						<span>Hellini</span> <br /> <span>옥다방고양이</span> <br /> <span>akqd1241</span>
						<br /> <span>고등어통조림</span> <br /> <span>leemong77</span>
					</div>
				</aside>
			</div>
			<!-- CENTER -->
			<div class="col-md-8">
				<section id="center"></section>
			</div>
			<!-- RIGHT -->
			<div class="col-md-2">
				<aside id="right" style="float: right;">
					<img src="/images/광고1.png" alt="Logo"
						style="width: 150px; height: 300px;">
				</aside>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<footer class="bg-white">
		<div class="container py-5">
			<div class="row py-3">

				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">About</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Contact
								Us</a></li>
						<li class="mb-2"><a href="#" class="text-muted">About Us</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Stories</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Press</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Help</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Payments</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Shipping</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Cancellation</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Returns</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Policy</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Return
								Policy</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Terms Of
								Use</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Security</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Privacy</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Company</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Login</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Register</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Sitemap</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Our
								Products</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Registered
						Office Address</h6>
					<p class="text-muted mb-4">Here , write the complete address of
						the Registered office address along with telephone number.</p>
					<ul class="list-inline mt-4">
						<li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fab  fa-2x fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fab fa-2x fa-facebook-f"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fab fa-2x fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank" title="pinterest"><i class="fab fa-2x fa-youtube"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank" title="vimeo"><i class="fab fa-2x fa-google"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr class="p-0 m-0 b-0">
		<div class="bg-light py-2">
			<div class="container text-center">
				<p class="text-muted mb-0 py-2">&copy; 2023 KODUP</p>
			</div>
		</div>
	</footer>
</body>
</html>