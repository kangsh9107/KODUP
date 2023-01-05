/**
 * index.jsp
 */

/***** MANTOMAN *****/
$(document).ready(function() {
	$(window).scroll(function() {
		var position = $(window).scrollTop()+800; 
		$(".btnMantoman").stop().animate({top:position+"px"},400);
	});
});
