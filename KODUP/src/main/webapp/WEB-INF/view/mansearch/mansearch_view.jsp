<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='css/mansearch.css'>
<script defer src='js/mansearch.js'></script>
<meta charset="UTF-8">
<title>mansearch_view.jsp</title>
<style>
li {
	list-style: none;
}
</style>
</head>
<body>
	<form class='mansearch_frm' method='post'>
		<span style="display: inline-block; margin-bottom: 10px;"> <img
			src="/images/mansearch_images/${mbVo.corp_logo }"
			class="view_corp_logo"> <label>${mbVo.corp_name }</label>
		</span><br />
		<input type='hidden' name='sno' value='${mbVo.sno }'>
		<input type='hidden' name='id' class='member_id' value='${mbVo.id }' />
		<input type='hidden' name='mansearch_sno' value="${mbVo.mansearch_sno }" />
		<input type='hidden' name='main_task' value='${mbVo.main_task }' />
		<input type='hidden' name='sub_task' value='${mbVo.sub_task }' />
		<input type='hidden' name='subject' value='${mbVo.subject }' />
		<input type='hidden' name='deadline' value='${mbVo.deadline }' />
		<input type='hidden' name='work_start' value='${mbVo.work_start }' />
		<input type='hidden' name='pay' value='${mbVo.pay }' />
		<input type='hidden' name='corp_location' value='${mbVo.corp_location }' />
		<input type='hidden' name='position' value='${mbVo.position }' />
		<input type='hidden' name='job_type' value='${mbVo.job_type }' />
		<input type='hidden' name='required_career' value='${mbVo.required_career }' />
		<input type='hidden' name='education_level' value='${mbVo.education_level }' />
		<input type='hidden' name='work_type' value='${mbVo.work_type }' />
		<input type='hidden' name='pay_date' value='${mbVo.pay_date }' />
		<input type='hidden' name='required_skill' value='${mbVo.required_skill }' />
		<input type='hidden' name='doc' value='${mbVo.doc }' />
		<input type='hidden' name='pixel' class="pixel" value='${mbVo.pixel }' />
		<input type='hidden' name='premium_review_sno' value=''/>
		<input type='hidden' name='writer_id' value=''/>
		<input type='hidden' name='buyer_id' class='member_id' value='${sessionId }' />
		<textarea name="review" style="display:none;"> </textarea>		
		<div id="task" style="margin-bottom: 5px;">${mbVo.main_task }</div>
		<div id="job_index" style="margin-bottom: 5px;">${mbVo.sub_task }</div>
		<div class="container text-center">
			<div class="row justify-content-md-center">
				<div class="col mansearch_view_subject">
					<span style="font-size: 1.8rem; padding: 0; margin: 0;"> <label><strong>${mbVo.subject }</strong></label>
					</span>
					<br/>
					<span class="deadline" style='font-weight: bold;'> 
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						 fill="currentColor" class="bi bi-calendar2" viewBox="0 0 16 16">
			  			 <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
			  			 <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
					</svg> <span class="deadline_count">마감일 ${mbVo.deadline }</span>

					</span>
					<c:if test="${mbVo.id eq sessionId }">
						<button type='button' class='mansearch_deleteR'
							style="float: right; margin: 5px;">삭제</button>
						<button type='button' class='mansearch_update'
							style="float: right; margin: 5px;">수정</button>
					</c:if>
				</div>
			</div>
		</div>
		<div class="container text-left"
			style="margin-top: 90px; padding-left: 0;">
			<div class="row">
				<div class="col-sm datepaylocation_area">
					<dl>
						<dt>근무시작일</dt>
						<dd>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								 fill="currentColor" class="bi bi-calendar2" viewBox="0 0 16 16">
			  					<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
			  					<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
							</svg>
							${mbVo.work_start }
						</dd>
					</dl>
				</div>
				<div class="col-sm datepaylocation_area">
					<dl>
						<dt>급여</dt>
						<dd>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								 fill="currentColor" class="bi bi-database" viewBox="0 0 16 16">
	  						<path d="M4.318 2.687C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4c0-.374.356-.875 1.318-1.313ZM13 5.698V7c0 .374-.356.875-1.318 1.313C10.766 8.729 9.464 9 8 9s-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777A4.92 4.92 0 0 0 13 5.698ZM14 4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16s3.022-.289 4.096-.777C13.125 14.755 14 14.007 14 13V4Zm-1 4.698V10c0 .374-.356.875-1.318 1.313C10.766 11.729 9.464 12 8 12s-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10s3.022-.289 4.096-.777A4.92 4.92 0 0 0 13 8.698Zm0 3V13c0 .374-.356.875-1.318 1.313C10.766 14.729 9.464 15 8 15s-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13s3.022-.289 4.096-.777c.324-.147.633-.323.904-.525Z" />
						</svg>${mbVo.pay }만원
						</dd>
					</dl>
				</div>
				<div class="col-sm datepaylocation_area">
					<dl>
						<dt>근무지역</dt>
						<dd>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								 fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
	  						<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
	  						<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						</svg>${mbVo.corp_location }
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="container text-right mansearch_view_element">
			<div class="row">
				<div class="col-sm element_left">
					<div class='element_left_title'>포지션</div>
					<div class='element_left_doc'>${mbVo.position }</div>
				</div>
				<div class="col-sm element_right">
					<div class='element_right_title'>계약형태</div>
					<div class='element_right_doc'>${mbVo.job_type }</div>
				</div>
			</div>
		</div>
		<div class="container text-right mansearch_view_element">
			<div class="row">
				<div class="col-sm element_left">
					<div class='element_left_title'>필요경력</div>
					<div class='element_left_doc'>${mbVo.required_career }</div>
				</div>
				<div class="col-sm element_right">
					<div class='element_right_title'>학력사항</div>
					<div class='element_right_doc'>${mbVo.education_level }</div>
				</div>
			</div>
		</div>
		<div class="container text-right mansearch_view_element">
			<div class="row">
				<div class="col-sm element_left">
					<div class='element_left_title'>근무방식</div>
					<div class='element_left_doc'>${mbVo.work_type }</div>
				</div>
				<div class="col-sm element_right">
					<div class='element_right_title'>급여지급일</div>
					<div class='element_right_doc'>${mbVo.pay_date }</div>
				</div>
			</div>
		</div>
		<div class="container text-right mansearch_view_element">
			<div class="row">
				<div class="col-sm element_left">
					<div class='element_left_title'>필수스킬</div>
					<div class='element_left_doc'>${mbVo.required_skill }</div>
				</div>
				<div class="col-sm element_right" style="border: none;">
					<div class='element_right_title'></div>
					<div class='element_right_doc'></div>
				</div>
			</div>
		</div>
		<br/>
		<label style="font-weight: bold; font-size: 0.9rem; margin-bottom: 10px; margin-top: -10px;">프로젝트
			소개
		</label>
		<div class="mansearch_view_doc">
			<pre>
	<textarea name="doc" style="display: none;">${mbVo.doc }</textarea>
	${mbVo.doc }
	</pre>
		</div>
	</form>
	<div class="container text-center mansearch_view_manager">
		<div class="row" style="vertical-align: middle;">
			<div class="col-md-2 col-sm-12">담당자</div>
			<div class="col-md-2 col-sm-12">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					 fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
			</svg>
				${mbVo.manager_name }
			</div>
			<div class="col-md-4 col-sm-12">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					 fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
  				<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
			</svg>
				${mbVo.manager_phone }
			</div>
			<div class="col-md-4 col-sm-12">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					 fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
	  			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
			</svg>
				${mbVo.manager_email }
			</div>
		</div>
	</div>
	<div class="container text-left premium_review_title">
		<div class="row">
			<div class="col">
				<label>
					<h5>
						혹시 이 기업의 <strong><font color="#bb2642">프리미엄 리뷰</font></strong>
						가 궁금하신가요?
					</h5>
				</label>
				<div id="pre_review_explane">
					<div style="cursor: pointer;">
						<svg style="vertical-align: baseline;"
							 xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							 fill="currentColor" class="bi bi-question-circle"
							 viewBox="0 0 16 16">
  							<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  							<path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
						</svg>
						<span class=arrow>프리미엄 리뷰란?</span>
						<p class="arrow_box">해당 기업에서 일하는 직원의 생생한 리뷰입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="container text-left" style="margin-bottom:70px;">
		<div class="row">
			<c:if test="${sessionId ne null }">
				<div class="col-1" style="padding: 0;">
					<span> 
						<img id="premium_review_writer_icon" src="upload/${mbVo.profile_img }" style="width: 42px; height: 42px; margin-top: 19px;">
					</span>
				</div>
				<div class="col-11">
					<div class="form-floating">
						<textarea class="form-control premium_review_doc" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
						<label for="floatingTextarea2">경력증명서 인증 후 리뷰를 작성할 수 있습니다.</label>
					</div>
				</div>
			</c:if>
		</div>
		<c:if test="${sessionId ne null }">
			<button class="premium_review_insert" style="float: right; margin-top: 15px;">
				리뷰등록
			</button>
		</c:if>
	</div>
	<br />
	<br />
	<c:forEach var="vo" items="${premiumlist }" varStatus="status">
		<c:if test="${mbVo.mansearch_sno eq vo.pr_mansearch_sno }">
			<form class="premium_frm">
				<div class="container" style="padding-left: 0;">
					<div class="row">
						<div class="col premium_review_wrap">
							<div class="premium_review_writer">
								<span>
									<img id="premium_review_writer_icon" src="images/index_default.png">
								</span>
								<span>|</span>
								<span>
									<label>${vo.writer_id } <c:if test="${vo.writer_id eq sessionId }"> <strong>[작성자]</strong></c:if></label>
								</span>
							</div>
							<div class="premium_review_doc_wrap">
								<div class="premium_review_doc">
									<c:choose>
										<c:when test="${vo.status == 1 || vo.writer_id eq sessionId}">									
											${vo.review }
										</c:when>
										<c:otherwise>
											<img src="/images/review_blur.png" class="blur">
										</c:otherwise>	
									</c:choose>
									<input type='hidden' name='premium_review_sno' class='premium_review_sno' value='${vo.premium_review_sno }'>
									<input type='hidden' name='writer_id' class='writer_id' value='${vo.writer_id }'/>
									<input type='hidden' name='buyer_id' class='member_id' value='${sessionId }' />
									<input type='hidden' name='mansearch_sno' value="${mbVo.mansearch_sno }" />
								</div>
								<div class="doc_blind_wrap">
									<c:if test="${sessionId ne null && vo.status==0 && vo.writer_id ne sessionId}">
										<button type="button" class="premium_review_payment"
											 onclick='premiumView(this.form)'>
											프리미엄 리뷰 보기
										</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal -->
				<!--<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">프리미엄
									리뷰 결제</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close">
								</button>
							</div>
							 <div class="modal-body">정말 200픽셀을 사용하여 프리미엄 리뷰를 보시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									    data-bs-dismiss="modal">아니오
								</button>
								<button type="button" class="btn btn-primary review_payment"
									    onclick='premiumView(this.form)'>네, 보겠습니다.
								</button>
							</div> 
						</div>
					</div>
				</div>
				-->
			</form>
		</c:if>
	</c:forEach>
</body>
</html>