/**
 * index.jsp
 */

/***** 강수형 *****/
/***** MAIN *****/
$('#center').load('/login/main');

/***** MANTOMAN *****/
$(document).ready(function() {
	$(window).scroll(function() {
		var position = $(window).scrollTop()+800; 
		$(".btnMantoman").stop().animate({top:position+"px"},400);
	});
});

/***** LOGIN *****/
$('.index_btnLogin').on('click', function() {
	$('#center').load('/login/login');
});

/***** INSERT *****/
$('.btnQna').on('click', function() {
	$('#center').load('/qna/qna');
});





/***** 이세형 *****/
$('#btnMyprofile').on('click', function() {
   $('#center').load('/profile/member_profile'); 
});





/***** 박요한 *****/
$('.mansearch').on('click',function(){
   $('#center').load('/mansearch/mansearch');
});
$('.pixelbuy').on('click',function(){
   $('#center').load('/pixel/pixel_buy');
});