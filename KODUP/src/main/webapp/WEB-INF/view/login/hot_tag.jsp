<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script defer src="js/common_board.js"></script>
<title>login/hot_tag.jsp</title>
</head>
<body>
	<!-- HOT TAG -->
	<span style="font-weight: 600;">#인기 태그</span>
	<hr/>
	<c:forEach items="${listHotTagTemp }" var="htVo">
		<a href="#" onclick="runHashtagIndex('${htVo.hotTag }')" class="text-decoration-none hottag" style="float: left;"><span>${htVo.hotTag }</span></a>
		<span style="float: right; color: #bb2649;">${htVo.tagCount }</span>
		<br/><br/>
	</c:forEach>
</body>
</html>