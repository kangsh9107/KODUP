<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<svg width='600' height='200'>
		<filter id='money'>
    <feMorphology in='SourceGraphic' operator='dilate' radius='2' result='expand'/>

    <feOffset in='expand' dx='1' dy='1' result='shadow_1'/>
    <feOffset in='expand' dx='2' dy='2' result='shadow_2'/>
    <feOffset in='expand' dx='3' dy='3' result='shadow_3'/>
    <feOffset in='expand' dx='4' dy='4' result='shadow_4'/>
    <feOffset in='expand' dx='5' dy='5' result='shadow_5'/>
    <feOffset in='expand' dx='6' dy='6' result='shadow_6'/>
    <feOffset in='expand' dx='7' dy='7' result='shadow_7'/>

    <feMerge result='shadow'>
      <feMergeNode in='expand'/>
      <feMergeNode in='shadow_1'/>
      <feMergeNode in='shadow_2'/>
      <feMergeNode in='shadow_3'/>
      <feMergeNode in='shadow_4'/>
      <feMergeNode in='shadow_5'/>
      <feMergeNode in='shadow_6'/>
      <feMergeNode in='shadow_7'/>
    </feMerge>

    <feFlood flood-color='#ebe7e0'/>
    <feComposite in2='shadow' operator='in' result='shadow'/>

    <feMorphology in='shadow' operator='dilate' radius='1' result='border'/>
    <feFlood flood-color='#35322a' result='border_color'/>
    <feComposite in2='border' operator='in' result='border'/>

    <feOffset in='border' dx='1' dy='1' result='secondShadow_1'/>
    <feOffset in='border' dx='2' dy='2' result='secondShadow_2'/>
    <feOffset in='border' dx='3' dy='3' result='secondShadow_3'/>
    <feOffset in='border' dx='4' dy='4' result='secondShadow_4'/>
    <feOffset in='border' dx='5' dy='5' result='secondShadow_5'/>
    <feOffset in='border' dx='6' dy='6' result='secondShadow_6'/>
    <feOffset in='border' dx='7' dy='7' result='secondShadow_7'/>
    <feOffset in='border' dx='8' dy='8' result='secondShadow_8'/>
    <feOffset in='border' dx='9' dy='9' result='secondShadow_9'/>
    <feOffset in='border' dx='10' dy='10' result='secondShadow_10'/>
    <feOffset in='border' dx='11' dy='11' result='secondShadow_11'/>

    <feMerge result='secondShadow'>
      <feMergeNode in='border'/>
      <feMergeNode in='secondShadow_1'/>
      <feMergeNode in='secondShadow_2'/>
      <feMergeNode in='secondShadow_3'/>
      <feMergeNode in='secondShadow_4'/>
      <feMergeNode in='secondShadow_5'/>
      <feMergeNode in='secondShadow_6'/>
      <feMergeNode in='secondShadow_7'/>
      <feMergeNode in='secondShadow_8'/>
      <feMergeNode in='secondShadow_9'/>
      <feMergeNode in='secondShadow_10'/>
      <feMergeNode in='secondShadow_11'/>
    </feMerge>

    <feImage x='0' y='0' width='600' height='200' xlink:href='https://s3-us-west-2.amazonaws.com/s.cdpn.io/78779/stripes.svg'/>
    <feComposite in2='secondShadow' operator='in' result='secondShadow'/>
	<
    <feMerge>
      <feMergeNode in='secondShadow'/>
      <feMergeNode in='border'/>
      <feMergeNode in='shadow'/>
      <feMergeNode in='SourceGraphic'/>
    </feMerge>
  </filter>

  <text dominant-baseline='middle' text-anchor='middle' x='50%' y='50%'>
    나의픽셀
  </text>
</svg>
<!-- 위 코드 축약가능 (단, 캡쳐이미지로 화질이 떨어짐)
<div id="mypage_mypixel_subjectname">
	<img src="/images/mypage_mypixel_subjectname.png" style="width:600px; height:200px;">
</div>
 -->
 
 <div id="mypage_mypixel">
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
			<input type='text' size='10' value='45'><span>픽셀</span>
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
				</svg> 픽셀 충전/환전 내역
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