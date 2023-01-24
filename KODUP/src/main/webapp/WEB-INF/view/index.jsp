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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> -->
<link rel="stylesheet" href="css/summernote/summernote-lite.css">
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet">
<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->
<script src="js/summernote/summernote-lite.js"></script>
<script src="js/summernote/lang/summernote-ko-KR.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script defer src="js/index.js"></script>
<title>코드 레벨업 - 코덥!</title>
</head>
<body>
	<!-- HIDDEN -->
	<form name="index_cb_form" class="index_cb_form" method="post">
		<input type="hidden" name="sno" value="1">
		<input type="hidden" name="sort" value="1">
		<input type="hidden" name="boardtype" value="">
		<input type="hidden" name="horsehead" value="">
		<input type="hidden" name="hashtag" value="">
		<input type="hidden" name="qna_pixel_reward" value="1">
		<input type="hidden" name="nowPage" value="1">
		<input type="hidden" name="findStr" value="">
		<input type="hidden" name="id" value="${sessionScope.sessionId }">
		<!-- SORT -->
		<select id="sort" style="display: none;" name="sort" onchange="changeSort()" class="form-select" aria-label="Default select example">
			<option value="1" ${cbpVo.sort == 1 ? 'selected' : '' }>최신순</option>
			<option value="2" ${cbpVo.sort == 2 ? 'selected' : '' }>추천순</option>
			<option value="3" ${cbpVo.sort == 3 ? 'selected' : '' }>댓글순</option>
			<option value="4" ${cbpVo.sort == 4 ? 'selected' : '' }>조회순</option>
		</select>
	</form>
	<input type="hidden" class="sessionId_hidden" value="${sessionScope.sessionId }">
	<input type="hidden" class="grade_hidden" value="${sessionScope.grade }">
	<input type="hidden" class="profile_img_hidden" value="${sessionScope.profile_img }">
	<!-- NAV -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0 index_nav">
		<div class="container index_hamburg_wrap" style="padding-right: 0;">
			<div class="row index_nav_warp" style="width: 100%;">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
		        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding: 0;">
					<div class="col-md-2">
				        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5 index_logo_a">
				           	<img src="images/로고3.png" alt="Logo" class="d-inline-block align-text-top index_logo">
				           	KODUP
				        </a>
			        </div>
		        	<div class="col-md-8 index_nav_items">
				   		<ul class="navbar-nav me-auto mb-2 mb-lg-0 index_nav_ul" style="padding-left: 10px">
				       		<li class="nav-item">
				       			<a href="#" class="nav-link active non-click btnQna" aria-current="page" style="cursor: pointer;">Q&A</a>
				       		</li>
				       		<li class="nav-item">
				       			<a href="#" class="nav-link active non-click btnInfoshare" aria-current="page" style="cursor: pointer;">정보공유</a>
				       		</li>
				       		<li class="nav-item">
				       			<a href="#" class="nav-link active non-click btnFreetalking" aria-current="page" style="cursor: pointer;">커뮤니티</a>
				       		</li>
				       		<li class="nav-item">
				       			<a href="#" class="nav-link active non-click mansearch" aria-current="page" style="cursor: pointer;">구인</a>
				       		</li>
				       		<li class="nav-item">
				       			<a href="#" class="nav-link active non-click btnJobsearch" aria-current="page" style="cursor: pointer;">구직</a>
				       		</li>
				       		<li class="nav-item">
				       			<a href="#" class="nav-link active non-click btnNotification" aria-current="page" style="cursor: pointer;">공지사항</a>
				       		</li>
				       		<li class="nav-item">
				       			<a class="nav-link active" aria-current="page" href="/intro">INTRO</a>
				       		</li>
				       	</ul>
			       	</div>
			       	<div class="col-md-2" style="padding-right: 3px;">
			            <div class="navbar-nav ms-auto p-4 p-lg-0 index_dropdown_wrap_wrap" style="float: right; padding: 0 !important;">
			            	<c:choose>
				            	<c:when test="${sessionId ne null }">
					                <div class="nav-item dropdown index_dropdown_wrap">
					                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="padding: 4px;">
					                    	<img src="upload/${sessionScope.profile_img }" class="d-inline-block align-text-top" style="width: 30px; height: 30px; border-radius: 50%;">
					                    </a>
					                    <div class="dropdown-menu fade-down m-0" id="index_dropdown">
											<a class="dropdown-item pixelbuy" href="#">포인트충전</a>
											<a id='btnMyprofile' class="dropdown-item" href="#">내프로필</a>
											<a class="dropdown-item btnMypage" href="#">마이페이지</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item btnLogoutR" href="#">로그아웃</a>
					                    </div>
					                </div>
				            	</c:when>
				            	<c:otherwise>
						            <input type="button" value="로그인" class="btn index_btnLogin"/>
				            	</c:otherwise>
			            	</c:choose>
			            </div>
				    </div>
		        </div>
	        </div>
	    </div>
    </nav>
    
	<!-- MANTOMAN -->
	<a href="#" onclick="return false" class="btnMantoman" id="btnMantoman">
		<i class="xi xi-message xi-4x pull-left xi-border"></i>
	</a>
    
	<!-- MIDDLE -->
	<div id="middle" class="container">
	
		<!-- LEFT -->
		<!-- TAG -->
		<div class="row">
			<div class="col-md-2 tag" style="padding: 0 40px 0 0;">
				<aside id="left" style="float: left;">
					<div class="container">
						<div class="row">
							<!-- HOT TAG -->
							<div class="col-md-12" id="index_hashtag"></div>
							<!-- HONOR -->
							<div class="col-md-12" id="index_honor" style="padding: 0;">
								<img src="images/index_ad4.png" style="width: 100%; float: left;">
							</div>
							<!-- TOP WRITER -->
							<div class="col-md-12" id="index_top_writer"></div>
						</div>
					</div>
				</aside>
			</div>
			
			<!-- CENTER -->
			<div class="col-md-8">
				<img src="images/index_ad3.png" style="height: 180px; width: 100%; padding-right: 0; margin-bottom: 40px;">
				<!-- INSERT CONTENT -->
				<section id="center"></section>
			</div>
			
			<!-- RIGHT -->
			<!-- AD -->
			<div class="col-md-2 add">
				<aside id="right" style="float: right;">
					<div class="container">
						<div class="row">
							<div class="col-md-12" style="padding: 0;">
								<img src="images/index_ad2.png" style="width: 140px; height: 500px; float: right;">
							</div>
							<div class="col-md-12" style="padding: 0;">
								<img src="images/index_ad2.png" style="width: 140px; height: 500px; float: right;">
							</div>
						</div>
					</div>
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
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Contact Us</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">About Us</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Stories</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Press</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">버그제보</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Return Policy</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Terms Of Use</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Security</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Privacy</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">개인정보 처리방침</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Login</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Register</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Sitemap</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Our Products</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">서비스 이용약관</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Payments</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Shipping</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Cancellation</a></li>
						<li class="mb-2"><a href="#" onclick="return false" class="text-muted">Returns</a></li>
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
						<li class="list-inline-item"><a href="https://www.youtube.com/" target="_blank" title="youtube"><i class="xi-youtube-play xi-2x"></i></a></li>
						<li class="list-inline-item"><a href="https://www.instagram.com/" target="_blank" title="instagram"><i class="xi-instagram xi-2x"></i></a></li>
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
	<div id='sockectController'>

	</div>
</body>
</html>