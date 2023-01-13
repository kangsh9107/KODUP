/**
 * mansearch.js
 */
var frm;
var param;
var memberid = document.querySelector('.member_id');
$(document).ready(function () {
	$('#summernote').summernote({
		placeholder: '내용을 입력해주세요.',
		height: 400,
		maxHeight: 300,
		popover: { //footer 밑 쓸모 없는 메뉴 삭제
		
		}
	});
});

mansearch_view = function(mansearch_sno){
	frm = $('.mansearch_search')[0];
	frm.mansearch_sno.value = mansearch_sno;
	param = $(frm).serialize();
	$.post("/mansearch/mansearch_view", param, function(data){
	    $('#center').html(data);
	})	
}

$('.mansearch_insert').on('click',function(){
	param = $('.mansearch_search').serialize();
	$.post('/mansearch/mansearch_insert',param, function(data){
		$('#center').html(data);
	})
});

$('.mansearch_update').on('click',function(){
   $('#center').load('/mansearch/mansearch_update');
});

$('.mansearch_board_cancel').on('click',function(){
	window.scrollTo(0,0);
	$('#center').load('/mansearch/mansearch');
});

$('.mansearch_update').on('click',function(){
	$('#center').load('/mansearch/mansearch_update');
});

$('.mansearch_board_insertR').on('click',function(){
	window.scrollTo(0,0);
	memberid.value = sessionId;
	frm = $('.mansearch_input_form')[0];
	console.log($('.corp_logo_insert').val());
	param = new FormData(frm);
	$.ajax({
		type :'post',
		url : '/mansearch/mansearch_insertR',
		contentType : false,
    	processData : false,
    	data : param,
    	dataType : 'html',
    	success : function(data){
			if(data != '') alert(data);
			frm.enctype='';
			param = $(frm).serialize();
	 		$('#center').load('/mansearch/mansearch',param);
		}
	})
	
})