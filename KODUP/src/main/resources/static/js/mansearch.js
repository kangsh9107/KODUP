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

premiumView = function(form){
	var yn = confirm('정말 200픽셀을 사용하여 프리미엄 리뷰를 보시겠습니까?');
	if(!yn) return;
	var pixel = document.querySelector(".pixel");
	pixel.value=0;
	frm = $('.mansearch_frm')[0];
	frm.writer_id.value = form.writer_id.value;
	frm.premium_review_sno.value = form.premium_review_sno.value;
	param = new FormData(frm);
	if(pixel.value >= 200){		
		var img = form.querySelector('.blur');
		img.style.display='none';
		$('.doc_blind_wrap').remove(); 
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

$('.premium_review_insert').on('click',function(){
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