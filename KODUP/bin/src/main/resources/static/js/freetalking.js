/**
 * freetalking.jsp
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

/***** FREETALKING INSERT *****/
$('.btnFreetalkingInsert').on('click', function() {
	$('#center').load('/freetalking/freetalking_insert');
});

/***** FREETALKING SEARCH *****/
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
	$('#center').load('/freetalking/freetalking');
});





/***** 조성호 *****/
/***** FREETALKING VIEW *****/
function freetalking_view(){
	 $('#center').load('/freetalking/freetalking_view');
}

$('.btnUpdate').on('click', function() {
	$('#center').load('/freetalking/freetalking_update');
});