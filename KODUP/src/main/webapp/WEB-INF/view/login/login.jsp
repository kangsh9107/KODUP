<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script defer src="js/join.js"></script>
<title>login/login.jsp</title>
</head>
<body>
	<!-- LOGIN -->
	<div class="container" style="padding: 0;">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
				<img src="images/index_login.png" id="index_lgoin_img">
				<div style="width: 400px; display: inline-block; position: absolute; margin: 5% 0 0 0;">
					<!-- FORM -->
					<form name="index_login_form" class="index_login_form" method="post">
						<div class="input-group form-group index_login_input">
							<span class="input-group-text kakao"><i class="fas fa-comment"></i></span>
							<input type="button" value="카카오로 시작하기" class="btn index_btnKakaoJoin">
						</div>
						<hr/>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
							<input type="text" name="id" class="form-control" placeholder="id" autocomplete="off">
						</div>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
							<input type="password" name="pwd" class="form-control" placeholder="password" autocomplete="off">
						</div>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-keyboard"></i></span>
							<input type="button" value="로그인" class="btn index_btnLoginR">
						</div>
						
						<!-- FIND ACCOUNT & PASSWORD -->
						<div class="index_find">
							<a href="#" class="index_btnJoin">회원가입</a>
							<a href="#" class="index_find_account">계정찾기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>