<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JS -->
<script defer src="js/jobsearch.js"></script>
<title>jobsearch/jobsearch_view.jsp</title>
<style>
#jobsearch_view #jobsearch_view_doc {
	min-height: 300px;
	background: #eee;
}
</style>
</head>

<body>
<form id="jobsearch_view">
	<!-- boardtype + / + horsehead -->
	<div id="jobsearch_view_horsehead">
		<span>구직게시판</span>
		
	</div>
	
	<!-- 글제목 -->
	<div id="jobsearch_view_subject">
		<div class="col" style="min-height: 45px; text-align:left;">
			<span style="font-size:2rem; ">
				7년차 개발자 프로젝트 구합니다
			</span>
		</div>
	</div>
	
	
	
	<!-- 작성자프로필사진+닉네임 -->
	<div id="jobsearch_view_profile">
		<span id="jobsearch_view_profile_profileimage" > <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
			<img id="jobsearch_view_profile_profileimage_file" src="images/index_default.png" style="width:20px; height:20px;">
		</span>
		<span id="index_profile">
			<span>딥러닝악마</span>
		</span>
	</div>
	<!-- 조회수,작성시간 css왼쪽 기준으로 오른쪽에 붙게 빼자 -->
	<div id="jobsearch_view_nalandhit" style="text-align:right; ">
		<span>15분전</span>
		<span>조회수 : 73</span>
	</div>	
	
	
	<!-- 글내용 -->
	<div id="jobsearch_view_doc" style="min-height: 400px; background: #DFDFDF;">
		경력 : 7년차

		<br/>투입가능일 :  1월 18일 ~ 

		<br/>근무가능지 : 종로/을지로, 여의도, 마포/상암

		<br/>기술 : Java, Jsp, Spring, Mybatis, Node.js, MariaDB, Oracle, Nexacro, X/MiplatForm, 각종 리포트 툴 등

		<br/>자격증 : 정보처리기사

		<br/>희망업무: 금융권 SI (필수아님)

		<br/>프로필 요청 시 arbxo0202@gmail.com 로 문의부탁드립니다.
	</div>
	
	<!-- 해시태그 -->
	<div id="jobsearch_view_hashtag" style=" background: #DFDFDF; font-size:20px; ">
		<a href="#" style="text-decoration : none; color:#bb2649;">#취뽀</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#프리랜서</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#성실</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#7년차</a>
	</div>
	<!-- (목록,수정,삭제)btnzone -->
	<div style="text-align:right;">
		<input type="button" class="btnUpdate" value="수정">
		<input type="button" class="btnDeleteR" value="삭제">
		<input type="button" class="btnList" value="목록">
	</div>
	
	<hr/>
	
	<!-- 댓글 -->
	<div id="jobsearch_view_repl">
		<!-- 댓글insert부분 -->
		<div>
			<span>
				<img id="jobsearch_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
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
		<div id="jobsearch_view_repl_profile">
			<span id="jobsearch_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img id="jobsearch_view_repl_profile_profileimage_file" src="images/devilcookie.png" style="width:20px; height:20px;">
			</span>
			<span id="jobsearch_view_profile_nickname">
				<span>악마</span>
			</span>
			<span id="jobsearch_view_repl_nal">
				<span>8분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
			<div >
				이메일 확인 바랍니다. 
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div style="text-align:right; visibility:hidden;">                        <!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
			<input type="button" value="수정">
			<input type="button" value="삭제">
		</div>
		<!-- 대댓글 -->
		
		<div style="margin-left: 50px;">
			<!--  대댓글select -->
			<div>
				<!--대댓글1 작성자프로필사진+닉네임+시간 -->
				<div id="jobsearch_view_repl_inner_profile">
					<span id="jobsearch_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img id="jobsearch_view_repl_inner_profile_profileimage_file" src="images/index_default.png" style="width:20px; height:20px;">
					</span>
					<span id="jobsearch_view_repl_inner_profile_nickname">
						<span>딥러닝악마</span>
					</span>	
					<span id="jobsearch_view_repl_inner_nal">
						<span>8분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div id="대댓글내용" style="min-height: 50px; background: #F1F1F1;">
					<div>
						바로 확인하겠습니다..!
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone 세션아이디와 해당 데이터의 repl_sno와 같은 아이디를 가진사람인경우 활성화-->
				<div style="text-align:right; visibility:hidden;" >                   <!-- 내가쓴댓글아니라 hidden -->
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</div>
				
				<!--대댓글2 더미데이터 -->
				<div id="jobsearch_view_repl_inner_profile">
					<span id="jobsearch_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img id="jobsearch_view_repl_inner_profile_profileimage_file" src="images/devilcookie.png" style="width:20px; height:20px;">
					</span>
					<span id="jobsearch_view_repl_inner_profile_nickname">
						<span>악마</span>
					</span>	
					<span id="jobsearch_view_repl_inner_nal">
						<span>3분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div id="대댓글내용" style="min-height: 50px; background: #F1F1F1;">
					<div>
						네
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone 세션아이디와 해당 데이터의 repl_sno와 같은 아이디를 가진사람인경우 활성화-->
				<div style="text-align:right; visibility:hidden;"  >                   <!-- 내가쓴댓글아니라 hidden -->
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</div>
			</div>
			<!-- 대댓글insert -->
			<div>
				<span>
					<img id="jobsearch_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
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