/**
 * index.jsp
 */

/***** 강수형 *****/
/***** MANTOMAN *****/
$(document).ready(function() {
	$(window).scroll(function() {
		var position = $(window).scrollTop()+800; 
		$(".btnMantoman").stop().animate({top:position+"px"},400);
	});
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