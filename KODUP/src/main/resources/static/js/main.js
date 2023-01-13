/**
 * main.jsp
 */

/***** QNA LIST *****/
$('.btnQna').on('click', function() {
	$('#center').load('/qna/qna');
});

/***** INFOSHARE LIST *****/
$('.btnInfoshare').on('click', function() {
	$('#center').load('/infoshare/infoshare');
});

/***** FREETALKING LIST *****/
$('.btnFreetalking').on('click', function() {
	$('#center').load('/freetalking/freetalking');
});

/***** NOTIFICATION LIST *****/
$('.btnNotification').on('click', function() {
	$('#center').load('/notification/notification');
});

