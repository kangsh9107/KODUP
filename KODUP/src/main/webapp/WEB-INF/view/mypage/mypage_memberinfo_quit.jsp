<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script>


$('.btnQuit_Irreversible').on('click', function(){
	alert("탈퇴완료");
	$('#center').load('/board/mypage_memberinfo_quit_real');
	/* $('#center').load('/login/main'); */
	
});
</script>

<meta charset="UTF-8">
<title>member_quit</title>
</head>
<body>

<div id='member_quit'>
	<span class='mypage_subject_text'>탈퇴 안내</span><br><br>
	<font color='66667a'>
	
	
회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
<br><br>
사용하고 계신 아이디(     "A001"    )는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
<br><br>
탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.
회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
<br><br>
메일	    메일 계정 및 보관 중인 메일 삭제
블로그	블로그 계정 및 게시물 삭제
포스트	포스트 계정 및 게시물 삭제
VIBE, 네이버뮤직	이용약관 동의 철회, 플레이리스트, '좋아요'한 노래 등 삭제
modoo!(모두)	등록된 홈페이지 및 게시물 삭제
<br><br>
더보기
탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
뉴스, 카페, 지식iN 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
게시판형 서비스 중 "그라폴리오"의 댓글은 삭제됩니다.
<br><br>
지식iN	질문, 답변, 의견, eXpert 리뷰, eXpert 평점 (단, 질문자/답변자 아이디가 비공개 처리됨)
카페	게시물 및 댓글
네이버 비즈니스 스쿨	게시글, 질문, 답변, 댓글 및 좋아요 등
네이버 프리미엄 콘텐츠	댓글 및 좋아요
네이버TV	업로드한 영상, 댓글, 영상에 대한 '좋아요' 등
더보기
네이버 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
네이버 아이디로 로그인하여 사용 중이던 외부 사이트를 방문하여
다른 로그인 수단을 준비하거나, 데이터를 백업한 후 네이버 회원을 탈퇴해야 합니다.
<br><br>
네이버 아이디로 로그인을 통해 연동된 사이트 확인
탈퇴 후에는 아이디    "A001"     로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
또한, 네이버 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
<br><br><br>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
	  <label class="form-check-label" for="flexCheckDefault">
	   <font color='333333'> 안내 사항을 모두 확인하였으며, 이에 동의합니다.
	  </label></font>
	<button type="button" class="btn btn-outline-dark btnQuit_Irreversible">확인</button>
	</div>
	</font>
	<br><br>
개인정보처리방침 책임의 한계와 법적 고지 회원정보 고객센터
NAVER Copyright © NAVER Corp. All Rights Reserved.
</div>
</body>
</html>