<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/qna.js"></script>
<title>qna/qna_view.jsp</title>
</head>
<body>
<form id="qna_view">
	sno<input type='text' id="sno" name='sno' size="2"value='${qbVo.sno}' /><!-- style="visibility: hidden;" -->
	board_delete<input type='text' id="" name='board_delete' size="2" value='${qbVo.board_delete}'/>
	repl_sno<input type='text' id="" name='repl_sno' size="2" value='0'/>
	nowPage<input type='text' id="" name='nowPage' value='0'/>
	
	<!-- boardtype  /  horsehead -->
	<div id="qna_view_horsehead">
		<a href="#" class="btnBoardtype">Q&A</a><!-- ${qbVo.boardtype} -->
		/
		<a>${qbVo.qna_horsehead}</a>
	</div>
	
	<!-- 삭제된글에경우 board_delete에 따라 출력되는 화면이달라짐 -->
	<c:choose>
		<c:when test="${qbVo.board_delete eq 0}">
			<!-- 본문 헤더(작성자사진,닉네임,작성일,조회수,보상픽셀) -->
			<div id="qna_view_header"  >
				<span id="qna_view_header_section1"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
					<img id="qna_view_header_profileimage_file" 
					style="width:40px; height:40px; vertical-align: top; border-radius:50%;"
					src="images/${qbVo.profile_img}" >
				</span>
				<!-- 본문 조회수,작성시간 -->
				<div  id="qna_view_header_section2" style="display:inline-block; vertical-align: top;">
					<div id="qna_view_profile_nickname">${qbVo.nickname}</div>
					<span>${qbVo.nal}
					<img src="images/index_viewcount.png" 
					style="width:20px; height:15px; margin-top: -4px; margin-right:-4px;">
					${qbVo.viewcount }</span>
					<span>채택픽셀:${qbVo.qna_pixel_reward}</span>
				</div>	
			</div>
		
			<!-- 본문 글제목 -->
			<div id="qna_view_subject">
				<span style="font-size:1.5rem; font-weight:600;">
					${qbVo.subject}
				</span>
			</div>
			
			<!-- 본문 글내용 --> <!--  -->
			<span id="qna_view_doc" style="font-size:15px; display:inline-block; min-height:300px; margin-top:20px;">
				${qbVo.doc}
			</span>
			
			<!-- 추천,비추천 -->
			<div>
				<div style="text-align:right;">
					<button id="btn_viewpage_thumbup" type="button" style="display:inline-block; text-align:right; background-color:#fff; border:0;" ><img src="images/추천엄지.png"></button>
						<span id="thumb" style="font-weight:600px;" >${qbVo.thumbup-qbVo.thumbdown}</span>
					<button id="btn_viewpage_thumbdown" type="button" style="display:inline-block; text-align:right; background-color:#fff; border:0;" ><img src="images/비추천엄지.png"></button>
				</div>
			</div>
			<!-- 본문 해시태그 --><!-- 해당해시태그를 누를경우 findStr로 해당 태그가 들어간 글들을 셀렉트 -->
				
			<div id="qna_view_hashtag">
				<c:forEach var='vo' items='${qbVo.hashtaglist}'>
					<span>
						<a href="#" onclick="qna_view_findHashtag(${vo.hashtag})">${vo.hashtag}</a>
					</span>
				</c:forEach>
			</div>
			<!-- 본문 btnzone -->
			<div id="qna_view_btnzone" style="margin-top:30px;" >
				<input type="button" class="btnUpdate qna_view_originalBtn" style="vertical-align:top;"value="수정">
				<input type="button" class="btnDeleteR  qna_view_originalBtn"style="vertical-align:top;" value="삭제">
				<input type="button" class="btnList  qna_view_originalBtn" style="vertical-align:top;"value="목록">
			</div>
			
			
			<hr/>
			<!-- 댓글insert-->
			<div id="qna_view_repl_insert" style=" border:1px solid #DCDCDC; padding : 20px 30px 50px 30px; border-radius:30px;">
				<!-- 댓글인서트 서머노트 -->
				<div class="view_summernote_section">
					<span>
						<img id="qna_view_repl_insert_profileimage_file" src="images/${qbVo.profile_img}" style="border-radius:50%;">
					</span>
					<div class="view_summernote"></div>
				</div>
				<div>
					<input type="button" value="댓글입력" id="qna_view_repl_btnInsert" class="qna_view_originalBtn" style="margin-top:5px; width:100px;" >
				</div>
			</div>
			<hr/>
			
			
			
			<!-- 댓글리스트 -->
			<div id="qna_view_repl_list" style="margin-top:50px;"> 
				<c:forEach var='replList' items='${replList}'>
					<c:if test ='${replList.deep eq 0}'>
						<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
						<div class="qna_view_repl_profile" style="font-size:13px; margin-top:30px;">
							<span class="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
								<img class="qna_view_repl_profile_profileimage_file" src="images/${replList.profile_img}"style="border-radius:50%;" >
							</span>
							<span class="qna_view_repl_profile_nickname">
								<span>${replList.nickname}</span>
							</span>
							<span class="qna_view_repl_nal">
								<span>${replList.repl_nal}</span>
							</span>
						</div>
						<!-- 댓글내용 -->
						<div class="qna_view_repl_doc" style="position:relative; font-size:13px; border:1px solid #E6E6E6; border-radius:10px; padding:2px;">
							<div>
								<span>
									<c:choose>
										<c:when test="${replList.repl_delete eq 0}">
										${replList.repl_doc}
										</c:when>
										<c:when test="${replList.repl_delete eq 1}">
										작성자 본인에 의해 삭제된 댓글입니다.
										</c:when>
										<c:when test="${replList.repl_delete eq 2}">
										관리자에 의해 삭제된 댓글입니다.
										</c:when>
									</c:choose>
								</span>
							</div>
							<!-- (ON/OFF)key -->
							<button id="repl_inner_display_onkey" 
							 type="button" 
							 style="width:70px; height:20px; position:absolute; bottom:0; 
							 border:0;" 
							 onclick="insertFormToggle(${replList.repl_sno})">
							대댓입력</button>
							
							<c:if test="${replList.countinnerrepl >0 }">
								<button id="repl_inner_display_onkey2" 
								 type="button" 
								 style="width:70px; height:20px; position:absolute; bottom:0; left:80px; border:0;" 
								 onclick="innerReplToggle(${replList.grp})">
								 댓글접기</button>
							</c:if>
						</div>
						<!-- 댓글(수정,삭제)btnzone -->
						<div class="qna_view_repl_btnzone">
							<c:if test="${replList.repl_delete eq 0}">
								<input type="button" class="qna_view_originalBtn" value="수정"><!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
								<input type="button" class="qna_view_originalBtn" value="삭제"
								onclick="view_repl_deleteR(${replList.repl_sno})">
								<input type="button" class="qna_view_originalBtn" value="채택"><!-- 본문글작성자가 세션아이디와 똑같은 경우에만 활성화;채택버튼 JS:cf)confirm-->
							</c:if>
						</div>
						<!-- (ON/OFF)display ; 대댓글입력폼 -->
						<div id="repl_insert_section${replList.repl_sno}" style="display:none; font-size:15px; margin-left:50px;">
							<span>
								<img id="qna_view_repl_inner_insert_profileimage_file" src="images/ITtravel.png"><!-- 세션아이디의 프로필이미지가 들어감 -->
							</span>
							<!-- 대댓글인서트_내용 서머노트 -->
							<div class="view_summernote"></div>
							<!-- 대댓글인서트_버튼 -->
							<div id="qna_view_repl_inner_btnInsert" >
								<input type="button" class="qna_view_originalBtn"  value="대댓글입력" style="width:100px;" >
							</div>
						</div>
						<!-- ----------------------------------- -->
						
					</c:if>
					<c:if test ='${replList.deep ne 0}'>
						<div id="repl_inner_section${replList.grp}"style="margin-left:50px; margin-top: -30px;">
							<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
							<div class="qna_view_repl_profile" style="font-size:13px; margin-top:30px;">
								<span class="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
									<img class="qna_view_repl_profile_profileimage_file" src="images/${replList.profile_img}"style="border-radius:50%;" >
								</span>
								<span class="qna_view_repl_profile_nickname">
									<span>${replList.nickname}</span>
								</span>
								<span class="qna_view_repl_nal">
									<span>${replList.repl_nal}</span>
								</span>
							</div>
							<!-- 댓글내용 -->
							<div class="qna_view_repl_doc" style="position:relative; font-size:13px; border:1px solid #E6E6E6; border-radius:10px; padding:2px;">
								<div>
									<span>
										<c:choose>
											<c:when test="${replList.repl_delete eq 0}">
											${replList.repl_doc}
											</c:when>
											<c:when test="${replList.repl_delete eq 1}">
											작성자 본인에 의해 삭제된 댓글입니다.
											</c:when>
											<c:when test="${replList.repl_delete eq 2}">
											관리자에 의해 삭제된 댓글입니다.
											</c:when>
										</c:choose>
									</span>
								</div>
							</div>
							<!-- 댓글(수정,삭제)btnzone -->
							<div class="qna_view_repl_btnzone">    
								<c:if test="${replList.repl_delete eq 0}">
									<input type="button" class="qna_view_originalBtn" value="수정"><!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
									<input type="button" class="qna_view_originalBtn" value="삭제"
									onclick="view_repl_deleteR(${replList.repl_sno})">
								</c:if>
							</div>
						</div>	
					</c:if>
				</c:forEach>
			</div>
		</c:when>
		
		<c:when test="${qbVo.board_delete eq 1}">
			<!-- 본문 헤더(작성자사진,닉네임,작성일,조회수,보상픽셀) -->
			<div id="qna_view_header"  >
				<span id="qna_view_header_section1"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
					<img id="qna_view_header_profileimage_file" 
					style="width:40px; height:40px; vertical-align: top; border-radius:50%;"
					src="images/${qbVo.profile_img}" >
				</span>
				<!-- 본문 조회수,작성시간 -->
				<div  id="qna_view_header_section2" style="display:inline-block; vertical-align: top;">
					<div id="qna_view_profile_nickname">${qbVo.nickname}</div>
					<span>${qbVo.nal}
					<img src="images/index_viewcount.png" 
					style="width:20px; height:15px; margin-top: -4px; margin-right:-4px;">
					${qbVo.viewcount }</span>
					<span>채택픽셀:${qbVo.qna_pixel_reward}</span>
				</div>	
			</div>
		
			<!-- 본문 글제목 -->
			<div id="qna_view_subject">
				<span style="font-size:1.5rem; font-weight:600;">
					작성자 본인에 의해 삭제된 글입니다.
				</span>
			</div>
			
			<!-- 본문 글내용 --> <!--  -->
			<span id="qna_view_doc" style="font-size:15px; display:inline-block; min-height:300px; margin-top:20px;">
				작성자 본인에 의해 삭제된 글입니다.
			</span>
		</c:when>
		<c:when test="${qbVo.board_delete eq 2}">
			<!-- 본문 헤더(작성자사진,닉네임,작성일,조회수,보상픽셀) -->
			<div id="qna_view_header"  >
				<span id="qna_view_header_section1"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
					<img id="qna_view_header_profileimage_file" 
					style="width:40px; height:40px; vertical-align: top; border-radius:50%;"
					src="images/${qbVo.profile_img}" >
				</span>
				<!-- 본문 조회수,작성시간 -->
				<div  id="qna_view_header_section2" style="display:inline-block; vertical-align: top;">
					<div id="qna_view_profile_nickname">${qbVo.nickname}</div>
					<span>${qbVo.nal}
					<img src="images/index_viewcount.png" 
					style="width:20px; height:15px; margin-top: -4px; margin-right:-4px;">
					${qbVo.viewcount }</span>
					<span>채택픽셀:${qbVo.qna_pixel_reward}</span>
				</div>	
			</div>
		
			<!-- 본문 글제목 -->
			<div id="qna_view_subject">
				<span style="font-size:1.5rem; font-weight:600;">
					관리자에 의해 삭제된 글입니다.
				</span>
			</div>
			
			<!-- 본문 글내용 --> <!--  -->
			<span id="qna_view_doc" style="font-size:15px; display:inline-block; min-height:300px; margin-top:20px;">
				관리자에 의해 삭제된 글입니다.
			</span>
		</c:when>
	</c:choose>		
</form>
</body>
</html>









