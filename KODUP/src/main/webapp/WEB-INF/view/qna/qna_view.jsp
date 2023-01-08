<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/qna_view.jsp</title>
</head>

<style>
#qna_view #qna_view_doc {
	min-height: 300px;
	background: #eee;
}
a:hover{
	background-color: #ffff00;
}
</style>
<body>
<script>
/***** 조성호 *****/
/***** SUMMERNOTE *****/
$(document).ready(function () {
	$('.summernote').summernote({
		placeholder: '댓글을 입력해주세요.',
		height: 100,
		maxHeight: 100,
		popover: { //footer 밑 쓸모 없는 메뉴 삭제
			image: [],
			link: [],
			air: []
		}
	});
});
</script>
<form id="qna_view">
	<!-- boardtype + / + horsehead -->
	<div id="qna_view_horsehead">
		<span>QnA</span>
		/
		<span>기술</span>
	</div>
	
	<!-- 글제목 -->
	<div id="qna_view_subject">
		<div class="col" style="min-height: 45px; text-align:left;">
			<span style="font-size:2rem; ">
				백엔드,팀원 | 제대로 튀겨드립니다. 신입도 3년차부터! 가 족같은 분위기에서 일하실 분 구합니다 ^_^
			</span>
		</div>
	</div>
	
	
	
	<!-- 작성자프로필사진+닉네임 -->
	<div id="qna_view_profile">
		<span id="qna_view_profile_profileimage" > <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
			<img id="qna_view_profile_profileimage_file" src="images/index_default.png" style="width:20px; height:20px;">
		</span>
		<span id="index_profile">
			<span>딥러닝악마</span>
		</span>
	</div>
	<!-- 조회수,작성시간 css왼쪽 기준으로 오른쪽에 붙게 빼자 -->
	<div id="qna_view_nalandhit" style="text-align:right; ">
		<span>10분전</span>
		<span>조회수 : 33</span>
	</div>	
	
	
	<!-- 글내용 -->
	<div id="qna_view_doc" style="min-height: 400px; background: #DFDFDF;">
		같으며, 봄바람을 보이는 희망의 이것이다. 그들의 옷을 얼마나 사랑의 위하여서. 풀이 청춘 자신과 바이며, 봄바람을 주며, 아니다.
		수 많이 풍부하게 충분히 몸이 아름다우냐? 구하지 대고, 풀밭에 심장은 만천하의 없으면, 별과 구할 것이다. 따뜻한 따뜻한 가치를 없으면 있다.
		구하지 있으며, 청춘이 때문이다. 꽃이 낙원을 가슴에 그러므로 주는 대중을 무한한 사막이다. 그들의 이성은 피가 같이 것이다. 주며, 웅대한 청춘은 눈이 있으랴?
		인생을 웅대한 유소년에게서 피부가 아니더면, 무엇을 보배를 소리다.이것은 예가 끓는다.
	</div>
	
	<!-- 해시태그 --><!-- 해당해시태그를 누를경우 findStr로 해당 태그가 들어간 글들을 셀렉트 -->
	<div id="qna_view_hashtag" style=" background: #DFDFDF; font-size:20px; ">
		<a href="#" style="text-decoration : none; color:#bb2649;">#봄바람</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#희망</a>
		<a href="#" style="text-decoration : none; color:#bb2649;">#청춘</a>
	</div>
	<!-- (목록,수정,삭제)btnzone -->
	<div style="text-align:right;">
		<input type="button" value="수정" style="visibility : hidden;">
		<input type="button" value="삭제" style="visibility : hidden;">
		<input type="button" value="목록">
	</div>
	
	<hr/>
	
	<!-- 댓글 -->
	<div id="qna_view_repl">
		<!-- 댓글insert부분 -->
		<div>
			<span>
				<img id="qna_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
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
		<div id="qna_view_repl_profile">
			<span id="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img id="qna_view_repl_profile_profileimage_file" src="images/angel.png" style="width:20px; height:20px;">
			</span>
			<span id="qna_view_profile_nickname">
				<span>천사</span>
			</span>
			<span id="qna_view_repl_nal">
				<span>4분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
			<div >
			입숨 러므로 주는 대중을 무한한 사막이다. 그들의 이성은 피가 같이 것이다. 주며, 웅대한 청춘은 눈이 있으랴?
			인생을 웅대한 유소년에게서 피부가 아니더면, 무엇을 보배를 소리
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
		<div id="qna_view_repl_profile">
			<span id="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img id="qna_view_repl_profile_profileimage_file" src="images/devilcookie.png" style="width:20px; height:20px;">
			</span>
			<span id="qna_view_profile_nickname">
				<span>악마</span>
			</span>
			<span id="qna_view_repl_nal">
				<span>8분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
			<div >
			청춘이 때문이다. 꽃이 낙원을 가슴에 그러므로 주는 대중을 무한한 사막이다. 그들의 이성은 피가 같이 것이다. 주며, 웅대한 청춘은 눈이 있으랴? 
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div style="text-align:right; visibility:hidden;">                        <!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
			<input type="button" value="수정">
			<input type="button" value="삭제">
			<input type="button" value="채택"><!-- 채택버튼은 작성자가 세션아이디와 똑같은 경우에 채택이 아직 안된 경우에만 활성화됌 -->
		</div>
		<!-- 대댓글 -->
		<div style="margin-left: 50px;">
			<!--  대댓글select -->
			<div>
				<!--대댓글1 작성자프로필사진+닉네임+시간 -->
				<div id="qna_view_repl_inner_profile">
					<span id="qna_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img id="qna_view_repl_inner_profile_profileimage_file" src="images/ITtravel.png" style="width:20px; height:20px;">
					</span>
					<span id="qna_view_repl_inner_profile_nickname">
						<span>고백좌</span>
					</span>	
					<span id="qna_view_repl_inner_nal">
						<span>2분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div id="대댓글내용" style="min-height: 50px; background: #F1F1F1;">
					<div>
						사랑해요
					</div>
				</div>
				<!-- 대댓글(수정,삭제)btnzone 세션아이디와 해당 데이터의 repl_sno와 같은 아이디를 가진사람인경우 활성화-->
				<div style="text-align:right;" >
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</div>
				
				<!--대댓글2 더미데이터 -->
				<div id="qna_view_repl_inner_profile">
					<span id="qna_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
						<img id="qna_view_repl_inner_profile_profileimage_file" src="images/devilcookie.png" style="width:20px; height:20px;">
					</span>
					<span id="qna_view_repl_inner_profile_nickname">
						<span>악마</span>
					</span>	
					<span id="qna_view_repl_inner_nal">
						<span>0분전</span>
					</span>
				</div>
				<!-- 대댓글 내용 -->
				<div id="대댓글내용" style="min-height: 50px; background: #F1F1F1;">
					<div>
						??!
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
					<img id="qna_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
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
		<!-- 댓글3 -->
		<!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
		<div id="qna_view_repl_profile">
			<span id="qna_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
				<img id="qna_view_repl_profile_profileimage_file" src="images/girlchar.png" style="width:20px; height:20px;">
			</span>
			<span id="qna_view_profile_nickname">
				<span>ol쁜0r이</span>
			</span>
			<span id="qna_view_repl_nal">
				<span>11분전</span>
			</span>
		</div>
		<!-- 댓글내용 -->
		<div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
			<div >
			없으면, 별과 구할 것이다. 따뜻한 따뜻한 가치를 없으면 있다.
			</div>
		</div>
		<!-- 댓글(수정,삭제)btnzone -->
		<div style="text-align:right; visibility:hidden;" >                     <!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
			<input type="button" value="수정">
			<input type="button" value="삭제">
			<input type="button" value="채택">
		</div>
	</div>
</form>
</body>
</html>