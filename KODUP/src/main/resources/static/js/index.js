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

$('#btnMantoman').on('click',function() {
	var title  = "popup";
	var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=350, height=500, top=400, left=1300"; 
	window.open("/mantoman/mantoman_index", title, status);
});


/***** 박요한 *****/
$('.mansearch').on('click',function(){
   $('#center').load('/mansearch/mansearch');
});
$('.pixelbuy').on('click',function(){
   $('#center').load('/pixel/pixel_buy');
});