/**
 mypage_pixel.js
 */


$('.btn_mypage_pixel_charge').on('click', function(){
	console.log("충전페이지로 이동");
	$('#center').load('/pixel/pixel_buy');	
});
