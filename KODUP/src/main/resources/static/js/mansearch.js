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
mansearch_Move = function(nowPage){
	frm = $('.mansearch_search')[0];
	frm.nowPage.value = nowPage;
	param = $(frm).serialize();
	$.post("/mansearch/mansearch", param, function(data){
	    $('#center').html(data);
	})
}
$('.mansearchBtnSearch').on('click',function(){
	frm = $('.mansearch_search')[0];
	frm.nowPage.value = 1;
	param = $(frm).serialize();
	$('#center').load("/mansearch/mansearch", param);
});
$('.mansearch_insert').on('click',function(){
	param = $('.mansearch_search').serialize();
	$.post('/mansearch/mansearch_insert',param, function(data){
		$('#center').html(data);
	})
});

$('.mansearch_update').on('click',function(){
	frm = $('.mansearch_frm')[0];
	param = $(frm).serialize();
	$.post("/mansearch/mansearch_update",param,function(data){
	   $('#center').html(data);		
	})
});

$('.mansearch_board_cancel').on('click',function(){
	window.scrollTo(0,0);
	$('#center').load('/mansearch/mansearch');
});


$('.mansearch_board_insertR').on('click',function(){
	window.scrollTo(0,0);
	memberid.value = sessionId;
	frm = $('.mansearch_input_form')[0];
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

$('.mansearch_deleteR').on('click',function(){
	let yn = confirm('글을 삭제하시겠습니까?');
	if(!yn) return;
	param = $('.mansearch_frm').serialize();
	$.post("/mansearch/mansearch_delete",param,function(data){
		$('#center').html(data);
	})
})

$('.mansearch_board_updateR').on('click',function(){
	window.scrollTo(0,0);
	memberid.value = sessionId;
	frm = $('.mansearch_update_form')[0];
	param = new FormData(frm);
	$.ajax({
		type :'post',
		url : '/mansearch/mansearch_updateR',
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
