/**
 * mypage.js
 */
 
//mypage
//$('.Mypage').on(
 
//mypage_memberinfo (회원정보)
 $('.btnMypage').on('click', function(){
 	console.log("회원정보");
 	$('#center').load('/board/mypage');
 });

 $('.btnMypage').on('click', function(){
 	$('#m_section2').load('/board/mypage_memberinfo');
 });
 

  $('.btnMyPage').on('click', function(){
 	console.log("회원정보");
 	$('#m_section2').load('/board/mypage_memberinfo');
 });

//mypage_dailycheck (출석체크)
$('.btnDailyCheck').on('click', function(){
	$('#m_section2').load('/board/mypage_dailycheck');
});

//mypage_mypixel (나의 픽셀)
$('.btnMyPixel').on('click', function(){
	console.log("픽셀~");
	$('#m_section2').load('/board/mypage_mypixel');
});

//mypage_certification (개인 인증)
$('.btnCertification').on('click', function(){
	console.log("ㅇㅈ");
	$('#m_section2').load('/board/mypage_certification');
});


//mypage_quit (회원탈퇴) 
$('.btnQuit').on('click', function(){
	console.log("탈퇴");
	$('#m_section2').load('/board/mypage_quit');
});


//mypage_corp_certification (기업인증)