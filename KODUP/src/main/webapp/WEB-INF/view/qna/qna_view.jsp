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
<input type='text' id="sno" name='sno' value='3' style="visibility: hidden;"/><!-- style="visibility: hidden;" -->
<input type='text' id="" name='nowPage' value='2'style="visibility: hidden;"/>
<input type='text' name='nowPage' value='3'style="visibility: hidden;"/>

	<!-- boardtype  /  horsehead -->
	<div id="qna_view_horsehead">
		<a href="#" class="btnBoardtype">${qbVo.boardtype}</a>
		/
		<a>${qbVo.qna_horsehead}</a>
	</div>
	
	<!-- 본문 글제목 -->
	<div id="qna_view_subject">
		<span style="font-size:1.5rem; font-weight:600;">
				초보자를 위한 오픈 소스 시작하기
		</span>
	</div>
	<!-- 본문 작성자프로필사진+닉네임 -->
	<div id="qna_view_profile"  >
		<span id="qna_view_profile_profileimage"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
			<img id="qna_view_profile_profileimage_file" style="width:50px; height:50px; vertical-align: top;"src="images/index_default.png" >
		</span>
		<!-- 본문 조회수,작성시간 -->
		<div id="qna_view_nalandhit" style="display:inline-block; vertical-align: top;">
			<div id="qna_view_profile_nickname">${qbVo.nickname}</div>
			<span>${qbVo.nal}
			<img src="images/index_viewcount.png" style="width:20px; height:15px; margin-top: -5px; margin-right:-4px;">
			${qbVo.viewcount }</span>
		</div>	
	</div>

	
	<!-- 본문 글내용 --> <!--  -->
	<span id="qna_view_doc" style="font-size:17px; display:inline-block;min-height:300px; margin-top:20px;">
		${qbVo.doc}
	</span>
	
	<!-- 본문 해시태그 --><!-- 해당해시태그를 누를경우 findStr로 해당 태그가 들어간 글들을 셀렉트 -->
		<br/><br/><br/>
	<div id="qna_view_hashtag">
		<c:forEach var='vo' items='${qbVo.hashtaglist}'>
			<span>
				<a href="#" onclick="qna_view_findHashtag(${vo.hashtag})">${vo.hashtag}</a>
			</span>
		</c:forEach>
	</div>
	<!-- 본문 btnzone -->
	<div id="qna_view_btnzone" >
		<input type="button" class="btnUpdate qna_view_originalBtn" style="vertical-align:top;"value="수정">
		<input type="button" class="btnDeleteR  qna_view_originalBtn"style="vertical-align:top;" value="삭제">
		<input type="button" class="btnList  qna_view_originalBtn" style="vertical-align:top;"value="목록">
	</div>
	
	<hr/>
	<!-- 댓글insert -->
	<div id="qna_view_repl_insert" style=" border:1px solid #999; padding : 20px 30px 50px 30px;border-radius:30px;">
		<!-- 댓글인서트_내용 서머노트 -->
		<div class="view_summernote_section">
			<span>
				<img id="qna_view_repl_insert_profileimage_file" src="images/ITtravel.png" >
			</span>
			<div class="view_summernote"></div>
		</div>
		<div>
			<input type="button" value="댓글입력" id="qna_view_repl_btnInsert" class="qna_view_originalBtn" style="margin-top:5px; width:100px;" >
		</div>
		
	</div>
	<br/>
	<br/>
	
	<!-- 댓글 -->
	<div id="qna_view_repl_list" >
		
		<!-- 댓글select-->
		<!-- 댓글1 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div class="qna_view_repl_profile" >
			<span class="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img class="qna_view_repl_profile_profileimage_file" src="images/angel.png" >
			</span>
			<span class="qna_view_profile_nickname">
				<span>천사</span>
			</span>
			<span class="qna_view_repl_nal">
				<span>4분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div class="qna_view_repl_doc">
			<div >
			입숨 러므로 주는 대중을 무한한 사막이다. 그들의 이성은 피가 같이 것이다. 주며, 웅대한 청춘은 눈이 있으랴?
			인생을 웅대한 유소년에게서 피부가 아니더면, 무엇을 보배를 소리
			</div>
		</div>
		<!-- 댓글btnzone -->
		<div class="qna_view_repl_btnzone" >
			<input type="button" class="qna_view_originalBtn" value="수정"><!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
			<input type="button" class="qna_view_originalBtn" value="삭제">
			<input type="button" class="qna_view_originalBtn" value="채택"><!-- 본문글작성자가 세션아이디와 똑같은 경우에만 활성화;채택버튼 JS:cf)confirm-->
		</div>
		<!-- 대댓글 -->
		<div class="qna_view_repl_inner">
			<!--  대댓글select -->
			<div>
				<!--대댓글1 작성자프로필사진+닉네임+시간 -->
				<div class="qna_view_repl_inner_profile">
					<span class="qna_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img class="qna_view_repl_inner_profile_profileimage_file" src="images/ITtravel.png" >
					</span>
					<span class="qna_view_repl_inner_profile_nickname">
						<span>고백좌</span>
					</span>	
					<span class="qna_view_repl_inner_nal">
						<span>2분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div class="qna_view_repl_inner_doc" >
					<div>
						사랑해요
					</div>
				</div>
				<!-- 대댓글btnzone --> <!-- 대댓글작성자와 세션아이디가 같은경우에만 활성화 -->
				<div class="qna_view_repl_inner_btnzone">
					<input type="button" class="qna_view_originalBtn" value="수정">
					<input type="button" class="qna_view_originalBtn" value="삭제">
				</div>
				
				<!--대댓글2-->
				<div class="qna_view_repl_inner_profile">
					<span class="qna_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img class="qna_view_repl_inner_profile_profileimage_file" src="images/devilcookie.png" >
					</span>
					<span class="qna_view_repl_inner_profile_nickname">
						<span>악마</span>
					</span>	
					<span class="qna_view_repl_inner_nal">
						<span>0분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div class="qna_view_repl_inner_doc">
					<div>
						??!
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone --> <!-- 대댓글작성자와 세션아이디가 같은경우에만 활성화 -->
				<div class="qna_view_repl_inner_btnzone">
					<input type="button" class="qna_view_originalBtn" value="수정">
					<input type="button" class="qna_view_originalBtn" value="삭제">
				</div>
			</div>
		</div>
		<!-- 댓글2 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div class="qna_view_repl_profile">
			<span class="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img class="qna_view_repl_profile_profileimage_file" src="images/girlchar.png" >
			</span>
			<span class="qna_view_repl_profile_nickname">
				<span>ol쁜0r이</span>
			</span>
			<span class="qna_view_repl_nal">
				<span>11분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div class="qna_view_repl_doc" style="position:relative;">
			<div >
			없으면, 별과 구할 것이다. 따뜻한 따뜻한 가치를 없으면 있다.
			</div>
			<button id="repl_inner_display_onkey" class="qna_view_originalBtn"
			 type="button" style="width:100px; position:absolute; bottom:0;"  onclick="insertFormToggle(120)">
			대댓입력</button>
			
		</div>
			<!-- 댓글(수정,삭제)btnzone -->
			<div class="qna_view_repl_btnzone">                       
				<input type="button" class="qna_view_originalBtn" value="수정">
				<input type="button" class="qna_view_originalBtn" value="삭제">
				<input type="button" class="qna_view_originalBtn" value="채택">
			</div>
		<!-- 대댓글insert -->
		<div id="repl_insert_section120" style="display:none;">
			<span>
				<img id="qna_view_repl_inner_insert_profileimage_file" src="images/ITtravel.png">
			</span>
			<span>
				<span>고백좌</span>
			</span>
			<!-- 대댓글인서트_내용 서머노트 -->
			<div class="view_summernote"></div>
			<!-- 대댓글인서트_버튼 -->
			<div id="qna_view_repl_inner_btnInsert" >
				<input type="button" class="qna_view_originalBtn"  value="대댓글입력" style="width:100px;" >
			</div>
		</div>
		
	</div>
</form>
</body>
</html>









