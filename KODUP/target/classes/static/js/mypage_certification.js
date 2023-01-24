/**
 mypage_certification.js (마이페이지_인증) 
 */

//이메일 인증
$('.btn_email_certification').on('click', function(){
	console.log("이메일 인증");
	
	$('#m_section2').load('/board/mypage_email_certification');
});


//계좌인증
$('.btn_account_certification').on('click', function(){
	console.log("계좌 인증");
	
	$('#m_section2').load('/board/mypage_account_certification');
}); 
 
 
 
//mypage_mentor_certification (인증페이지_멘토인증)
$('.btn_mentor_certification').on('click', function(){
	console.log("멘토인증");

	var frm = $('mentor_certification')[0];
	var param = new FormData(frm);
	
	 $.ajax({
		 type : 'POST',
		 url : '/board/mypage_mentor_certification',
		 contentType : false,
		 processData : false,
		 data : param,
		 dataType : 'html',
		 success: function(data){
			 
		 }						
	 })

	$('#m_section2').load('/board/mypage_certification');  //???
});


 
//mypage_corp_certification (인증페이지_기업인증)
$('.btn_corp_certification').on('click', function(){
	console.log("기업인증");
	
	var frm = $('.corp_certification')[0];
	var param = new FormData(frm);
	 
	 $.ajax({
		 type : 'POST',
		 url : '/board/mypage_corp_certification',
		 contentType : false,
		 processData : false,
		 data : param,
		 dataType : 'html',
		 success: function(data){
			 
		 }						
	 })
	 
 })
	
	$('#m_section2').load('/board/mypage_corp_certification');
