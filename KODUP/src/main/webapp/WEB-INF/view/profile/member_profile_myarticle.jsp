<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/profile.css">
<title>profile/member_profile_myarticle.jsp</title>
</head>
<body>
<div class='myarticle_articleWrapper'>
	<c:forEach var='pfVo' items='${list }'>
			<form class='article'>
				<span class='boardtype'>${pfVo.boardtype}에 게시글을 작성하였습니다.</span>
				<span class='nal'>${pfVo.nal }</span><br>
				<span class='subject'>${pfVo.subject }</span>
				<input type='hidden' name='sno_hidden' value="${pfVo.sno }">
				<input type='hidden' name='boardtype_hidden' value="${pfVo.boardtype}">
				<input type='hidden' name='nal_hidden' value="${pfVo.nal }">
				<input type='hidden' name='subject_hidden' value="${pfVo.subject }">
			</form>
	</c:forEach>
	
<!-- 	<form class='article'>
		<span class='boardtype'>QnA에 게시글을 작성하였습니다.</span>
		<span class='nal'>2023-01-04 08:21:04</span><br>
		<span class='subject'>세무사 기장료 얼마씩 주세요? (부가세 확정신고 기간입니다)</span>
	</form>
	<div class='article'>
		<span class='boardtype'>자유게시판에 게시글을 작성하였습니다.</span>
		<span class='nal'>2023-01-03 13:41:09</span><br>
		<span class='subject'>'조용히살자'님은 왜 갑자기 '널까고싶은나'처럼 행동하세요?</span>
	</div>
	<div class='article'>
		<span class='boardtype'>자유게시판에 게시글을 작성하였습니다.</span>
		<span class='nal'>2022-12-31 09:56:54</span><br>
		<span class='subject'>꼰대는 나이와 상관없다.</span>
	</div>
	<div class='article'>
		<span class='boardtype'>자유게시판에 게시글을 작성하였습니다.</span>
		<span class='nal'>2022-12-30 09:36:21</span><br>
		<span class='subject'>연말이라서 오늘 14시에 일찍 퇴근하랍니다 ㅎㅎ</span>
	</div> -->
</div>
</body>
</html>