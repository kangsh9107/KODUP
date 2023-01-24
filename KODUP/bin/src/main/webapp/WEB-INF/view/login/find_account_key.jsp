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
	<div class="container" style="padding: 0;">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
				<img src="images/index_login.png" id="index_lgoin_img">
				<div style="width: 400px; display: inline-block; position: absolute; margin: 5% 0 0 0;">
					<!-- FORM -->
					<form name="index_find_account_key_form" class="index_find_account_key_form" method="post">
						<!-- MENUAL -->
						<div class="index_find_menual">
							<span>이메일로 전송된 인증키를 입력하시면,</span>
							<br/>
							<span>비밀번호 변경링크로 연결됩니다.</span>
						</div>
						<!-- KEY -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
							<input type="text" name="keyR" class="form-control" placeholder="key" autocomplete="off">
						</div>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-keyboard"></i></span>
							<input type="button" value="인증하기" class="btn index_find_account_keyR">
						</div>
						<!-- HiDDEN -->
						<input type="hidden" name="keyTemp" value="${keyTemp }">
						<input type="hidden" name="email" value="${email }">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>