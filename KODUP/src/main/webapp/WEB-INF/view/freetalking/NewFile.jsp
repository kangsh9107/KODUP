<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/infoshare.js"></script>
<title>infoshare/infoshare_view.jsp</title>
</head>
<body>
<form id="infoshare_view">
	<!-- boardtype  /  horsehead -->
	<div id="infoshare_view_horsehead">
		<span>정보공유</span>
		/
		<span>기타</span>
	</div>
	
	<!-- 본문글제목 -->
	<div id="infoshare_view_subject">
		<div class="col" >
			<span>
				비전공이지만 개발자로 먹고 삽니다 리뷰
			</span>
		</div>
	</div>
	
	<!-- 작성자프로필사진+닉네임 -->
	<div id="infoshare_view_profile">
		<span id="infoshare_view_profile_profileimage" > <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
			<img id="infoshare_view_profile_profileimage_file" src="images/index_default.png" >
		</span>
		<span id="index_profile">
			<span>딥러닝악마</span>
		</span>
	</div>
	<!-- 조회수,작성시간 -->
	<div id="infoshare_view_nalandhit" >
		<span>10분전</span>
		<span>조회수 : 33</span>
	</div>	
	
	
	<!-- 글내용 -->
	<div id="infoshare_view_doc" >
		리뷰를 작성하기 앞서 현재 개발 업무를 희망하시는 분들과 어떤 방향으로 나아가야 할 지 모르는 분들께 이 책을 추천해 드립니다.
		<br/>우선 저는 올해 95년생 29살로 제가 무엇을 원하는지 또 어떤 일을 해야 보람을 느끼고 알차게 느끼는지 전혀 모르는 상태였습니다.
		<br/>주변에 개발하는 친구의 이야기를 듣고 무작정 개발을 해보고 싶다라는 마음 하나만 가지고 다니던 회사를 나와 국비학원을 신청했습니다. 하지만 2개월이 지난 지금 아직까지 제가 왜 이걸 하고 싶은지 어떤 개발자가 되고 싶은지 전혀 갈피를 잡지 못했지만 '비전공이지만 개발자로 먹고 삽니다' 를 읽고 생각의 전환을 조금은 바꾸었습니다.
		<br/>책을 읽으면서 한 가지 문제를 고민하게 되었는데, 책에서 나온 내용 중 언어를 새로 배우게 되면 자바는 입문으로 추천하지 않는다고 나와 있습니다. 현재 제가 다니고 있는 국비 학원은 자바를 기반으로 한 스프링 언어를 배우는데 이러면 다른 학원을 알아보고 준비를 다시 해야 하나라는 생각을 가지고 있습니다. 만일 다른 학원을 알아봐 들어간다고 해도 아예 처음부터 시작을 하고 그만큼 준비 기간도 길어져 고민을 하고 있지만, 막상 생각을 해보면 책 한 권 읽었다고 바로 방향을 돌아서는 것도 우습기도 하고 필요하면 제가 직접 새로운 언어를 접하면서 공부하고 경험을 쌓으려고 합니다.
		<br/>중간에 제 이야기로 샜는데, 제가 드리고 싶은 말씀은 개발을 하고 싶고 개발을 원하고 개발로 무언가를 이루고 싶은데 아무런 베이스가 없는 분들...시작이 없으면 도전 자체가 성립이 안된다는 말이 있습니다. 이 책을 읽고 도전해 보시길 바라며 본인이 하고 싶은 길을 찾고 그 방향성을 잃지 않기를 바라겠습니다.
		<br/>저 역시 아직 어떤 개발자가 되야지! 하는 명확한 길을 찾지 못했습니다. 아마 이 책을 읽지 못했다면 더더욱 제 방향성에 혼동이 왔겠지만 이제는 스스로 알아보면서 점차 앞으로 나가려고 합니다. 전국에 있는 개발자 지망생분들을 응원하겠습니다.
		<br/>부족하게 적은 긴 글 읽어주셔서 감사드리며, 추후에는 더 멋지고 간략하게 설명할 수 있게 작성할 수 있도록 하겠습니다.
		<br/>오늘도 모두 좋은 하루 보내세요!
	</div>
	
	<!-- 해시태그 --><!-- 해당해시태그를 누를경우 findStr로 해당 태그가 들어간 글들을 셀렉트 -->
	<div id="infoshare_view_hashtag">
		<a href="#">#비전공자	</a>
		<a href="#">#방향성	</a>
	</div>
	<!-- (목록,수정,삭제)btnzone -->
	<div id="infoshare_view_btnzone">
		<input type="button" class="btnUpdate" value="수정">
		<input type="button" class="btnDeleteR" value="삭제">
		<input type="button" class="btnList" value="목록">
	</div>
	
	<hr/>
	
	<!-- 댓글 -->
	<div id="infoshare_view_repl">
		<!-- 댓글insert -->
		<div id="infoshare_view_repl_insert">
			<span>
				<img id="infoshare_view_repl_insert_profileimage_file" src="images/ITtravel.png" >
			</span>
			<span>
				<span>고백좌</span>
			</span>
			<!-- 댓글인서트_내용 서머노트 -->
			<div class="view_summernote"></div>
			<!-- 댓글인서트_버튼 -->
			<div>
				<input type="button" value="댓글입력" id="infoshare_view_repl_btnInsert">
			</div>
		</div>
		<br/>
		
		<!-- 댓글select-->
		<!-- 댓글1 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div class="infoshare_view_repl_profile">
			<span class="infoshare_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img class="infoshare_view_repl_profile_profileimage_file" src="images/angel.png" >
			</span>
			<span class="infoshare_view_profile_nickname">
				<span>천사</span>
			</span>
			<span class="infoshare_view_repl_nal">
				<span>4분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div class="infoshare_view_repl_doc">
			<div >
			좋은 얘기 감사드립니다 ㅎㅎ 글쓴이님도 앞으로 좋은일만 가득하길 바랍니다.
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div class="infoshare_view_repl_btnzone" >
			<input type="button" value="수정"><!-- 댓글작성자가 세션아이디와 똑같은 경우에만 활성화;수정,삭제버튼 -->
			<input type="button" value="삭제">
			<input type="button" value="채택"><!-- 본문글작성자가 세션아이디와 똑같은 경우에만 활성화;채택버튼 JS:cf)confirm-->
		</div>
		<!-- 댓글2 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div class="infoshare_view_repl_profile">
			<span class="infoshare_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img class="infoshare_view_repl_profile_profileimage_file" src="images/devilcookie.png" >
			</span>
			<span class="infoshare_view_profile_nickname">
				<span>악마</span>
			</span>
			<span class="infoshare_view_repl_nal">
				<span>8분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div class="infoshare_view_repl_doc">
			<div >
			뭐든 처음이 어려운 법이지요.. 
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div class="infoshare_view_repl_btnzone">                       
			<input type="button" value="수정">
			<input type="button" value="삭제">
			<input type="button" value="채택">
		</div>
		<!-- 대댓글 -->
		<div class="infoshare_view_repl_inner">
			<!--  대댓글select -->
			<div>
				<!--대댓글1 작성자프로필사진+닉네임+시간 -->
				<div class="infoshare_view_repl_inner_profile">
					<span class="infoshare_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img class="infoshare_view_repl_inner_profile_profileimage_file" src="images/ITtravel.png" >
					</span>
					<span class="infoshare_view_repl_inner_profile_nickname">
						<span>고백좌</span>
					</span>	
					<span class="infoshare_view_repl_inner_nal">
						<span>2분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div class="infoshare_view_repl_inner_doc" >
					<div>
						사랑해요
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone --> <!-- 대댓글작성자와 세션아이디가 같은경우에만 활성화 -->
				<div class="infoshare_view_repl_inner_btnzone">
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</div>
				
				<!--대댓글2 더미데이터 -->
				<div class="infoshare_view_repl_inner_profile">
					<span class="infoshare_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img class="infoshare_view_repl_inner_profile_profileimage_file" src="images/devilcookie.png" >
					</span>
					<span class="infoshare_view_repl_inner_profile_nickname">
						<span>악마</span>
					</span>	
					<span class="infoshare_view_repl_inner_nal">
						<span>0분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div class="infoshare_view_repl_inner_doc">
					<div>
						??!
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone --> <!-- 대댓글작성자와 세션아이디가 같은경우에만 활성화 -->
				<div class="infoshare_view_repl_inner_btnzone">
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</div>
			</div>
			<!-- 대댓글insert -->
			<div id="infoshare_view_repl_inner_insert">
				<span>
					<img id="infoshare_view_repl_inner_insert_profileimage_file" src="images/ITtravel.png">
				</span>
				<span>
					<span>고백좌</span>
				</span>
				<!-- 대댓글인서트_내용 서머노트 -->
				<div class="view_summernote"></div>
				<!-- 대댓글인서트_버튼 -->
				<div id="infoshare_view_repl_inner_btnInsert">
					<input type="button" value="대댓글입력">
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>