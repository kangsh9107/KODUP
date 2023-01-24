/**
 * mypage.js
 */
 
//mypage
 $('#m_section2').load('/board/mypage_memberinfo');

//mypage_memberinfo (회원정보)
 $('.HN_btnMyPage').on('click', function(){
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

//나의 보유 픽셀
/*
$('.btnMyPixel').on('click', function(){
   console.log("보유픽셀");
   $('#m_section2').load('/board/mypage_mypixel_have');
});
*/



//mypage_certification (인증)
$('.btnCertification').on('click', function(){
   console.log("인증");
   $('#m_section2').load('/board/mypage_certification');
});