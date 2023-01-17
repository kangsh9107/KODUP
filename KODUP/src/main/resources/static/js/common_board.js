/**
 * qna.jsp, infoshare.jsp, freetalking.jsp,
 * jobsearch.jsp, notification.jsp
 */

//SEARCH
function runQna(horse) {
	var frm = $('.board_search_form')[0];
	var sort = $("#sort option:selected").val();
	frm.sort.value = sort; //1: 최신순, 2: 추천순, 3: 댓글순, 4: 조회순
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
}

function changeSort() {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	if(horse == '전체') horse = ''; //horsehead가 전체인 경우는 없다
	frm.sort.value = sort;
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
}

$('.inputSearch').keyup(function(evnet) {
	if(event.keyCode == 13) {
		$('.btnSearch').click();
	}
});

$('.btnSearch').click(function() {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	if(horse == '전체') horse = '';
	frm.sort.value = sort;
	frm.nowPage.value = 1;
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

//hashtag quick search
function runHashtag(hashtag) {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	frm.sort.value = sort;
	frm.hashtag.value = hashtag;
	frm.nowPage.value = 1;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/login/find_hashtag',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
}

//Refresh
$('.btnRefresh').on('click', function() {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	if(horse == '전체') horse = '';
	frm.sort.value = sort;
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

$('.btnRefreshHashtag').on('click', function() {
	var frm = $('.board_search_form')[0];
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/login/find_hashtag',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

//Page
function movePage(nowPage) {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	if(horse == '전체') horse = '';
	frm.sort.value = sort;
	frm.nowPage.value = nowPage;
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
			if(nowPage == $('#totPage').val()) window.scrollTo(0, 0); //...을 눌러 마지막 페이지로 연결되면 스크롤 최상단으로 이동
		}
	});
}

function movePageEnd(nowPage) {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	if(horse == '전체') horse = '';
	frm.sort.value = sort;
	frm.nowPage.value = nowPage;
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			window.scrollTo(0, 0);
			$('#center').html(data);
		}
	});
}

function movePageHashtag(nowPage, hashtag) {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	frm.sort.value = sort;
	frm.hashtag.value = hashtag;
	frm.nowPage.value = nowPage;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/login/find_hashtag',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
			if(nowPage == $('#totPage').val()) window.scrollTo(0, 0);
		}
	});
}

function movePageHashtagEnd(nowPage, hashtag) {
	var frm = $('.board_search_form')[0];
	var sort = $('#sort option:selected').val();
	frm.sort.value = sort;
	frm.hashtag.value = hashtag;
	frm.nowPage.value = nowPage;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/login/find_hashtag',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			window.scrollTo(0, 0);
			$('#center').html(data);
		}
	});
}


//INSERT
$('.btnQnaInsert').on('click', function() {
	var frm = $('.board_search_form')[0];
	var sort = $("#sort option:selected").val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	frm.sort.value = sort;
	if(horse == '전체') horse = ''; //horsehead가 전체인 경우는 없다
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_insert',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

//INSERTR
$('.btnQnaInsertR').on('click', function() {
	var frm = $('.board_insert_form')[0];
	var sort = $("#sort option:selected").val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	frm.sort.value = sort;
	frm.horsehead.value = horse;
	//글 작성 말머리
	var qna_horsehead = document.querySelector('#qna_horsehead');
	var qna_horsehead_selected = qna_horsehead.options[qna_horsehead.selectedIndex].value;
	document.querySelector('#horsehead').value = qna_horsehead_selected;
	//글 작성 내용
	var summer = $('#summernote').summernote('code');
	frm.doc.value = summer;
	
	var regNumber = /^[0-9]+$/;
	if(qna_horsehead_selected == '말머리') {
		alert('말머리를 선택해주세요.');
		return;
	} else if(frm.subject.value.trim() == '') {
		alert('제목을 입력해주세요.');
		return;
	} else if(summer == '') {
		alert('내용을 입력해주세요.');
		return;
	} else if( regNumber.test(frm.qna_pixel_reward) || frm.qna_pixel_reward < 500 || frm.qna_pixel_reward == '') {
		alert('보상픽셀에 500픽셀 이상의 숫자를 입력해주세요.');
		return;
	} else {
		var param = new FormData(frm);
		
		$.ajax({
			type: 'POST',
			url: '/qna/qna_insertR',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				if(data == 'error_insert') {
					alert('글 작성 오류입니다. 잠시후 다시 시도해주세요.')
				} else {
					$('#center').html(data);
				}
			}
		});
	}
});

//리스트로
$('.btnList').on('click', function() {
	var frm = $('.board_insert_form')[0];
	var sort = $("#sort option:selected").val();
	var label = $('input[name=horsehead_radio]:checked').prop('labels');
	var horse = $(label).text();
	frm.sort.value = sort;
	frm.horsehead.value = horse;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

//update
$('.btnUpdate').on('click', funtionc() {
	
});