/**
 * jobsearch.jsp
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
});

/***** JOBSEARCH INSERT *****/
$('.btnJobsearchInsert').on('click', function() {
	$('#center').load('/jobsearch/jobsearch_insert');
});

/***** JOBSEARCH SEARCH *****/
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
	$('#center').load('/jobsearch/jobsearch');
});





/***** 조성호 *****/
/***** jobsearch VIEW *****/

/*------------------------------------------------ */
/*
function jobsearch_view(sno){
	frm = $('.frm_search')[0];
    frm.sno.value = sno;
    param = $(frm).serialize();
    $.post("/jobsearch/jobsearch_view", param, function(data){
        $('#center').html(data);
    })
}
*/

function jobsearch_view(){
	 $('#center').load('/jobsearch/jobsearch_view');
}
/*------------------------------------------------- */





function jobsearch_view_findHashtag(hashtag){
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
	$('#center').load('/jobsearch/jobsearch');
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
    var param = $('#jobsearch_view').serialize();
    var thumb = $('#thumb').text();
    $('#thumb').text(Number(thumb)+1);
    $.post("/jobsearch/jobsearch_view/thumbup", param, function(data){})
  	var thumb_standard = $('#thumb_standard').val();
    if(Number(thumb) >= thumb_standard){
    	$('#btn_viewpage_thumbup').attr("disabled", true);//버튼비활성화;추후고도화:컬럼추가하여id당 해당sno에 추천이나 비추천한경우 더이상 선택할수없게 제어
		$('#btn_viewpage_thumbdown').attr("disabled", false);
	} 
})
$('#btn_viewpage_thumbdown').on('click', function(){
    var param = $('#jobsearch_view').serialize();
    var thumb = $('#thumb').text();
    $('#thumb').text(Number(thumb)-1);
    $.post("/jobsearch/jobsearch_view/thumbdown", param, function(data){})
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
    
    var param = $('#jobsearch_view').serialize();
    $.post("/jobsearch/jobsearch_view/deleteR", param, function(data){
       $('#center').html(data);
    })
})


//댓글Btn
function view_repl_deleteR(repl_sno){
	var yn = confirm('댓글을 삭제하시겠습니까 ?');
    if( !yn ) return;
    
    var frm = $('#jobsearch_view')[0];
    frm.repl_sno.value=repl_sno;
    
    var param = $('#jobsearch_view').serialize();
    $.post("/jobsearch/jobsearch_view/ReplDeleteR", param, function(data){
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
    
	var param = $('#jobsearch_view').serialize();
    $.post("/jobsearch/jobsearch_view/insertRepl", param, function(data){
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
    
	var param = $('#jobsearch_view').serialize();
    $.post("/jobsearch/jobsearch_view/insertInnerRepl", param, function(data){
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
	
    
    var frm = $('#jobsearch_view')[0];
    frm.repl_sno.value=repl_sno;
    frm.repl_doc.value=view_update_summer.summernote('code');
    var param = $('#jobsearch_view').serialize();
    $.post("/jobsearch/jobsearch_view/ReplUpdateR", param, function(data){
       $('#center').html(data);
     })
}