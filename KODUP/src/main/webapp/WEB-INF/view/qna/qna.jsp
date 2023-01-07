<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/qna.js"></script>
<title>qna/qna.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<!-- BOARDTYPE -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<span class="list-group-item list-group-item-action" id="index_qna_boardtype">
						QnA
						<img id="index_boardtype_background" src="images/index_boardtype_background0.png">
					</span>
				</div>
			</div>
		</div>
		
		<!-- FORM -->
		<form name="qna_board_search_form" class="qna_board_search_form" method="post">
			<div class="row">
				<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
					<!-- INSERT -->
					<input type="button" class="btn btnQnaInsert" value="&#xf304; 작성하기" style="font-family: FontAwesome; float: left;">
					<!-- HORSEHEAD -->
					<input type="radio" onclick="run()" class="btn-check" name="qna_horsehead_radio" id="qna_horsehead_radio1">
					<label for="qna_horsehead_radio1">기술</label>
					<input type="radio" onclick="run()" class="btn-check" name="qna_horsehead_radio" id="qna_horsehead_radio2">
					<label for="qna_horsehead_radio2">커리어</label>
					<input type="radio" onclick="run()" class="btn-check" name="qna_horsehead_radio" id="qna_horsehead_radio3">
					<label for="qna_horsehead_radio3">기타</label>
					<input type="radio" onclick="run()" class="btn-check" name="qna_horsehead_radio" id="qna_horsehead_radio4" checked>
					<label for="qna_horsehead_radio4">전체</label>
					<!-- SORT -->
					<select name="qna_sort" class="form-select" aria-label="Default select example">
						<option value="1" selected>최신순</option>
						<option value="2">추천순</option>
						<option value="3">댓글순</option>
						<option value="4">조회순</option>
					</select>
				</div>
			</div>
			
			<!-- SEARCH -->
			<div class="row-fluid" style="border-top: 1px solid #dee2e6; margin: 25px 0 25px 0;">
				<div class="col-md-12" style="padding: 20px 10px 0 10px;">
					<!-- REFRESH -->
					<input type="button" class="btn btnQnaRefresh" value="&#xf021;" style="font-family: FontAwesome; float: left; padding: 0; margin-left: -12px;">
					<!-- SEARCH BOX -->
					<div class="d-flex justify-content-center h-100">
						<div class="searchbar">
							<input class="search_input" type="text" name="" placeholder="QnA 내에서 검색">
							<a href="#" class="search_icon"><i class="fas fa-search"></i></a>
						</div>
					</div>
					<!-- MOVE -->
					<label style="float: right; padding: 0 0 0 10px !important;">
						<input type="button" class="btn btnQnaNext" value="&#xf061;" style="font-family: FontAwesome; padding: 0; margin-right: -12px;">
					</label>
					<label style="float: right; padding: 0 0 0 10px !important;">
						<input type="button" class="btn btnQnaPrevious" value="&#xf060;" style="font-family: FontAwesome; padding: 0;">
					</label>
				</div>
			</div>
			
			<!-- HIDDEN -->
		</form>

		<!-- LIST -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach var="list" begin="0" end="4">
						<li class="list-group-item ListGroupItem" style="padding: 10px 0 10px 0;">
							<img id="index_profile" src="images/index_default.png" style="vertical-align: middle;">
							<span id="index_corpname">(주)뻥이요</span>
							<div id="task">SI</div>
							<div style="float: right;">
								<span id="work_start">2023.01.25(근무시작일)</span>
								<span id="deadline">마감 ?일전</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_doc" class="index_doc">백엔드,팀원 | 제대로 튀겨드립니다. 신입도 3년차부터! 가 족같은 분위기에서 일하실 분 구합니다 ^_^</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<!-- BUTTON -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px; text-align: center;">
				<c:forEach var="i" begin="1" end="5">
		        	<button class="qna_btnMove">${i }</button>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>