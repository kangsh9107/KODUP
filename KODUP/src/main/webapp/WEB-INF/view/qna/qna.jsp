<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<title>qna/qna.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<div class="row">
		
			<!-- BOARDTYPE -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 40px;">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action" id="index_main_boardtype">
						QnA
						<img id="index_boardtype_background" src="iamges/index_boardtype_background0.png">
					</a>
				</div>
				
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach var="vo" begin="0" end="4">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="#" class="text-decoration-none">
								<img id="index_profile" src="../images/index_default.png">
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
		</div>
	</div>
</body>
</html>