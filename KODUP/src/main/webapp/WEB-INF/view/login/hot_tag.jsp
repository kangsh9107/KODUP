<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/hot_tag.jsp</title>
</head>
<body>
	<span style="font-weight: 600;">#인기 태그</span>
	<hr/>
	<c:forEach items="${listHotTagTemp }" var="htVo">
		<label href="#" class="text-decoration-none" style="float: left;"><span>${htVo.hotTag }</span></label>
		<span style="float: right; color: #bb2649;">${htVo.tagCount }</span>
		<br/><br/>
	</c:forEach>
</body>
</html>