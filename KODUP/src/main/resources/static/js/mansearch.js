/**
 * mansearch.js
 */
var frm;
var param;
var memberid = document.querySelector('.member_id');
var subdivision = document.querySelector('#subdivision');
$(document).ready(function () {
	$('#summernote').summernote({
		placeholder: '내용을 입력해주세요.',
		height: 400,
		maxHeight: 300,
		popover: { //footer 밑 쓸모 없는 메뉴 삭제
		
		}
	});
});

$('#mansearch_sort').on('change',function(){
	var data = {
		"포지션" : ["프론트엔드","백엔드","풀스택"],
		"지역"  : ["서울","인천","충청도","전라도","경상도","강원도","제주도"],
		"급여"  : ["300만원 이상","500만원 이상","700만원 이상","1000만원 이상","1500만원 이상"],
		"경력"  : ["경력 무관","신입","3년 이상","5년 이상","7년 이상","10년 이상","15년 이상"],
		"학력"  : ["학력 무관","고졸 이상","전문학사 이상","학사 이상","석사 이상"]
	};
	frm = document.querySelector('.mansearch_search');
	var k = $('#mansearch_sort').val();
	var sub = data[k];
	var html;
	for(s of sub){
	html += `<option value="${s}"> ${s} </option>`;
	} 
	frm.subdivision.innerHTML = html;
	
})
$("select[name=subdivision]").change(function(){
	frm = document.querySelector('.mansearch_search');
	frm.position.value = $("select[name=subdivision] option:selected").val();
});
mansearch_view = function(mansearch_sno){
	frm = $('.mansearch_search')[0];
	frm.mansearch_sno.value = mansearch_sno;
	frm.id.value = sessionId;
	console.log(sessionId);
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

premiumView = function(){
	frm = $('.mansearch_frm')[0];
	param = $(frm).serialize(); 
	var img = document.querySelector('.blur');
	img.style.display='none';
	$('.doc_blind_wrap').remove();
	$('.btn-close').click();
	$.post("/mansearch/premium_review",param,function(data){
	   $('.premium_review_doc').html(data);		
	})
}