<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/notification.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/notification.js"></script>
<title>notification/notification.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<!-- BOARDTYPE -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<label class="list-group-item list-group-item-action" id="index_board_boardtype">
						공지사항
						<img id="index_boardtype_background" src="images/index_boardtype_background5.png">
					</label>
				</div>
			</div>
		</div>
		
		<!-- FORM -->
		<form name="board_search_form" class="board_search_form" method="post">
			<div class="row">
				<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
					<!-- INSERT -->
					<input type="button" class="btn btnNotificationInsert" value="&#xf304; 작성하기" style="font-family: FontAwesome; float: left;">
					<!-- HORSEHEAD -->
					<input type="radio" onclick="runNotification()" class="btn-check" name="horsehead_radio" id="horsehead_radio1">
					<label for="horsehead_radio1">공지사항</label>
					<input type="radio" onclick="runNotification()" class="btn-check" name="horsehead_radio" id="horsehead_radio2">
					<label for="horsehead_radio2">이벤트</label>
					<input type="radio" onclick="runNotification()" class="btn-check" name="horsehead_radio" id="horsehead_radio3" checked>
					<label for="horsehead_radio3">전체</label>
					<!-- SORT -->
					<select name="sort" class="form-select" aria-label="Default select example">
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
					<input type="button" class="btn btnRefresh" value="&#xf021;" style="font-family: FontAwesome; float: left; padding: 0; margin-left: -12px;">
					<!-- SEARCH BOX -->
					<button type="button" class="btn btnSearch"><i class="fas fa-search"></i></button>
					<input type="search" name="findStr" class="inputSearch" placeholder="공지사항 내에서 검색" autocomplete="off">
					<input type="search" class="inputSearchTemp">
					<!-- MOVE -->
					<label style="float: right; padding: 0 0 0 10px;">
						<input type="button" class="btn btnNext" value="&#xf061;" style="font-family: FontAwesome; padding: 0; margin-right: -12px;">
					</label>
					<label style="float: right; padding: 0 0 0 10px;">
						<input type="button" class="btn btnPrevious" value="&#xf060;" style="font-family: FontAwesome; padding: 0;">
					</label>
				</div>
			</div>
			
			<!-- HIDDEN -->
			<input type="hidden" name="nowPage" value="">
			<input type="hidden" name="notification_sno" value="">
			<input type="hidden" name="sno" value="">
		</form>

		<!-- LIST -->
		<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
			<c:forEach var="vo" begin="1" end="20">
				<li class="list-group-item" style="padding: 10px 0 10px 0;">
					<a href="#" class="text-decoration-none">
						<img id="index_profile" src="images/index_default.png">
						<span id="index_nickname">글로벌IT</span>
					</a>
					<span id="index_time">· 3분 전</span>
					<div style="float: right;">
						<i class="fas fa-circle-check" style="color: #555; font-size: 0.9rem;"></i>
					</div>
					<br/>
					<a href="#" onclick="notification_view()" class="text-decoration-none">
						<span id="index_doc">1월 둘째 살생부</span>
					</a>
					<br/>
					<div style="float: left;">
						<!-- HORSEHEAD -->
						<label id="board_horsehead">공지사항</label>
						<!-- HASHTAG -->
						<c:forTokens var="list" items="#카드빨리,#퇴실빨리" delims=",">
							<a href="#" onclick="return false" class="board_list_hashtag" style="font-size: 0.8rem; color: #555; margin-left: 3px;">${list }</a>
						</c:forTokens>
					</div>
					<!-- VIEW & THUMB & REPL -->
					<div style="float: right; cursor: default;">
						<img id="index_viewcount" src="images/index_viewcount.png">
						<span id="index_viewcount_sum">2023</span>
						<img id="index_updown" src="images/index_updown.png">
						<span id="index_updown_sum">-12</span>
						<img id="index_repl" src="images/index_repl.png">
						<span id="index_repl_sum">134</span>
					</div>
				</li>
			</c:forEach>
		</ul>
		
		<!-- BUTTON -->
		<div class="row-fluid">
			<div class="col-md-12" id="board_btnZone">
				<div style="float: left; padding: 0; line-height: 33px;">
					<button type="button" class="btn" id="btnPrevious" style="padding: 0;">
						<i class="fas fa-arrow-left" style="color: #555; font-size: 0.9rem;"></i>
						<span id="textPrevious" style="margin-left: 10px; font-size: 0.9rem;">Previous</span>
					</button>
				</div>
				
				<c:forEach var="i" begin="1" end="3">
		        	<button type="button" class="btn" id="btnMove">${i }</button>
				</c:forEach>
				<a href="#" onclick="return false" id="btnMoveInput">...</a>
				<button type="button" class="btn" id="btnMove">10800</button>
				
				<div style="float: right; padding: 0 0 0 10px; line-height: 33px;">
					<button type="button" class="btn" id="btnNext" style="padding: 0; margin-right: -12px;">
						<span id="textNext" style="margin-right: 10px; font-size: 0.9rem;">Next</span>
						<i class="fas fa-arrow-right" style="color: #555; font-size: 0.9rem;"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>