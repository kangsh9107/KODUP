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
	<c:forEach items="${listHotTag }" var="htVo">
		<a href="#" class="text-decoration-none" style="float: left;"><span>#JAVA</span></a>
		<span style="float: right; color: #bb2649;">53</span>
		<br/><br/>
	</c:forEach>
</body>
</html>