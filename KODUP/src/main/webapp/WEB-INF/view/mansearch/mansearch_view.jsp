<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='css/mansearch.css'>
<script src='js/mansearch.js'></script>
<meta charset="UTF-8">
<title>mansearch_view.jsp</title>
<style>
li {
	list-style: none;
}
</style>
</head>
<body>
<span style="display:inline-block; margin-bottom:10px;">
	<img src="/images/mansearch_view_corp_logo.png" class="view_corp_logo">
	<label>캐빈시스템</label>
</span><br/>
<div id="task" style="margin-bottom:5px;">SM</div>
<div id="job_index" style="margin-bottom:5px;">금융</div>
<div class="container text-center">
	<div class="row justify-content-md-center">
		<div class="col mansearch_view_subject">
			<span style="font-size:1.8rem;">
				<label><strong>★중급★ 카드사 시스템 유지보수 (API연계)</strong></label>
			</span><br/>
			<span class="deadline">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar2" viewBox="0 0 16 16">
		  			<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/>
		  			<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z"/>
				</svg>
				2023.01.16
			</span>
			<span class="deadline_count">마감 ?일전</span>
			<button class='mansearch_delete' style="float:right; margin:5px;">삭제</button>
			<button class='mansearch_update' style="float:right; margin:5px;">수정</button>
		</div>
	</div>
</div>
<div class="container text-left"style="margin-top:90px;">
	<div class="row">
		<div class="col-sm datepaylocation_area">
			<dl>
				<dt>근무시작일</dt>
				<dd>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar2" viewBox="0 0 16 16">
		  				<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/>
		  				<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z"/>
					</svg>2023-01-25
				</dd>
	      	</dl>	
    	</div>
    	<div class="col-sm datepaylocation_area">
			<dl>
				<dt>급여</dt>
				<dd>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database" viewBox="0 0 16 16">
  						<path d="M4.318 2.687C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4c0-.374.356-.875 1.318-1.313ZM13 5.698V7c0 .374-.356.875-1.318 1.313C10.766 8.729 9.464 9 8 9s-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777A4.92 4.92 0 0 0 13 5.698ZM14 4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16s3.022-.289 4.096-.777C13.125 14.755 14 14.007 14 13V4Zm-1 4.698V10c0 .374-.356.875-1.318 1.313C10.766 11.729 9.464 12 8 12s-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10s3.022-.289 4.096-.777A4.92 4.92 0 0 0 13 8.698Zm0 3V13c0 .374-.356.875-1.318 1.313C10.766 14.729 9.464 15 8 15s-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13s3.022-.289 4.096-.777c.324-.147.633-.323.904-.525Z"/>
					</svg>600만원
				</dd>
	      	</dl>
    	</div>	
    	<div class="col-sm datepaylocation_area">
			<dl>
				<dt>근무지역</dt>
				<dd>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  						<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
  						<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
					</svg>서울 중구 을지로4가
				</dd>
	      	</dl>
    	</div>
  </div>
</div>
<div class="container text-right mansearch_view_element">
  	<div class="row">
    	<div class="col-sm element_left">
      		<div class='element_left_title'>
      			포지션
      		</div>
      		<div class='element_left_doc'>
      			프론트엔드 개발, 팀원
      		</div>      		
    	</div>
    	<div class="col-sm element_right">
      		<div class='element_right_title'>
      			계약형태
      		</div>
      		<div class='element_right_doc'>
      			계약직
      		</div>      		
    	</div>
	</div>
</div>
<div class="container text-right mansearch_view_element">
  	<div class="row">
    	<div class="col-sm element_left">
      		<div class='element_left_title'>
      			필요경력
      		</div>
      		<div class='element_left_doc'>
      			3년 이상 ~ 무관
      		</div>
    	</div>
    	<div class="col-sm element_right">
      		<div class='element_right_title'>
      			학력사항
      		</div>
      		<div class='element_right_doc'>
      			무관
      		</div>
    	</div>
	</div>
</div>
<div class="container text-right mansearch_view_element">
  	<div class="row">
    	<div class="col-sm element_left">
      		<div class='element_left_title'>
      			근무방식
      		</div>
			<div class='element_left_doc'>
      			상근
      		</div>      		
    	</div>
    	<div class="col-sm element_right">
      		<div class='element_right_title'>
      			급여지급일
      		</div>
      		<div class='element_right_doc'>
      			매월 16일
      		</div>      		
    	</div>
	</div>
</div>
<div class="container text-right mansearch_view_element">
  	<div class="row">
    	<div class="col-sm element_left">
      		<div class='element_left_title'>
      			필수스킬
      		</div>
			<div class='element_left_doc'>
      			java, spring, Linux, Oracle
      		</div>      		
    	</div>
    	<div class="col-sm element_right" style="border:none;">
      		<div class='element_right_title'>
      		
      		</div>
      		<div class='element_right_doc'>
      		
      		</div>      		
    	</div>
	</div>
</div>
<br/>
<div class="mansearch_view_doc">
<label style="font-weight:bold; font-size:0.9rem; margin-bottom:10px; margin-top:-10px;">프로젝트 소개</label>
<pre>
BC카드 시스템 유지보수 (API연계)

안녕하세요.

캐빈시스템 입니다.

구인중인 프로젝트 정보 드리니 많은 지원 부탁드립니다.



[상세정보]

- 프로젝트 : BC카드 시스템 유지보수 (API연계)

- 스킬 : java, spring, Linux, Oracle

- 우대 : EAI / MCI / OpenAPI 등 연계시스템 개발 또는 운영 경험

- 등급 : 중급

- 투입일 : 즉시

- 투입기간 : 장기근무

- 장소 : 을지로



[참고사항]

1. 프로젝트 관련 문의사항은 전화 또는 메일로 보내 주시면 가능한 빠른 시간 내에 답변 드리고 있습니다.

2. 단가는 가능한 맞춰 드릴수 있도록 노력하고 있으니 상단 급여 금액과 관계없이 지원 메일에 희망 단가 기재 부탁드립니다.

3. 지원 시 아래 메일로 경력프로필(스킬인벤토리 포함) 제출 부탁드리고 빠른 진행을 위해 프로젝트 명 및 연락처 기입 부탁드립니다.

4. 지원해 주시면 확인 후 빠른시간 내 개별 전화 연락 드립니다.



즐거운 하루 되세요.

감사합니다.
</pre>
</div>
<div class="container text-center mansearch_view_manager">
	<div class="row" style="vertical-align:middle;">
    	<div class="col-md-2 col-sm-12">담당자</div>
    	<div class="col-md-2 col-sm-12">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
			</svg> 농담곰
		</div>
    	<div class="col-md-4 col-sm-12">
    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
  				<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
			</svg> 010-1234-5678
		</div>
	   <div class="col-md-4 col-sm-12">
	   		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
	  			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
			</svg> info@kodup.com
	   </div>
	</div>
</div>
<div class="container text-left premium_review_title">
	<div class="row">
		<div class="col">
      		<label><h5>혹시 이 기업의 <strong><font color="#bb2642">프리미엄 리뷰</font></strong>가 궁금하신가요?</h5></label>
      		<div id="pre_review_explane">
      			<div style="cursor:pointer;">
       				<svg style="vertical-align:baseline;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle" viewBox="0 0 16 16">
  						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  						<path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
					</svg>
       				<span class=arrow>프리미엄 리뷰란?</span>
        			<p class="arrow_box">해당 기업에서 일하는 직원의 생생한 리뷰입니다.</p>
      			</div>
    		</div>     		
    	</div>
	</div>
</div>
<br/><br/>
<div class="container">
	<div class="row">
		<div class="col premium_review_wrap">
			<div class="premium_review_writer">
				<span>
					<img id="premium_review_writer_icon" src="images/index_default.png"> 
				</span>
				<span>|</span>
				<span>
					<label>a001</label>
				</span>
				<span>|</span>
				<span>
					<label>2023-01-09</label>
				</span>
			</div>
			<div class="premium_review_doc_wrap">
				<div class="premium_review_doc">
					원질이 별과 피에 이것은 구하기 불어 그것은 같으며, 위하여서. 따뜻한 실현에 따뜻한 이상, 길을 인간의 얼마나 보이는 것은 그리하였는가? 사는가 무엇을 무엇이 봄바람이다. 풍부하게 것은 이상 봄날의 못할 많이 같으며, 뼈 인생에 교향악이다. 이것이야말로 위하여서, 이는 피다. 하였으며, 별과 밥을 관현악이며, 생생하며, 꽃이 사막이다. 이성은 무한한 우리의 고동을 내는 가슴이 봄바람이다. 하여도 때에, 그들의 같이 평화스러운 귀는 그들을 청춘의 있는가? 간에 심장의 오직 장식하는 인간은 때까지 따뜻한 교향악이다.
	
					꽃 속잎나고, 때까지 피는 착목한는 같으며, 속에 산야에 영락과 교향악이다. 얼마나 예수는 갑 내는 아니더면, 이성은 것이 설산에서 끓는다. 있으며, 이상은 착목한는 만물은 창공에 아름다우냐? 꾸며 황금시대의 싹이 찾아다녀도, 약동하다. 황금시대의 주는 꾸며 방황하였으며, 싸인 온갖 이상이 칼이다. 피는 우는 인간의 심장의 싸인 청춘의 희망의 힘있다. 어디 굳세게 실로 동산에는 새가 천고에 싸인 열락의 것이다. 그림자는 풍부하게 봄날의 것이다. 착목한는 피가 소금이라 광야에서 이것이다.
	
					얼음 스며들어 열락의 용감하고 곳으로 대고, 살 것이다. 찬미를 얼마나 귀는 있는가? 품으며, 속잎나고, 구하지 사는가 이것이야말로 불러 교향악이다. 풀밭에 같은 그들은 돋고, 사는가 창공에 간에 밥을 앞이 봄바람이다. 이상은 트고, 청춘에서만 튼튼하며, 피다. 심장의 행복스럽고 그들의 희망의 낙원을 충분히 발휘하기 철환하였는가? 너의 피어나는 인생을 생의 있음으로써 뛰노는 아름다우냐? 날카로우나 들어 보내는 청춘 보라. 얼마나 생생하며, 이상을 인간의 실로 거선의 능히 싶이 보라.
				</div>
				<div class="doc_blind_wrap">
					<button class="premium_review_payment">픽셀을 사용하여 프리미엄 리뷰 보기</button>
				</div>
			</div>
		</div>	
	</div>
</div>
</body>
</html>