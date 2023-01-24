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

$('.btnListU').on('click', function() {
	var frm = $('#qna_view')[0];
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_list_back',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

$('.btnListUInfoshare').on('click', function() {
	var frm = $('#infoshare_view')[0];
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/infoshare/infoshare_list_back',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

$('.btnListUFreetalking').on('click', function() {
	var frm = $('#freetalking_view')[0];
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/infoshare/freetalking_list_back',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

$('.btnListUJobsearch').on('click', function() {
	var frm = $('#jobsearch_view')[0];
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/jobsearch/jobsearch_list_back',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
		}
	});
});

$('.btnHashtagU').on('click', function() {
	var frm = $('#qna_view')[0];
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

$('.btnListView').on('click', function() {
	var frm = $('.board_update_form')[0];
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_view',
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
$('.btnUpdate').on('click', function() {
	var frm = $('#qna_view')[0];
	var hashtag = $('#qna_view_hashtag2').text().trim().split('#');
	frm.hashtag.value = hashtag;
	var param = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: '/qna/qna_update',
		contentType: false,
		processData: false,
		data: param,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
			$('#summernote').summernote('code', $('textarea').text());
		}
	});
});

var temp = $('.board_update_form')[0];
if(temp != null) {
	var frm = $('.board_update_form')[0];
	var addHashtag = frm.hashtag.value.substring(1); //split('#')할때 공백값 생기는 것 방지
	var input = document.querySelector('input[name=basic]');
	var tagify = new Tagify(input);
	tagify.addTags(addHashtag);
	
	/* 태그 추가 확인용
	tagify.on('add', function() {
		console.log(tagify.value);
	});
	*/

	//updateR
	$('.btnQnaUpdateR').on('click', function() {
		var frm = $('.board_update_form')[0];
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
		} else {
			var param = new FormData(frm);
			
			$.ajax({
				type: 'POST',
				url: '/qna/qna_updateR',
				contentType: false,
				processData: false,
				data: param,
				dataType: 'html',
				success: function(data) {
					if(data == 'error_update') {
						alert('글 수정 오류입니다. 잠시후 다시 시도해주세요.')
					} else {
						$('#center').html(data);
					}
				}
			});
		}
	});
}