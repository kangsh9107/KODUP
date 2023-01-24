/**
 * notification.jsp
 */

/***** 강수형 *****/
/***** SUMMERNOTE *****/
$(document).ready(function () {
	$('#summernote').summernote({
		placeholder: '내용을 입력해주세요.',
		height: 400,
		maxHeight: 300,
		popover: { //footer 밑 쓸모 없는 메뉴 삭제
			image: [],
			link: [],
			air: []
		}
	});
});

/***** NOTIFICATION INSERT *****/
$('.btnNotificationInsert').on('click', function() {
	$('#center').load('/notification/notification_insert');
});

/***** NOTIFICATION SEARCH *****/
$('.inputSearch').keyup(function(evnet) {
	if(event.keyCode == 13) {
		$('.btnSearch').click();
	}
});

$('.btnSearch').click(function() {
	console.log("검색");
});

/***** BACK TO LIST *****/
$('.btnList').on('click', function() {
	$('#center').load('/notification/notification');
});





/***** 조성호 *****/
/***** NOTIFICATION VIEW *****/
function notification_view(){
	 $('#center').load('/notification/notification_view');
}

$('.btnUpdate').on('click', function() {
	$('#center').load('/notification/notification_update');
});
