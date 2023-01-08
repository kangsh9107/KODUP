/**
 * infoshare.jsp
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

/***** INFOSHARE INSERT *****/
$('.btnInfoshareInsert').on('click', function() {
	$('#center').load('/infoshare/infoshare_insert');
});

/***** INFOSHARE SEARCH *****/
$('.inputSearch').keyup(function(evnet) {
	if(event.keyCode == 13) {
		$('.btnSearch').click();
	}
});

$('.btnSearch').click(function() {
	console.log("검색");
});





/*****조성호 *****/
function infoshare_view(){
	 $('#center').load('/infoshare/infoshare_view');
}
