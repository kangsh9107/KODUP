<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<script src="js/mypage_pixel.js"></script>
<meta charset="UTF-8">
<title>mypage_mypixel</title>
</head>
<body>

 
 <div id="mypage_mypixel"> 
 	<span class='mypage_subject_text'>나의 픽셀</span>
 	<div class='mypage_mypixel_management'><br>
 		<div>
			<span class='mypage_mypixel_management_text'>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-diamond" viewBox="0 0 16 16">
				<path d="M7.987 16a1.526 1.526 0 0 1-1.07-.448L.45 9.082a1.531 1.531 0 0 1 0-2.165L6.917.45a1.531 1.531 0 0 1 2.166 0l6.469 6.468A1.526 1.526 0 0 1 16 8.013a1.526 1.526 0 0 1-.448 1.07l-6.47 6.469A1.526 1.526 0 0 1 7.988 16zM7.639 1.17 4.766 4.044 8 7.278l3.234-3.234L8.361 1.17a.51.51 0 0 0-.722 0zM8.722 8l3.234 3.234 2.873-2.873c.2-.2.2-.523 0-.722l-2.873-2.873L8.722 8zM8 8.722l-3.234 3.234 2.873 2.873c.2.2.523.2.722 0l2.873-2.873L8 8.722zM7.278 8 4.044 4.766 1.17 7.639a.511.511 0 0 0 0 .722l2.874 2.873L7.278 8z"/>
				</svg> 픽셀관리
			</span>		
 		</div>
 		<div>
			<span style='display:inline-block; margin-bottom:10px;'>보유픽셀</span>
			<input type='text' size='10' value='${mPixelVo.pixel }'><span>픽셀</span>
			<input type='button' class='btn_mypage_pixel_charge' value='충전'>	
 		</div>
 		<div>
			<span>환전픽셀</span>
			<input type='text' size='10' value='10000'><span>픽셀</span>
			<input type='button' class='btn_mypage_pixel_exchange' value='환전신청'> 		
 		</div>
 	</div>
 	<br>
 	<div class='mypage_mypixel_use'><br>
 		<div class='mypage_mypixel_use_box1'>
			<span class='mypage_mypixel_use_text'>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-diamond" viewBox="0 0 16 16">
				<path d="M7.987 16a1.526 1.526 0 0 1-1.07-.448L.45 9.082a1.531 1.531 0 0 1 0-2.165L6.917.45a1.531 1.531 0 0 1 2.166 0l6.469 6.468A1.526 1.526 0 0 1 16 8.013a1.526 1.526 0 0 1-.448 1.07l-6.47 6.469A1.526 1.526 0 0 1 7.988 16zM7.639 1.17 4.766 4.044 8 7.278l3.234-3.234L8.361 1.17a.51.51 0 0 0-.722 0zM8.722 8l3.234 3.234 2.873-2.873c.2-.2.2-.523 0-.722l-2.873-2.873L8.722 8zM8 8.722l-3.234 3.234 2.873 2.873c.2.2.523.2.722 0l2.873-2.873L8 8.722zM7.278 8 4.044 4.766 1.17 7.639a.511.511 0 0 0 0 .722l2.874 2.873L7.278 8z"/>
				</svg> 픽셀이력
			</span>	 		
			<input type='button' class='btn_mypage_pixel_charge' value='충전'> 
			<input type='button' class='btn_mypage_pixel_exchange' value='환전'> 		
 		</div>
 		<div class='mypage_mypixel_use_box2' style="width:80%;">
 			<ul class="list-group list-group-flush" style="width:100%;">
 				<%-- <c:forEach var="vo" begin="0" end="5"> --%>
 				<li class="list-group-item pixel_box">
 					<span class="mypage_mypixel_date">날짜</span> 
 					<span class="mypage_mypixel_details">상세내역</span> 
 					<span class="mypage_mypixel_pixel">픽셀</span>
 				</li>
 				<li class="list-group-item">
 					<span class="mypage_mypixel_date">2023-01-09</span> 
 					<span class="mypage_mypixel_details" style='color:#BB2649;'>환전신청</span> 
 					<span class="mypage_mypixel_pixel">500</span>
 				</li>
 				<li class="list-group-item">
 					<span class="mypage_mypixel_date">2023-01-07</span> 
 					<span class="mypage_mypixel_details" style='color:#0055CC;'>멘토상담</span> 
 					<span class="mypage_mypixel_pixel">500</span>
 				</li>
 				<li class="list-group-item">
 					<span class="mypage_mypixel_date">2023-01-06</span> 
 					<span class="mypage_mypixel_details" style='color:#0055CC;'>출석체크</span> 
 					<span class="mypage_mypixel_pixel">10</span>
 				</li>
 				<li class="list-group-item">
 					<span class="mypage_mypixel_date">2023-01-04</span> 
 					<span class="mypage_mypixel_details" style='color:#BB2649;'>QnA 게시글작성</span> 
 					<span class="mypage_mypixel_pixel">50</span>
 				</li>
 				<li class="list-group-item">
 					<span class="mypage_mypixel_date">2023-01-01</span> 
 					<span class="mypage_mypixel_details" style='color:#0055CC;'>출석체크</span> 
 					<span class="mypage_mypixel_pixel">10</span>
 				</li>
 				<li class="list-group-item">
 					<span class="mypage_mypixel_date">2022-12-30</span> 
 					<span class="mypage_mypixel_details" style='color:#0055CC;'>충전</span> 
 					<span class="mypage_mypixel_pixel">3000</span>
 				</li>
 				<%-- </c:forEach>	 --%>
 			</ul>
 		</div>
 		
 	</div>
 	<div class='mypage_mypixel_page'>
 		<span class='mypage_mypixel_page_number'> 1 2 3 4 5</span>
 	</div>
 </div>
 
 
 
<!--  그리드 구현은 나중에...
<div class="pixel-grid-container container1">
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
	<div class="pixel-grid-item">100px</div>
</div> -->

</body>
</html>