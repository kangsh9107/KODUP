/**
 mypage_memberinfo_quit.js
 */

//(board = function(){
	


$('.btnQuit_Irreversible').on('click', function(){
	console.log("탈퇴완료");
	
	frm = $('.frm')[0];
	param = $('.frm').serialize();
	$.post("/board/mypage_memberinfo_quit_real", param, function(data){
		$('#m_section2').html(data);
	});
	
	//$('#center').load('/board/mypage_memberinfo_quit_real');
	//$('#center').load('/login/main'); 
});
	
	