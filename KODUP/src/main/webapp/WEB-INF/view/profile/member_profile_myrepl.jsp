<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/profile.css">
<title>profile/member_profile_repl.jsp</title>
</head>
<body>
<div class='myarticle_articleWrapper'>
	<c:forEach var='pfVo' items='${list }'>
			<form class='article'>
				<span class='boardtype'>${pfVo.boardtype}에 게시글을 작성하였습니다.</span>
				<span class='nal'>${pfVo.repl_nal }</span><br>
				<span class='subject'>${pfVo.repl_doc }</span>
				<input type='hidden' class='sno_hidden' value="${pfVo.sno }">
				<input type='hidden' class='boardtype_hidden' value="${pfVo.boardtype}">
				<input type='hidden'class='nal_hidden' value="${pfVo.repl_nal }">
				<input type='hidden'class='subject_hidden' value="${pfVo.repl_doc}">
			</form>
	</c:forEach>
</div>
</body>
</html>