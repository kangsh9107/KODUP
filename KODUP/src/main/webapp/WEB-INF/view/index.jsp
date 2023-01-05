<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- META -->
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<!-- FAVICON -->

<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="css/index.css" rel="stylesheet">
<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script defer src="js/index.js"></script>
<title>코드 레벨업 - 코덥!</title>
</head>
<body>
	<!-- NAV -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0 index_nav">
		<div class="container" style="padding-right: 0;">
			<div class="row" style="width: 100%;">
				<div class="col-md-2">
			        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5 index_logo_a">
			           	<img src="images/로고3.png" alt="Logo" class="d-inline-block align-text-top index_logo">
			           	KODUP
			        </a>
		        </div>
		        <div class="col-md-8 index_nav_items">
			   		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			       		<li class="nav-item">
			       			<a class="nav-link active" aria-current="page" href="#"><span>QnA</span></a>
			       		</li>
			       		<li class="nav-item">
			       			<a class="nav-link active" aria-current="page" href="#"><span>정보공유</span></a>
			       		</li>
			       		<li class="nav-item">
			       			<a class="nav-link active" aria-current="page" href="#"><span>커뮤니티</span></a>
			       		</li>
			       		<li class="nav-item">
			       			<a class="nav-link active" aria-current="page" href="#"><span>구인</span></a>
			       		</li>
			       		<li class="nav-item">
			       			<a class="nav-link active" aria-current="page" href="#"><span>구직</span></a>
			       		</li>
			       		<li class="nav-item">
			       			<a class="nav-link active" aria-current="page" href="#"><span>공지사항</span></a>
			       		</li>
			       	</ul>
		       	</div>
		       	<div class="col-md-2" style="padding-right: 3px;">
			        <div class="collapse navbar-collapse" id="navbarCollapse">
			            <div class="navbar-nav ms-auto p-4 p-lg-0">
			                <div class="nav-item dropdown">
			                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="padding: 4px; margin-right: 10px;">
			                    	<img src="images/index_default.png" class="d-inline-block align-text-top" style="width: 30px; height: 30px; border-radius: 50%;">
			                    </a>
			                    <div class="dropdown-menu fade-down m-0" id="index_dropdown">
									<a class="dropdown-item" href="#">포인트충전</a>
									<a class="dropdown-item" href="#">내프로필</a>
									<a class="dropdown-item" href="#">마이페이지</a>
									<hr class="dropdown-divider">
									<a class="dropdown-item" href="#">로그아웃</a>
			                    </div>
			                </div>
			            </div>
			            <input type="button" value="로그인" class="btn btnLogin"/>
			        </div>
		        </div>
	        </div>
	    </div>
    </nav>
    
	<!-- MANTOMAN -->
	<a href="#" class="btnMantoman">
		<i class="xi xi-message xi-4x pull-left xi-border"></i>
	</a>
    
	<!-- MIDDLE -->
	<div id="middle" class="container">
	
		<!-- LEFT -->
		<div class="row">
			<div class="col-md-2">
				<aside id="left" style="float: left;">
					<div class="container">
						<div class="row">
							<div class="col-md-12" id="index_hashtag">
								<span style="font-weight: 600;">#인기 태그</span>
								<hr/>
								<c:forEach var="list" begin="0" end="4">
									<a href="#" class="text-decoration-none" style="float: left;"><span>#JAVA</span></a>
									<span style="float: right; color: #bb2649;">53</span>
									<br/><br/>
								</c:forEach>
							</div>
							<div class="col-md-12" id="index_top_writer">
								<span style="font-weight: 600;">#Top Writer</span>
								<hr/>
								<c:forEach var="list" begin="0" end="4">
									<a href="#" class="text-decoration-none" style="float: left;">
										<img id="index_top_writer_profile" src="images/index_default.png">
										<span id="index_top_writer_nickname">옥다방고양이</span>
									</a>
									<br/><br/>
								</c:forEach>
							</div>
						</div>
					</div>
				</aside>
			</div>
			
			<!-- CENTER -->
			<div class="col-md-8">
				<section id="center">
					<div class="container" style="padding: 0;">
						<div class="row">
							<c:forEach var="list" begin="0" end="5">
								<div class="col-md-6">
									<div class="list-group">
										<a href="#" class="list-group-item list-group-item-action" id="index_main_boardtype">
											QnA
											<img id="index_boardtype_background" src="images/index_boardtype_background2.png">
										</a>
									</div>
									<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
										<c:forEach var="vo" begin="0" end="4">
											<li class="list-group-item" style="padding: 10px 0 10px 0;">
												<a href="#" class="text-decoration-none">
													<img id="index_profile" src="images/index_default.png">
													<span id="index_nickname">딥러닝악마</span>
												</a>
												<span id="index_time">· 5분 전</span>
													<div style="float: right;">
														<img id="index_updown" src="images/index_updown.png">
														<span id="index_updown_sum">5</span>
														<img id="index_repl" src="images/index_repl.png">
														<span id="index_repl_sum">7</span>
													</div>
												<br/>
												<a href="#" class="text-decoration-none">
													<span id="index_doc">초보자를 위한 오픈 소스 시작하기</span>
												</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
			
			<!-- RIGHT -->
			<div class="col-md-2">
				<aside id="right" style="float: right;">
					<img src="images/광고1.png" alt="Logo" style="width: 100%; height: 300px;">
				</aside>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer class="bg-white index_footer">
		<div style="position: relative;">
			<img src="images/index_footer.png" alt="Footer" class="index_footer_dog" style="position: absolute;">
		</div>
		<div class="container py-5" style="padding-top: 20px !important; padding-bottom: 0 !important;">
			<div class="row py-3">
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">광고문의</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Contact Us</a></li>
						<li class="mb-2"><a href="#" class="text-muted">About Us</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Stories</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Press</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">버그제보</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Payments</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Shipping</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Cancellation</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Returns</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">개인정보 처리방침</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Return Policy</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Terms Of Use</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Security</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Privacy</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">서비스 이용약관</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Login</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Register</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Sitemap</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Our Products</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">회사소개</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2">상호명: (주)코덥</li>
						<li class="mb-2">대표명: 크리스마스에도코딩하조</li>
						<li class="mb-2">문의: info@kodup.kr</li>
						<li class="mb-2">주소: 서울 관악구 남부순환로 1820 에그엘로우 7층</li>
					</ul>
					<ul class="list-inline mt-4">
						<li class="list-inline-item"><a href="https://twitter.com/?lang=ko" target="_blank" title="twitter"><i class="xi-twitter xi-2x"></i></a></li>
						<li class="list-inline-item"><a href="https://ko-kr.facebook.com/facebook/" target="_blank" title="facebook"><i class="xi-facebook xi-2x"></i></a></li>
						<li class="list-inline-item"><a href="https://www.instagram.com/" target="_blank" title="instagram"><i class="xi-instagram xi-2x"></i></a></li>
						<li class="list-inline-item"><a href="https://www.pinterest.co.kr/" target="_blank" title="pinterest"><i class="xi-pinterest xi-2x"></i></a></li>
						<li class="list-inline-item"><a href="https://www.youtube.com/" target="_blank" title="youtube"><i class="xi-youtube-play xi-2x"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="bg-light py-2 index_footer_copy">
			<div class="container text-center">
				<p class="text-muted mb-0 py-2">&copy; 2023 KODUP</p>
			</div>
		</div>
	</footer>
</body>
</html>