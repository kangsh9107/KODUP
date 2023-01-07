<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mansearch/mansearch.jsp</title>
<link rel='stylesheet' href='css/mansearch.css'>
<script defer src="js/mansearch.js"></script>
<!-- <style>
div.button {
  position:absolute;
  background: #3D4C53;
  left:50;
  top:50;
  width : 200px;
  height : 50px;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
}
div.btnTwo {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #26A69A;
  left : -250px;
  transition : .3s;
  font-size:30px;
}
p.btnText {
  color : white;
  transition : .3s;
}
p.btnText2 {
  margin-top : 50px;
  margin-right : -130px;
  color : #FFF;
}
div.button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/
  left: -130px;
}
div.button:hover .btnText{ /*When hovering over .button change .btnText*/
  margin-left : 65px;
}
div.button:active { /*Clicked and held*/
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}

</style> -->
</head>
<body>
<!--  <div class="button">
    <p class="btnText">돌아가기</p>
     <div class="btnTwo">
      <p class="btnText2">⬅</p>
    </div>
 </div> -->
	<div class='col-md-8 mansearch_title' style="z-index:-10;">
		<img src="/images/mansearch_logo.png" style="width:110px; height:100px; float:right; margin-right:5px; margin-top:-25px; display:inline-block; z-index:100;">
		<dl>
			<dt style="margin-top: 10px; margin-left:5px;">구인게시판</dt>
			<dd>내게 어울리는 채용 공고를 찾는 공간입니다.</dd>
		</dl>
	</div>
	<div class="mansearch_findstr_zone">
		<input type='text' class='form-control' /> 
		<input type="button" class="img-button" />
	</div>
	<div>
		<button class="mansearch_insert">구인등록</button>
		<div class="dropdown" style="float:right;">
	  		<button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border:1px solid #000">검색필터</button>
	  		<div class="dropdown-menu dropdown_row">
	  			<div class="dropdown-content dropdown_content">
					<select class="form-select form_select" size="5">
  						<option value="position">포지션</option>
  						<option value="location">지역</option>
  						<option value="pay">급여</option>
  						<option value="required_career">경력</option>
  						<option value="education_level">학력</option>
					</select>
					<select class="form-select form_select" size="5">
  						<option value="">소분류</option>
  						<option value="">소분류</option>
  						<option value="">소분류</option>
  						<option value="">소분류</option>
  						<option value="">소분류</option>
					</select>					 
	  			</div>
	  		</div>
		</div>
	</div>
	<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
		<c:forEach var="vo" begin="0" end="4">
			<li class="list-group-item ListGroupItem" style="padding: 10px 0 10px 0;">
				<img id="index_profile" src="images/index_default.png" style="vertical-align:middle;">
				<span id="index_corpname">(주)뻥이요</span>
				<div id="task">
					SI
				</div>
				<div id="job_index">
					서비스/인터넷
				</div>
				<div style="float: right;">
					<span id="work_start">2023.01.25(근무시작일)</span>
					<span id="deadline">마감 ?일전</span>
				</div><br/>
				<a href="#" class="text-decoration-none">
					<span id="index_doc" class="index_doc">백엔드,팀원 | 제대로 튀겨드립니다. 신입도 3년차부터! 가 족같은 분위기에서 일하실 분 구합니다 ^_^</span>
				</a>
				<div>
					<span id="corp_location">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  							<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
  							<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
						</svg>
						지방 출장
					</span>
					<span id="pay">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database" viewBox="0 0 16 16">
  							<path d="M4.318 2.687C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4c0-.374.356-.875 1.318-1.313ZM13 5.698V7c0 .374-.356.875-1.318 1.313C10.766 8.729 9.464 9 8 9s-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777A4.92 4.92 0 0 0 13 5.698ZM14 4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16s3.022-.289 4.096-.777C13.125 14.755 14 14.007 14 13V4Zm-1 4.698V10c0 .374-.356.875-1.318 1.313C10.766 11.729 9.464 12 8 12s-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10s3.022-.289 4.096-.777A4.92 4.92 0 0 0 13 8.698Zm0 3V13c0 .374-.356.875-1.318 1.313C10.766 14.729 9.464 15 8 15s-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13s3.022-.289 4.096-.777c.324-.147.633-.323.904-.525Z"/>
						</svg>
						200만원~300만원
					</span>
					<span id="required_carrer">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-data" viewBox="0 0 16 16">
  							<path d="M4 11a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1zm6-4a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7zM7 9a1 1 0 0 1 2 0v3a1 1 0 1 1-2 0V9z"/>
  							<path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
  							<path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
						</svg>
						경력 무관
					</span>
					<span id="education_level">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mortarboard" viewBox="0 0 16 16">
  							<path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917l-7.5-3.5ZM8 8.46 1.758 5.965 8 3.052l6.242 2.913L8 8.46Z"/>
  							<path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466 4.176 9.032Zm-.068 1.873.22-.748 3.496 1.311a.5.5 0 0 0 .352 0l3.496-1.311.22.748L8 12.46l-3.892-1.556Z"/>
						</svg>
						대학원 졸업 이상
					</span>
					<span id="work_type">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-buildings" viewBox="0 0 16 16">
  							<path d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022ZM6 8.694 1 10.36V15h5V8.694ZM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15Z"/>
  							<path d="M2 11h1v1H2v-1Zm2 0h1v1H4v-1Zm-2 2h1v1H2v-1Zm2 0h1v1H4v-1Zm4-4h1v1H8V9Zm2 0h1v1h-1V9Zm-2 2h1v1H8v-1Zm2 0h1v1h-1v-1Zm2-2h1v1h-1V9Zm0 2h1v1h-1v-1ZM8 7h1v1H8V7Zm2 0h1v1h-1V7Zm2 0h1v1h-1V7ZM8 5h1v1H8V5Zm2 0h1v1h-1V5Zm2 0h1v1h-1V5Zm0-2h1v1h-1V3Z"/>
						</svg>
						출장근무
					</span>
					<div style="float: right;">
						<span id="required_skill">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-braces" viewBox="0 0 16 16">
  								<path d="M2.114 8.063V7.9c1.005-.102 1.497-.615 1.497-1.6V4.503c0-1.094.39-1.538 1.354-1.538h.273V2h-.376C3.25 2 2.49 2.759 2.49 4.352v1.524c0 1.094-.376 1.456-1.49 1.456v1.299c1.114 0 1.49.362 1.49 1.456v1.524c0 1.593.759 2.352 2.372 2.352h.376v-.964h-.273c-.964 0-1.354-.444-1.354-1.538V9.663c0-.984-.492-1.497-1.497-1.6zM13.886 7.9v.163c-1.005.103-1.497.616-1.497 1.6v1.798c0 1.094-.39 1.538-1.354 1.538h-.273v.964h.376c1.613 0 2.372-.759 2.372-2.352v-1.524c0-1.094.376-1.456 1.49-1.456V7.332c-1.114 0-1.49-.362-1.49-1.456V4.352C13.51 2.759 12.75 2 11.138 2h-.376v.964h.273c.964 0 1.354.444 1.354 1.538V6.3c0 .984.492 1.497 1.497 1.6z"/>
							</svg>
							java, jsp, springboot, mysql
						</span>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	<div class='com-md-8 btnZone' style="border-top:1px solid #6b7280; padding:10px; text-align:center;">
		<c:forEach var='i' begin='1' end='5'>
        	<button type='button' class='btnMove'>${i }</button>
      </c:forEach>
	</div>
</body>
</html>