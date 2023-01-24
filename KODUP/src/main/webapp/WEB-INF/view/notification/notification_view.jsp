<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/notification.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/notification.js"></script>
<script defer src="js/common_board.js"></script>
<title>notification/notification_view.jsp</title>
</head>
<body>
<form id="notification_view">
	<div style=" height:20px; display:none;"><!-- visibility:hidden; -->
	sno<input type='text' id="view_sno" name='sno' size="2" value='${jbVo.sno}' />      <!-- style="visibility: hidden;" 또는 style="display: none;" -->
	repl_sno<input type='text' name='repl_sno' size="2" value='0'/>
	
	board_delete<input type='text'  name='board_delete' size="2" value='${jbVo.board_delete}'/>
	nowPage<input type='text' name='nowPage' value='0' size="2"/>
	sessionID<input type="text" id="view_sessionID" name='sessionid' value="${sessionScope.sessionId}" size="4"/> <!-- index.jsp의 세션아이디를 그대로 el문으로 받아옴 -->
	repl_doc(summerCODE)<textarea name="repl_doc" id="view_summer_code" ></textarea>
	insertInnerReplgrp<input type='text' id="insert_inner_repl_grp" name='grp' size='2' value='0'/>
	snoID<input type="text" name="sno_id" size="3" value='${jbVo.id}'/>
	repl_ID<input type="text" id="chaetaekID" name="id" size="3" value=""/>
	<br/>
	
	</div>
	<!-- boardtype  /  horsehead -->
	<div id="notification_view_horsehead">
		<a href="#" class="btnBoardtype">구직</a><!-- ${jbVo.boardtype} -->
		/
		<a>${jbVo.notification_horsehead}</a>
	</div>
	
	<!-- 삭제된글에경우 board_delete에 따라 출력되는 화면이달라짐 -->
	<c:choose>
		<c:when test="${jbVo.board_delete eq 0}">
			<!-- 본문 헤더(작성자사진,닉네임,작성일,조회수,보상픽셀) -->
			<div id="notification_view_header"  >
				<span id="notification_view_header_section1"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
					<img id="notification_view_notificationofileimage_file" 
					style="width:40px; height:40px; vertical-align: top; border-radius:50%;"
					src="upload/${jbVo.profile_img}" >
				</span>
				<!-- 본문 조회수,작성시간 -->
				<div  id="notification_view_header_section2" style="display:inline-block; vertical-align: top;">
					<div id="notification_view_profile_nickname">${jbVo.nickname}</div>
					<span>${jbVo.nal}
					<img src="images/index_viewcount.png" 
					style="width:20px; height:15px; margin-top: -4px; margin-right:-4px;">
					${jbVo.viewcount }</span>
					
				</div>	
			</div>
			<!-- 본문 글제목 -->
			<div id="notification_view_subject">
				<span style="font-size:1.5rem; font-weight:600;">
					${jbVo.subject}
				</span>
			</div>
			<!-- 본문 글내용 -->
			<span id="notification_view_doc" style="font-size:15px; display:inline-block; min-height:300px; margin-top:20px;">
				${jbVo.doc}
			</span>
			<!-- 추천,비추천 -->
			<c:if test="${sessionScope.sessionId ne null}">
				<div>
					<div style="text-align:right;">
						<button id="btn_viewpage_thumbup" type="button" style="display:inline-block; text-align:right; background-color:#fff; border:0;" ><img src="images/추천엄지.png"></button>
							<input type="text" id="thumb_standard" value="${jbVo.thumbup-jbVo.thumbdown}" style="display:none;"/>
							<span id="thumb" style="font-weight:600px;" >${jbVo.thumbup-jbVo.thumbdown}</span>
						<button id="btn_viewpage_thumbdown" type="button" style="display:inline-block; text-align:right; background-color:#fff; border:0;" ><img src="images/비추천엄지.png"></button>
					</div>
				</div>
			</c:if>
			
			<!-- 추천,비추천 -->
			<c:if test="${sessionScope.sessionId eq null}">
				<div>
					<div style="text-align:right;">
						<button id="btn_viewpage_thumbup" disabled type="button" style="display:inline-block; text-align:right; background-color:#fff; border:0;" ><img src="images/추천엄지.png"></button>
							<input type="text" id="thumb_standard" value="${jbVo.thumbup-jbVo.thumbdown}" style="display:none;"/>
							<span id="thumb" style="font-weight:600px;" >${jbVo.thumbup-jbVo.thumbdown}</span>
						<button id="btn_viewpage_thumbdown" disabled type="button" style="display:inline-block; text-align:right; background-color:#fff; border:0;" ><img src="images/비추천엄지.png"></button>
					</div>
				</div>
			</c:if>
			<!-- 본문 해시태그 --><!-- 해당해시태그를 누를경우 findStr로 해당 태그가 들어간 글들을 셀렉트 -->
			<div id="notification_view_hashtag">
				<c:forEach var='vo' items='${jbVo.hashtaglist}'>
					<span>
						<a href="#" onclick="notification_view_findHashtag(${vo.hashtag})">${vo.hashtag}</a>
					</span>
				</c:forEach>
			</div>
			<!-- 본문 btnzone -->
			<div id="notification_view_btnzone" style="margin-top:30px;" >
				<c:if test="${jbVo.id eq sessionScope.sessionId}">
					<input type="button" class="btnUpdate notification_view_originalBtn" style="vertical-align:top;"value="수정">
					<input type="button" class="btnDeleteR  notification_view_originalBtn"style="vertical-align:top;" value="삭제">
				</c:if>
				<input type="button" class="btnListUNotification  notification_view_originalBtn" style="vertical-align:top;"value="목록">
			</div>
			
			<hr/>
			<!-- 댓글insert-->
			<c:if test="${sessionScope.sessionId ne null }">
				<div id="notification_view_repl_insert" style=" border:1px solid #DCDCDC; padding : 20px 30px 50px 30px; border-radius:30px;">
					<!-- 댓글인서트 서머노트 -->
					<div class="view_summernote_section">
						<span>
							<img id="notification_view_repl_insert_profileimage_file" src="images/${sessionScope.profile_img}" style="border-radius:50%;">
						</span>
						<textarea id="view_main_summernote" class="view_summernote"></textarea>
					</div>
					<div>
						<input type="button" value="댓글입력"
						id="notification_view_repl_btnInsert" 
						class="notification_view_originalBtn" 
						style="margin-top:5px; width:100px;" 
						onclick='view_insert_repl()'>
					</div>
				</div>
			</c:if>
			<c:if test="${sessionScope.sessionId eq null}">
				<div id="notification_view_repl_insert" style=" border:1px solid #DCDCDC; padding : 20px 30px 50px 30px; border-radius:30px;">
					<!-- 댓글인서트 서머노트 -->
					<div class="view_summernote_section">
						<span>
							<img id="notification_view_repl_insert_profileimage_file" src="images/NULLboy.png" style="border-radius:50%;">
						</span>
						<div style="border:1px solid #DCDCDC; border-radius:20px; min-height:90px; padding:20px;">
							<span  >
								<img style="display:inline-block; vertical-align:bottom;" src="images/동그라미물음표.png" style="width:20px; height:20px;"/>
								댓글을 쓰려면
								 <a href="#" class="underline" onclick="view_login()">로그인</a>이 필요합니다.
							</span>
						</div>
					</div>
					<div>	
						<input type="button" value="댓글입력" disabled="disabled" 
						id="notification_view_repl_btnInsert" 
						style="margin-top:5px; width:100px; border-radius:10px;" 
						onclick='view_insert_repl()'>
					</div>
				</div>
				
			</c:if>
			<hr/>
			<!-- 댓글리스트 -->
			<div id="notification_view_repl_list" style="margin-top:50px;"> 
				<c:forEach var='replList' items='${replList}'>
				
				<div style="display:none;"> <!-- style="visibility:hidden;" -->
					repl_doc<textarea id="save_repl_doc${replList.repl_sno}">${replList.repl_doc}</textarea>
					repl_sno<input type="text"size="2" value="${replList.repl_sno}"/>
					repl_grp<input type="text" size="2" value="${replList.grp}"/>
					id<input type="text"size="2" value="${replList.id}"/>
				</div>
					<c:if test ='${replList.deep eq 0}'>
						<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
						<div class="notification_view_repl_profile" style="font-size:13px; margin-top:15px;">
							<span class="notification_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
								<img class="notification_view_repl_profile_profileimage_file" src="images/${replList.profile_img}"style="border-radius:50%;" >
							</span>
							
							<span class="notification_view_repl_profile_nickname" 
							id="chaetaek_nickname${replList.repl_sno}">${replList.nickname}</span>
							
							<span class="notification_view_repl_nal">
								<span>${replList.repl_nal}</span>
							</span>
						</div>
						<!-- 댓글내용 -->
						<div class="notification_view_repl_doc " 
						style="position:relative; font-size:13px; border:1px solid #E6E6E6;
						border-radius:10px; padding:2px;">
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
							<c:if test="${sessionScope.sessionId ne null }">
								<button id="repl_inner_display_onkey" 
								 type="button" 
								 style="width:70px; height:20px; position:absolute; bottom:0; 
								 border:0;" 
								 onclick="insertFormToggle(${replList.repl_sno})">
								대댓입력</button>
							</c:if>
							<c:if test="${sessionScope.sessionId eq null }">
								<button id="repl_inner_display_onkey" 
								 type="button" 
								 style="width:70px; height:20px; position:absolute; bottom:0; border:0;" 
								 disabled="disabled"
								 onclick="insertFormToggle(${replList.repl_sno})">
								대댓입력</button>
							</c:if>
							<c:if test="${replList.countinnerrepl >0 }">
								<button id="repl_inner_display_onkey2" 
								 type="button" 
								 style="width:70px; height:20px; position:absolute; bottom:0; left:80px; border:0;" 
								 onclick="innerReplToggle(${replList.grp})">
								 댓글접기</button>
							</c:if>
						</div>
						<!-- 댓글(수정,삭제)btnzone -->
						<div class="notification_view_repl_btnzone">
							<c:if test="${replList.repl_delete eq 0}">
								<!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
								<c:if test="${replList.id eq sessionScope.sessionId}">
									<input type="button" class="notification_view_originalBtn" value="수정"
									onclick="view_update_Repl_open(${replList.repl_sno})">
									<input type="button" class="notification_view_originalBtn" value="삭제"
									onclick="view_repl_deleteR(${replList.repl_sno})">
								</c:if>
								
							</c:if>
						</div>
						<!-- (ON/OFF)display ; 댓글수정서머노트 -->
						<div id="updateReplSection${replList.repl_sno}"style="display:none;">
							<textarea id="view_update_Repl_summernote${replList.repl_sno}" style="display:none;">
							</textarea>
							<button type="button" class="notification_view_originalBtn" onclick="updateReplUpdate(${replList.repl_sno})">수정입력</button>
							<button type="button" class="notification_view_originalBtn" onclick="updateReplCancel(${replList.repl_sno})">취소</button>
						</div>
					
						<!-- (ON/OFF)display ; 대댓글입력폼 -->
						<div id="repl_insert_section${replList.repl_sno}" style="display:none; font-size:15px; margin-left:50px;">
							<span>
								<img id="notification_view_repl_inner_insert_profileimage_file" src="images/${sessionScope.profile_img}" style="border-radius:50%;"><!-- 세션아이디의 프로필이미지가 들어감 -->
							</span>
							<!-- 대댓글인서트_내용 서머노트 -->
							<div id="view_inner_summernote${replList.grp}"class="view_summernote"></div>
							<!-- 대댓글인서트_버튼 -->
							<div id="notification_view_repl_inner_btnInsert" >
								<input type="button" class="notification_view_originalBtn" value="대댓글입력"
								style="width:100px;"
								onclick="view_insert_innerRepl(${replList.grp})" >
							</div>
						</div>
						<!-- ----------------------------------- -->
						
					</c:if>
					<c:if test ='${replList.deep ne 0}'>
						<div class="repl_inner_section${replList.grp}"style="margin-left:50px;">
							<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
							<div class="notification_view_repl_profile" style="font-size:13px; margin-top:15px;">
								<span class="notification_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
									<img class="notification_view_repl_profile_profileimage_file" src="images/${replList.profile_img}"style="border-radius:50%;" >
								</span>
								<span class="notification_view_repl_profile_nickname">
									<span>${replList.nickname}</span>
								</span>
								<span class="notification_view_repl_nal">
									<span>${replList.repl_nal}</span>
								</span>
							</div>
							<!-- 댓글내용 -->
							<div class="notification_view_repl_doc" style="position:relative; font-size:13px; border:1px solid #E6E6E6; border-radius:10px; padding:2px;">
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
							<div class="notification_view_repl_btnzone">    
								<c:if test="${replList.repl_delete eq 0}">
									<c:if test="${replList.id eq sessionScope.sessionId}">
										<input type="button" class="notification_view_originalBtn" value="수정"
										onclick="view_update_Repl_open(${replList.repl_sno})"><!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
										<input type="button" class="notification_view_originalBtn" value="삭제"
										onclick="view_repl_deleteR(${replList.repl_sno})">
									</c:if>
								</c:if>
							</div>
							<!-- (ON/OFF)display ; 대댓글수정서머노트 -->
							<div id="updateReplSection${replList.repl_sno}"style="display:none;">
								<textarea id="view_update_Repl_summernote${replList.repl_sno}" >
								</textarea>
								<button type="button" class="notification_view_originalBtn" onclick="updateReplUpdate(${replList.repl_sno})">수정입력</button>
								<button type="button" class="notification_view_originalBtn" onclick="updateReplCancel(${replList.repl_sno})">취소</button>
							</div>
						</div>	
					</c:if>
				</c:forEach>
			</div>
		</c:when>
		
		<c:when test="${jbVo.board_delete eq 1}">
			<!-- 본문 헤더(작성자사진,닉네임,작성일,조회수,보상픽셀) -->
			<div id="notification_view_header"  >
				<span id="notification_view_header_section1"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
					<img id="notification_view_header_profileimage_file" 
					style="width:40px; height:40px; vertical-align: top; border-radius:50%;"
					src="images/${jbVo.profile_img}" >
				</span>
				<!-- 본문 조회수,작성시간 -->
				<div  id="notification_view_header_section2" style="display:inline-block; vertical-align: top;">
					<div id="notification_view_profile_nickname">${jbVo.nickname}</div>
					<span>${jbVo.nal}
					<img src="images/index_viewcount.png" 
					style="width:20px; height:15px; margin-top: -4px; margin-right:-4px;">
					${jbVo.viewcount }</span>
					
				</div>	
			</div>
		
			<!-- 본문 글제목 -->
			<div id="notification_view_subject">
				<span style="font-size:1.5rem; font-weight:600;">
					작성자 본인에 의해 삭제된 글입니다.
				</span>
			</div>
			
			<!-- 본문 글내용 --> <!--  -->
			<span id="notification_view_doc" style="font-size:15px; display:inline-block; min-height:300px; margin-top:20px;">
				작성자 본인에 의해 삭제된 글입니다.
			</span>
		</c:when>
		<c:when test="${jbVo.board_delete eq 2}">
			<!-- 본문 헤더(작성자사진,닉네임,작성일,조회수,보상픽셀) -->
			<div id="notification_view_header"  >
				<span id="notification_view_header_section1"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
					<img id="notification_view_header_profileimage_file" 
					style="width:40px; height:40px; vertical-align: top; border-radius:50%;"
					src="images/${jbVo.profile_img}" >
				</span>
				<!-- 본문 조회수,작성시간 -->
				<div  id="notification_view_header_section2" style="display:inline-block; vertical-align: top;">
					<div id="notification_view_profile_nickname">${jbVo.nickname}</div>
					<span>${jbVo.nal}
					<img src="images/index_viewcount.png" 
					style="width:20px; height:15px; margin-top: -4px; margin-right:-4px;">
					${jbVo.viewcount }</span>
				</div>	
			</div>
		
			<!-- 본문 글제목 -->
			<div id="notification_view_subject">
				<span style="font-size:1.5rem; font-weight:600;">
					관리자에 의해 삭제된 글입니다.
				</span>
			</div>
			
			<!-- 본문 글내용 --> <!--  -->
			<span id="notification_view_doc" style="font-size:15px; display:inline-block; min-height:300px; margin-top:20px;">
				관리자에 의해 삭제된 글입니다.
			</span>
		</c:when>
	</c:choose>
	
	<!-- HIDDEN -->
	<input type="hidden" name="findStr" value="${cbpVo.findStr }">
	<input type="hidden" name="sortK" value="${cbpVo.sort }">
	<input type="hidden" name="boardtypeK" value="${cbpVo.boardtype }">
	<input type="hidden" name="horseheadK" value="${cbpVo.horsehead }">
	<input type="hidden" name="horsehead" value="${ibVo.infoshare_horsehead}">
	<input type="hidden" name="nowPageK" value="${cbpVo.nowPage }">
	<input type="hidden" name="idK" value="${sessionScope.sessionId }">
	<input type="hidden" name="subject" value="${ibVo.subject}">
	<textarea style="display: none;" id="getDoc" name="doc">${ibVo.doc }</textarea>
	<input type="hidden" name="hashtag" value="">
	<div id="qna_view_hashtag2" style="display: none;">
		<c:forEach var='vo' items='${ibVo.hashtaglist}'>
			${vo.hashtag}
		</c:forEach>
	</div>
</form>
</body>
</html>