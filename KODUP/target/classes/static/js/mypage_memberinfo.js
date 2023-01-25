/**
 mypage_memberinfo.js (마이페이지_회원정보)
 */
 
//mypage_memberinfo_quit (회원탈퇴) 
$('.btnQuit').on('click', function(){
	console.log("탈퇴");
	$('#m_section2').load('/board/mypage_memberinfo_quit');
});


//mypage_memberinfo_update (회원정보 수정) 
$('.btnUpdate').on('click', function(){
	console.log("회원정보 수정");
	$('#m_section2').load('/board/mypage_memberinfo_update');
});




 