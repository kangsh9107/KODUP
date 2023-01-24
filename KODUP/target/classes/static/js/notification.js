/**
 * notification.jsp
 */

/***** 강수형 *****/
/***** SUMMERNOTE *****/
var fonts = ['맑은 고딕', '돋움', '궁서', '굴림', '굴림체', '궁서체', '나눔 고딕', '바탕', '바탕체', '새굴림'];
fonts.sort();
var loadInterval=[];
var intervalCnt=0;
$('#summernote').summernote({
	height: 400,     //에디터 높이
	minHeight: null, //최소 높이
	maxHeight: null, //최대 높이
	focus: true,     //에디터 로딩후 포커스를 맞출지 여부
	fontNames : fonts,
	lang: "ko-KR",
	callbacks: {	 //이미지 첨부 콜백함수
		onMediaDelete : function(target) {
			deleteFile(target[0].src);
		},
		onImageUpload : function(files, editor, welEditable) {
			loadInterval.length = files.length;
			$('#summer').addClass('spinner'); //spinner
			for(var i=files.length-1; i>=0; i--) {
				sendFile(i, files[i], this);
			}
		}
	}
});

function sendFile(intervalPos, file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '/common/summernoteFileUpload',
		enctype : 'multipart/form-data',
		cache : false,
		contentType : false,
		processData : false,
		success : function(img_name) {
			loadInterval[intervalPos] = setInterval(loadCheck.bind(null, intervalPos, img_name), 1500);
		}
	});
}

function loadCheck(intervalPos, img) {
	try {
		var t = new Image();
		t.src = img;
		t.onload = function(){
			clearInterval(loadInterval[intervalPos]);
			$('#summernote').summernote('editor.insertImage', img);
			$('#summer').removeClass('spinner'); //spinner
		}
	} catch(err) {
		console.log(err);
	} finally {
		console.log('loadCheck finally');
	}
}

function deleteFile(target) {
	console.table("target:" + target)
	$.ajax({
		data : {
			target : target
		},
		type : "POST",
		url : '/common/summernoteFileUpload?flag=delete', //replace with your url
		cache : false,
		success : function(resp) {
			console.log(resp);
		}
	});
}

/***** NOTIFICATION INSERT *****/
$('.btnNotificationInsert').on('click', function() {
	$('#center').load('/notification/notification_insert');
});

/***** NOTIFICATION SEARCH *****/
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
	$('#center').load('/notification/notification');
});






/***** 조성호 *****/
/***** notification VIEW *****/

/*------------------------------------------------ */

function notification_view(sno){
	frm = $('.board_search_form')[0];
    frm.sno.value = sno;
    param = $(frm).serialize();
    $.post("/notification/notification_view", param, function(data){
        $('#center').html(data);
    })
}

/*
function notification_view(){
	 $('#center').load('/notification/notification_view');
}
*/
/*------------------------------------------------- */





function notification_view_findHashtag(hashtag){
	//해시태그클릭시 해당태그로 검색된 검색결과리스트출력
	//지금은 일단 콘솔로그만 찍어줌
	console.log(hashtag);
}
$(document).ready(function () {
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
$('.btnBoardtype').on('click', function() {
	$('#center').load('/notification/notification');
});



//게시글 본문 토글함수(대댓입력,댓글접기)
function insertFormToggle(repl_sno){
   console.log($('#view_sessionID').val());
    var replInsertSectionId = "repl_insert_section"+repl_sno;
    var insertCon = $('#' + replInsertSectionId).css("display");
    
    if( insertCon == "none"){
        $('#' +replInsertSectionId).css('display','block');
    }
    else {
        $('#' +replInsertSectionId).css('display','none');
    }
}

function innerReplToggle(grp){
    var replInnerSectionId = "repl_inner_section"+grp;
    var replInnerCon = $("." + replInnerSectionId).css("display");
    if( replInnerCon == "none"){
        $('.' +replInnerSectionId).css('display','block');
    }
    else {
        $('.' +replInnerSectionId).css('display','none');
    }
}




//추천,비추천
$('#btn_viewpage_thumbup').on('click', function(){
    var param = $('#notification_view').serialize();
    var thumb = $('#thumb').text();
    $('#thumb').text(Number(thumb)+1);
    $.post("/notification/notification_view/thumbup", param, function(data){})
  	var thumb_standard = $('#thumb_standard').val();
    if(Number(thumb) >= thumb_standard){
    	$('#btn_viewpage_thumbup').attr("disabled", true);//버튼비활성화;추후고도화:컬럼추가하여id당 해당sno에 추천이나 비추천한경우 더이상 선택할수없게 제어
		$('#btn_viewpage_thumbdown').attr("disabled", false);
	} 
})
$('#btn_viewpage_thumbdown').on('click', function(){
    var param = $('#notification_view').serialize();
    var thumb = $('#thumb').text();
    $('#thumb').text(Number(thumb)-1);
    $.post("/notification/notification_view/thumbdown", param, function(data){})
    	var thumb_standard = $('#thumb_standard').val();
    if(Number(thumb) <= thumb_standard){
	    $('#btn_viewpage_thumbdown').attr("disabled", true);//버튼비활성화;추후고도화:컬럼추가하여id당 해당sno에 추천이나 비추천한경우 더이상 선택할수없게 제어
		$('#btn_viewpage_thumbup').attr("disabled", false);
	}
})


//본문글Btnzone
//btnDeleteR
$('.btnDeleteR').on('click', function(){
    let yn = confirm('자료를 삭제하시겠습니까 ?');
    if( !yn ) return;
    
    var param = $('#notification_view').serialize();
    $.post("/notification/notification_view/deleteR", param, function(data){
       $('#center').html(data);
    })
})


//댓글Btn
function view_repl_deleteR(repl_sno){
	var yn = confirm('댓글을 삭제하시겠습니까 ?');
    if( !yn ) return;
    
    var frm = $('#notification_view')[0];
    frm.repl_sno.value=repl_sno;
    
    var param = $('#notification_view').serialize();
    $.post("/notification/notification_view/ReplDeleteR", param, function(data){
       $('#center').html(data);
    })
}



//본문 댓글 입력
function view_insert_repl(){
  	//메인서머노트 값 가져오기
    var summernoteContent = $('#view_main_summernote').summernote('code'); 
    var sessionId = $('.sessionId_hidden').val();
    var sno = $('#view_sno').val();	//없어도될듯 콘솔찍어보기위함
    
    //가져온 서머노트 값을 폼태그안에 히든태그로 넣어줌
    $('#view_summer_code').text(summernoteContent);
    
	var param = $('#notification_view').serialize();
    $.post("/notification/notification_view/insertRepl", param, function(data){
       $('#center').html(data);
    })
	
}

//본문 대댓글 입력

function view_insert_innerRepl(grp){
//대댓서머노트 코드 가져오기
  	var summernoteSerial = "view_inner_summernote"+grp;
    var summernoteContent = $('#' + summernoteSerial).summernote('code'); 
    var sessionId = $('#sessionId_hidden').val();
    var sno = $('#view_sno').val();
    
    //매개변수로 받아온 grp를 폼태그안에 히든태그에 넣어줌
    $('#insert_inner_repl_grp').attr("value",grp);
    
    
    //가져온 서머노트 코드를 폼태그안에 히든태그에 넣어줌
    $('#view_summer_code').text(summernoteContent);
    
	var param = $('#notification_view').serialize();
    $.post("/notification/notification_view/insertInnerRepl", param, function(data){
       $('#center').html(data);
    })
	
}

function view_update_Repl_open(repl_sno){
	var save_repl_doc = $("#save_repl_doc"+repl_sno).val();//서머code
	var view_update_summer = $("#view_update_Repl_summernote"+repl_sno);//summernote
	var updateReplSection = $("#updateReplSection"+repl_sno);//div
	
	//수정서머노트폼에 이전입력내용 받아오기
	view_update_summer.summernote('code', save_repl_doc);
	
	//수정버튼 인서트폼 접기/펴기
	if(updateReplSection.css("display")=="none"){
		updateReplSection.css('display','block');
	}else{
		updateReplSection.css('display','none');
	}
}

function view_login(){
	$('#center').load('/login/login');
}

function updateReplCancel(repl_sno){
	var updateReplSection = $("#updateReplSection"+repl_sno);
	updateReplSection.css('display','none');
}


function updateReplUpdate(repl_sno){
	var yn = confirm('댓글을 수정하시겠습니까 ?');
    if( !yn ) return;
    
	var view_update_summer = $("#view_update_Repl_summernote"+repl_sno);
	view_update_summer.summernote('code');
	
    
    var frm = $('#notification_view')[0];
    frm.repl_sno.value=repl_sno;
    frm.repl_doc.value=view_update_summer.summernote('code');
    var param = $('#notification_view').serialize();
    $.post("/notification/notification_view/ReplUpdateR", param, function(data){
       $('#center').html(data);
     })
}