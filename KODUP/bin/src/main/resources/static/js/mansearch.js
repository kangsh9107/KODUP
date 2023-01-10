/**
 * mansearch.js
 */
$('.index_doc').on('click',function(){
   $('#center').load('/mansearch/mansearch_view');
});
$('.mansearch_insert').on('click',function(){
   $('#center').load('/mansearch/mansearch_insert');
});
$('.mansearch_update').on('click',function(){
   $('#center').load('/mansearch/mansearch_update');
});

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

$('.mansearch_board_cancel').on('click',function(){
	window.scrollTo(0,0);
	$('#center').load('/mansearch/mansearch');
});
$('.mansearch_update').on('click',function(){
	$('#center').load('/mansearch/mansearch_update');
});