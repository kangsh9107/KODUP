<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- boardtype  /  horsehead -->
	<div id="qna_view_horsehead">
		<span>QnA</span>
		/
		<span>기술</span>
	</div>
	
	<!-- 본문 글제목 -->
	<div id="qna_view_subject">
		<div class="col" >
			<span>
				초보자를 위한 오픈 소스 시작하기
			</span>
		</div>
	</div>
	<!-- 본문 작성자프로필사진+닉네임 -->
	<div id="qna_view_profile" style="vertical-align:middle;" >
		<span id="qna_view_profile_profileimage"> <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
			<img id="qna_view_profile_profileimage_file" style="width:50px; height:50px; vertical-align: top;"src="images/index_default.png" >
		</span>
		<!-- 본문 조회수,작성시간 -->
		<div id="qna_view_nalandhit" style="display:inline-block; vertical-align: top;">
			<div id="qna_view_profile_nickname">딥러닝악마</div>
			<span>10분전
			<img src="images/index_viewcount.png" style="width:20px; height:15px; margin-top: -5px; margin-right:-4px;">
			33</span>
		</div>	
	</div>

	
	<!-- 본문 글내용 -->
	<div id="qna_view_doc" >
		같으며, 봄바람을 보이는 희망의 이것이다. 그들의 옷을 얼마나 사랑의 위하여서. 풀이 청춘 자신과 바이며, 봄바람을 주며, 아니다.
		수 많이 풍부하게 충분히 몸이 아름다우냐? 구하지 대고, 풀밭에 심장은 만천하의 없으면, 별과 구할 것이다. 따뜻한 따뜻한 가치를 없으면 있다.
		구하지 있으며, 청춘이 때문이다. 꽃이 낙원을 가슴에 그러므로 주는 대중을 무한한 사막이다. 그들의 이성은 피가 같이 것이다. 주며, 웅대한 청춘은 눈이 있으랴?
		인생을 웅대한 유소년에게서 피부가 아니더면, 무엇을 보배를 소리다.이것은 예가 끓는다.
	</div>
	
	<!-- 본문 해시태그 --><!-- 해당해시태그를 누를경우 findStr로 해당 태그가 들어간 글들을 셀렉트 -->
	<div id="qna_view_hashtag">
		<a href="#">#봄바람	</a>
		<a href="#">#희망		</a>
		<a href="#">#청춘		</a>
	</div>
	<!-- 본문 btnzone -->
	<div id="qna_view_btnzone" >
		<input type="button" class="btnUpdate qna_view_originalBtn" value="수정">
		<input type="button" class="btnDeleteR  qna_view_originalBtn" value="삭제">
		<input type="button" class="btnList  qna_view_originalBtn" value="목록">
	</div>
	
	<hr/>
	<!-- 댓글insert -->
	<div id="qna_view_repl_insert" style=" border:1px solid #999; padding: 50px; border-radius:30px; ">
		<span>
			<img id="qna_view_repl_insert_profileimage_file" src="images/ITtravel.png" style="margin-top:30px; vertical-align:top;" >
		</span>
		<!-- 댓글인서트_내용 서머노트 -->
		<div class="view_summernote_section" style="display:inline-block; margin-top:30px;" >
			<div class="view_summernote">
			</div>
		</div>
		<!-- 댓글인서트_버튼 -->
		<div>
			<input type="button" value="댓글입력" id="qna_view_repl_btnInsert" style="margin-top:5px;">
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
		<!-- 댓글(수정,삭제)btnzone -->
		<div class="qna_view_repl_btnzone" >
			<input type="button" value="수정"><!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
			<input type="button" value="삭제">
			<input type="button" value="채택"><!-- 본문글작성자가 세션아이디와 똑같은 경우에만 활성화;채택버튼 JS:cf)confirm-->
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
				<!-- 대댓글(수정,삭제)btnzone --> <!-- 대댓글작성자와 세션아이디가 같은경우에만 활성화 -->
				<div class="qna_view_repl_inner_btnzone">
					<input type="button" value="수정">
					<input type="button" value="삭제">
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
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</div>
			</div>
		</div>
		<!-- 댓글3 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div class="qna_view_repl_profile">
			<span class="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img class="qna_view_repl_profile_profileimage_file" src="images/girlchar.png" >
			</span>
			<span class="qna_view_profile_nickname">
				<span>>ol쁜0r이</span>
			</span>
			<span class="qna_view_repl_nal">
				<span>11분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div class="qna_view_repl_doc">
			<div >
			없으면, 별과 구할 것이다. 따뜻한 따뜻한 가치를 없으면 있다.
			</div>
		</div>
		<div id="repl_inner_insert_display" style="border:1px solid #999">
			<button id="repl_inner_display_onkey" type="button" style="width:100px;"  onclick="insertFormToggle(120)">대댓입력</button>
			<!-- 댓글(수정,삭제)btnzone -->
			<div class="qna_view_repl_btnzone">                       
				<input type="button" value="수정">
				<input type="button" value="삭제">
				<input type="button" value="채택">
			</div>
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
			<div id="qna_view_repl_inner_btnInsert">
				<input type="button" value="대댓글입력">
			</div>
		</div>
		
		
		
		
		
	</div>
</form>
</body>
</html>









