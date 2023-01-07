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
</style>
<body>
<form id="qna_view">
	<!-- boardtype + / + horsehead -->
	<div id="qna_view_horsehead">
		<span>QnA</span>
		/
		<span>기술</span>
	</div>
	
	<!-- 글제목 -->
	<div id="qna_view_subject">
		<div class="col" style="height: 45px; text-align:left;">
			<span style="font-size:2rem; ">
				초보자를 위한 오픈 소스 시작하기
			</span>
		</div>
	</div>
	
	
	
	<!-- 작성자프로필사진+닉네임 -->
	<div id="qna_view_profile">
		<span id="qna_view_profile_profileimage" >
			<img id="qna_view_profile_profileimage_file" src="images/index_default.png" style="width:20px; height:20px;">
		</span>
		<span id="index_profile">
			<span>딥러닝악마</span>
		</span>
	</div>
	
	<!-- 조회수,작성시간 css왼쪽 기준으로 오른쪽에 붙게 빼자 -->
	<div id="qna_view_hitandnal">
		<span>5분전</span>
		<span>조회수 : 131</span>
	</div>	
	
	<!-- 글내용 -->
	<div id="qna_view_doc">
		같으며, 봄바람을 보이는 희망의 이것이다. 그들의 옷을 얼마나 사랑의 위하여서. 풀이 청춘 자신과 바이며, 봄바람을 주며, 아니다.
		수 많이 풍부하게 충분히 몸이 아름다우냐? 구하지 대고, 풀밭에 심장은 만천하의 없으면, 별과 구할 것이다. 따뜻한 따뜻한 가치를 없으면 있다.
		구하지 있으며, 청춘이 때문이다. 꽃이 낙원을 가슴에 그러므로 주는 대중을 무한한 사막이다. 그들의 이성은 피가 같이 것이다. 주며, 웅대한 청춘은 눈이 있으랴?
		인생을 웅대한 유소년에게서 피부가 아니더면, 무엇을 보배를 소리다.이것은 예가 끓는다.
	</div>
	
	<!-- 해시태그 -->
	<div id="qna_view_hashtag">
		#봄바람 #희망 #청춘
	</div>
	
	<!-- 댓글 -->
	<div id="qna_view_repl">
		<!-- 작성자프로필사진+닉네임 -->
		<div id="qna_view_repl_profile">
			<span id="qna_view_repl_profile_profileimage">
				<img id="qna_view_repl_profile_profileimage_file" src="images/index_default.png" style="width:20px; height:20px;">
			</span>
			<span id="qna_view_profile_nickname">
				<span>천사</span>
			</span>
	</div>
	</div>
</form>

</body>
</html>