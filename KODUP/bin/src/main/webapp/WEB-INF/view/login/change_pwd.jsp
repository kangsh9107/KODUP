<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script defer src="js/join.js"></script>
<title>login/change_pwd.jsp</title>
</head>
<body>
	<!-- CHANGE PASSWORD -->
	<div class="container" style="padding: 0;">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
				<img src="images/index_login.png" id="index_lgoin_img">
				<div style="width: 400px; display: inline-block; position: absolute; margin: 5% 0 0 0;">
					<!-- FORM -->
					<form name="index_change_password_form" class="index_change_password_form" method="post">
						<!-- MENUAL -->
						<div class="index_find_menual">
							<span>새로운 비밀번호를 입력하시면,</span>
							<br/>
							<span>비밀번호를 변경해드립니다.</span>
						</div>
						<!-- ID -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
							<input type="text" name="id" class="form-control" value="${id }" readOnly>
						</div>
						<!-- PASSWORD -->
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
							<input type="password" name="pwd" class="form-control" autocomplete="off">
						</div>
						<div class="input-group form-group index_login_input">
							<span class="input-group-text"><i class="fas fa-keyboard"></i></span>
							<input type="button" value="변경완료" class="btn index_change_passwordR">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>