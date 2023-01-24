<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script defer src="js/join.js"></script>
<title>login/find_account.jsp</title>
</head>
<body>
	<!-- FIND ACCOUNT -->
	<div class="container" style="padding: 0;">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
				<img src="images/index_login.png" id="index_lgoin_img">
				<div style="width: 400px; display: inline-block; position: absolute; margin: 5% 0 0 0;">
					<!-- FORM -->
					<form name="index_find_account_form" class="index_find_account_form" method="post">
						<!-- MENUAL -->
						<div class="index_find_menual">
							<span>회원 가입시 입력하신 이메일을 입력하시면,</span>
							<br/>
							<span>인증키를 보내드립니다.</span>
						</div>
						<!-- EMAIL -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-envelope"></i></span>
							<input type="text" name="email" class="form-control" value="kangsh9107@naver.com" placeholder="email" autocomplete="off">
						</div>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-keyboard"></i></span>
							<input type="button" value="계정찾기" class="btn index_find_accountR">
						</div>
						<!-- HIDDEN -->
						<input type="hidden" name="sender" value="kangsh9107@naver.com">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>