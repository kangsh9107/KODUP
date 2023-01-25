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

// list에서 view로 들어갈 때 호출하는 함수
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

// 페이징처리 함수
mansearch_Move = function(nowPage){
	frm = $('.mansearch_search')[0];
	frm.nowPage.value = nowPage;
	param = $(frm).serialize();
	$.post("/mansearch/mansearch", param, function(data){
	    $('#center').html(data);
	})
}

// findStr에서 엔터 눌렀을 때 검색되게 처리
$('.inputSearch').on('keyup',function(event) {
	if(event.keyCode == 13) {
		$('.btnSearch').click();
	}
});

// findStr 검색버튼
$('.btnSearch').on('click',function(){
	frm = $('.mansearch_search')[0];
	frm.nowPage.value = 1;
	param = $(frm).serialize();
	$('#center').load("/mansearch/mansearch", param);
});

// 새로고침
$('.btnRefresh').on('click', function(){
	$('#center').load('/mansearch/mansearch');
});

// 구인등록
$('.mansearch_insert').on('click',function(){
	param = $('.mansearch_search').serialize();
	$.post('/mansearch/mansearch_insert',param, function(data){
		$('#center').html(data);
	})
});

// view > 수정버튼
$('.mansearch_update').on('click',function(){
	frm = $('.mansearch_frm')[0];
	frm.premium_review_sno.value=0;
	param = $(frm).serialize();
	$.post("/mansearch/mansearch_update",param,function(data){
	   $('#center').html(data);		
	})
});

// view에서 다시 목록으로 돌아가는 버튼
$('.btnMansearch').on('click', function(){
    param = $('.mansearch_frm').serialize();
    $.post("/mansearch/mansearch", param, function(data){
    	$('#center').html(data);
   	})
})

// 구인등록 & 정보수정 > 취소버튼
$('.mansearch_board_cancel').on('click',function(){
	window.scrollTo(0,0);
	$('#center').load('/mansearch/mansearch');
});

// 구인등록 > 저장버튼
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

// view > 삭제버튼
$('.mansearch_deleteR').on('click',function(){
	let yn = confirm('글을 삭제하시겠습니까?');
	if(!yn) return;	
	frm = $('.mansearch_frm')[0];
	frm.premium_review_sno.value=0;
	param = $(frm).serialize();
	$.post("/mansearch/mansearch_delete",param,function(data){
		$('#center').html(data);
	})
})

// update > 저장버튼
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

// 프리미엄리뷰 보기
premiumView = function(form){
	var yn = confirm('정말 200픽셀을 사용하여 프리미엄 리뷰를 보시겠습니까?');
	if(!yn) return;
	var pixel = document.querySelector(".pixel");
	frm = $('.mansearch_frm')[0];
	frm.writer_id.value = form.writer_id.value;
	frm.premium_review_sno.value = form.premium_review_sno.value;
	param = new FormData(frm);
	if(pixel.value >= 200){		
		var img = form.querySelector('.blur');
		img.style.display='none';
		var doc_blind_wrap = form.querySelector('.doc_blind_wrap');
		doc_blind_wrap.remove();
		$.ajax({
		type :'post',
		url : '/mansearch/premium_review',
		contentType : false,
    	processData : false,
    	data : param,
    	dataType : 'html',
    	success : function(data){
	 		$(form).find($('.premium_review_doc')).html(data);
		}
	})
	}else{
		window.scrollTo(0,0);
		alert('보유 픽셀이 부족합니다. 충전 후 이용해주세요');
		var title  = 'popup';
		var status = 'toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=850, height=600, top=100, left=400';
		var popup = window.open("/pixel/pixel_buy_popup", title, status);
	}
}

// 프리미엄리뷰 등록
$('.premium_review_insert').on('click',function(){
	var yn = confirm('리뷰를 등록하시겠습니까?\n작성 후 수정이나 삭제는 관리자에게 문의바랍니다.');
	if(!yn) return;
	frm = $('.mansearch_frm')[0];
	frm.review.value = $('.premium_review_doc').val();
	frm.id.value = frm.buyer_id.value;
	frm.premium_review_sno.value=0;
	param = new FormData(frm);
	$.ajax({
		type :'post',
		url : '/mansearch/mansearch_reviewR',
		contentType : false,
    	processData : false,
    	data : param,
    	dataType : 'html',
    	success : function(data){
			if(data != '') alert(data);
			param = $(frm).serialize();
	 		$('#center').load('/mansearch/mansearch_view',param);
		}
	})
})