/**
 mypage_pixel.js
 */


$('.btnQuit').on('click', function(){
	console.log("탈퇴");
	$('#m_section2').load('/board/mypage_memberinfo_quit');
});
 
$('.btn_mypage_pixel_charge').on('click', function(){
	console.log("충전페이지로 이동");
	$('#center').load('/pixel/pixel_buy');	
});
