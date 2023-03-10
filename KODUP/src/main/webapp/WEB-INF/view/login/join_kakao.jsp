<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script defer src="js/join.js"></script>
<title>login/join_kakao.jsp</title>
</head>
<body>
	<!-- JOIN -->
	<div class="container" style="padding: 0;">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
				<img src="images/index_login.png" id="index_lgoin_img">
				<div style="width: 400px; display: inline-block; position: absolute; margin: 5% 0 0 0;">
					<!-- FORM -->
					<form name="index_join_form" class="index_join_form" method="post">
						<!-- ID -->
						<input type="hidden" value="${id }" name="id">
						<!-- PROFILE IMG -->
						<input type="hidden" value="${img }" name="profile_img">
						<!-- EMAIL -->
						<input type="hidden" value="${email }" name="email">
						<!-- NICKNAME -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-file-signature"></i></span>
							<input type="text" name="nickname" class="form-control" placeholder="nickname" autocomplete="off">
						</div>
						<!-- GENDER -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text" style="width: 37px;"><i class="fas fa-venus-mars"></i></span>
							<label class="form-check-label" style="line-height: 40px; margin-left: 10px;">
								<input class="form-check-input" style="vertical-align: text-top;" type="radio" name="gender" value="m" checked>남자
							</label>
							<label class="form-check-label" style="line-height: 40px; margin-left: 10px;">
								<input class="form-check-input" style="vertical-align: text-top;" type="radio" name="gender" value="f">여자
							</label>
						</div>
						<!-- AGE -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-cake-candles"></i></span>
							<input type="date" name="date" class="form-control" autocomplete="off">
						</div>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text kakao"><i class="fas fa-comment"></i></span>
							<input type="button" value="가입완료" class="btn index_btnKakaoJoinR">
						</div>
						<div class="input-group form-group index_login_input" style="justify-content: center; margin: 25px 0 -5px 0;">
							<div class="g-recaptcha" data-sitekey="6LffpnoUAAAAAABgLv2eqcQ34mSpD70nkO9V1LRo"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>