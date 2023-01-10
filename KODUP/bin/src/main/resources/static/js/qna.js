/**
 * qna.jsp
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
	$('.view_summernote').summernote({
	    placeholder: '내용을 입력해주세요.',
	    height: 100,
	    maxHeight: 100,
	    popover: { 
	        image: [],
	        link: [],
	        air: []
	    }
	});
});

/***** QNA INSERT *****/
$('.btnQnaInsert').on('click', function() {
	$('#center').load('/qna/qna_insert');
});

/***** QNA SEARCH *****/
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
	$('#center').load('/qna/qna');
});





/***** 조성호 *****/
/***** QNA VIEW *****/
function qna_view() {
	$('#center').load('/qna/qna_view');
}

$('.btnUpdate').on('click', function() {
	$('#center').load('/qna/qna_update');
});
