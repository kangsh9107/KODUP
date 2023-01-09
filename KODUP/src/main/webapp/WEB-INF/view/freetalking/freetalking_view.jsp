<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script defer src="js/freetalking.js"></script>
<title>freetalking/freetalking_view.jsp</title>
<style>
#freetalking_view #freetalking_view_doc {
	min-height: 300px;
	background: #eee;
}
</style>
</head>

<body>
<form id="freetalking_view">
	<!-- boardtype + / + horsehead -->
	<div id="freetalking_view_horsehead">
		<span>커뮤니티</span>
		/
		<span>기타</span>
	</div>
	
	<!-- 글제목 -->
	<div id="freetalking_view_subject">
		<div class="col" style="min-height: 45px; text-align:left;">
			<span style="font-size:2rem; ">
				자꾸 첫술에 배부르려고 하네요ㅠ
			</span>
		</div>
	</div>
	
	
	
	<!-- 작성자프로필사진+닉네임 -->
	<div id="freetalking_view_profile">
		<span id="freetalking_view_profile_profileimage" > <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
			<img id="freetalking_view_profile_profileimage_file" src="images/kimsuhyun.jpg" style="width:20px; height:20px;">
		</span>
		<span id="index_profile">
			<span>김수현</span>
		</span>
	</div>
	<!-- 조회수,작성시간 css왼쪽 기준으로 오른쪽에 붙게 빼자 -->
	<div id="freetalking_view_nalandhit" style="text-align:right; ">
		<span>23분전</span>
		<span>조회수 : 104</span>
	</div>	
	
	
	<!-- 글내용 -->
	<div id="freetalking_view_doc" style="min-height: 400px; background: #DFDFDF;">
			처음부터 완벽하게 하려고
		<br/>시작공부부터 광대하게 해버리고
		<br/>공부 다 하고 막상 만들려고 하니까 막혀서
		<br/>이것저것 보고 따라하려고 하는데
		<br/>막힐때마다 나중에 또 손보고 바꿔야 될일이 생길까봐, 이렇게 하는거 맞나 하는 생각에 자꾸 찾아보기만 하게 되고 결국 또 인강이나 뒤적거리고
		<br/>인지하고나서부턴 “일단 하고 나중에 고치자”는 마인드로 하려고는 하는데 방심할때마다 계속 첫술에 배부르려는 마음이 스멀스멀 기어나오네요ㅠㅠ
	</div>
	
	<!-- 해시태그 -->
	<div id="freetalking_view_hashtag" style=" background: #DFDFDF; font-size:20px; ">
		<a href="#" style="text-decoration : none; color:#bb2649;">#완벽</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#공부가힘들어요</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#쿠크다스먹는중</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#빅파이도있음</a>
	</div>
	<!-- (목록,수정,삭제)btnzone -->
	<div style="text-align:right;">
		<input type="button" class="btnUpdate" value="수정">
		<input type="button" class="btnDeleteR" value="삭제">
		<input type="button" class="btnList" value="목록">
	</div>
	
	<hr/>
	
	<!-- 댓글 -->
	<div id="freetalking_view_repl">
		<!-- 댓글insert부분 -->
		<div>
			<span>
				<img id="freetalking_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
			</span>
			<span>
				<span>고백좌</span>
			</span>
			<!-- 댓글인서트_내용 서머노트 -->
			<div class="summernote"></div>
			<!-- 댓글인서트_버튼 -->
			<div>
				<input type="button" value="댓글입력" style="float:right;">
			</div>
		</div>
		<br/>
		<!-- 댓글select부분-->
		
		<!-- 댓글1 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div id="freetalking_view_repl_profile">
			<span id="freetalking_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img id="freetalking_view_repl_profile_profileimage_file" src="images/angel.png" style="width:20px; height:20px;">
			</span>
			<span id="freetalking_view_profile_nickname">
				<span>천사</span>
			</span>
			<span id="freetalking_view_repl_nal">
				<span>4분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
			<div >
			저두 그래요 ㅠ 그래서 아예 시작을 안해버리는...
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div style="text-align:right; visibility:hidden;" >					<!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
			<input type="button" value="수정">
			<input type="button" value="삭제">
			<input type="button" value="채택"><!-- 채택버튼은 -->
		</div>
		<!-- 댓글2 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div id="freetalking_view_repl_profile">
			<span id="freetalking_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img id="freetalking_view_repl_profile_profileimage_file" src="images/devilcookie.png" style="width:20px; height:20px;">
			</span>
			<span id="freetalking_view_profile_nickname">
				<span>악마</span>
			</span>
			<span id="freetalking_view_repl_nal">
				<span>11분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
			<div >
			힘내시기 바랍니다.. ㅎㅇㅌ
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div style="text-align:right; visibility:hidden;">                        <!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
			<input type="button" value="수정">
			<input type="button" value="삭제">
			<input type="button" value="채택"><!-- 채택버튼은 -->
		</div>
		<!-- 대댓글 -->
		<div style="margin-left: 50px;">
			<!--  대댓글select -->
			<div>
				<!--대댓글1 작성자프로필사진+닉네임+시간 -->
				<div id="freetalking_view_repl_inner_profile">
					<span id="freetalking_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img id="freetalking_view_repl_inner_profile_profileimage_file" src="images/ITtravel.png" style="width:20px; height:20px;">
					</span>
					<span id="freetalking_view_repl_inner_profile_nickname">
						<span>고백좌</span>
					</span>	
					<span id="freetalking_view_repl_inner_nal">
						<span>2분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div id="대댓글내용" style="min-height: 50px; background: #F1F1F1;">
					<div>
						화이팅~!
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone 세션아이디와 해당 데이터의 repl_sno와 같은 아이디를 가진사람인경우 활성화-->
				<div style="text-align:right;" >
					<input type="button" value="수정">	<!-- 대댓글의 작성자와 세션아이디가 같아 버튼 활성화 -->
					<input type="button" value="삭제">
				</div>
				
			</div>
			<!-- 대댓글insert -->
			<div>
				<span>
					<img id="freetalking_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
				</span>
				<span>
					<span>고백좌</span>
				</span>
				<!-- 댓글인서트_내용 서머노트 -->
				<div class="summernote"></div>
				<!-- 대댓글인서트_버튼 -->
				<div style="text-align:right;">
					<input type="button" value="대댓글입력">
				</div>
			</div>
		</div>
		
	</div>
</form>
</body>
</html>