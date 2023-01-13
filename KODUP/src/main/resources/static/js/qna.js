/**
 * qna.jsp
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

/***** QNA INSERT *****/
$('.btnQnaInsert').on('click', function() {
	$('#center').load('/qna/qna_insert');
});

/***** QNA UPDATE *****/
$('.btnUpdate').on('click', function() {
	$('#center').load('/qna/qna_update');
});

/***** QNA SEARCH *****/
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
	$('#center').load('/qna/qna');
});




/***** 조성호 *****/
/***** QNA VIEW *****/

//qna.jsp에서 목록클리시 뷰단으로이동
function qna_view(){
	$('#center').load('/qna/qna_view');
}
function qna_view_findHashtag(hashtag){
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
	$('#center').load('/qna/qna');
});



//게시글 본문 토글함수(대댓입력,댓글접기)
function insertFormToggle(repl_sno){
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
    console.log("리플섹션:"+replInnerSectionId);
    console.log("클릭된grp:"+grp);
    if( replInnerCon == "none"){
        $('.' +replInnerSectionId).css('display','block');
    }
    else {
        $('.' +replInnerSectionId).css('display','none');
    }
}




//추천,비추천
$('#btn_viewpage_thumbup').on('click', function(){
    var param = $('#qna_view').serialize();
    var thumb = $('#thumb').text();
    $('#thumb').text(Number(thumb)+1);
    $.post("/qna/qna_view/thumbup", param, function(data){})
})
$('#btn_viewpage_thumbdown').on('click', function(){
	//var qnaviewfrm = $('#qna_view');
    var param = $('#qna_view').serialize();
    var thumb = $('#thumb').text();
    $('#thumb').text(Number(thumb)-1);
    $.post("/qna/qna_view/thumbdown", param, function(data){})
})


//본문글Btnzone
//btnDeleteR
$('.btnDeleteR').on('click', function(){
    let yn = confirm('자료를 삭제하시겠습니까 ?');
    if( !yn ) return;
    
    var param = $('#qna_view').serialize();
    $.post("/qna/qna_view/deleteR", param, function(data){
       $('#center').html(data);
    })
})


//댓글Btn
function view_repl_deleteR(repl_sno){
	var yn = confirm('댓글을 삭제하시겠습니까 ?');
    if( !yn ) return;
    
    var frm = $('#qna_view')[0];
    frm.repl_sno.value=repl_sno;
    
    var param = $('#qna_view').serialize();
    $.post("/qna/qna_view/ReplDeleteR", param, function(data){
       $('#center').html(data);
    })
}

function reward_chaetaek(repl_sno){
	var nickname = $('#chaetaek_nickname'+repl_sno).text();
	console.log(nickname);
	var yn = confirm(nickname+'님의 댓글을 채택하시겠습니까?');
    if( !yn ) return;
    
	var frm = $('#qna_view')[0];
    frm.repl_sno.value=repl_sno;
    
    var param = $('#qna_view').serialize();
    $.post("/qna/qna_view/ReplChaetaek", param, function(data){
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
    
    console.log("서머노트내용: "+ summernoteContent);
	console.log("sessionId: "+ sessionId);
	console.log("sno:"+ sno)//없어도될듯 콘솔찍어보기위함
    
	
	var param = $('#qna_view').serialize();
    $.post("/qna/qna_view/insertRepl", param, function(data){
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
    
    console.log("서머노트내용: "+ summernoteContent);
	console.log("sessionId: "+ sessionId);
	console.log("sno:"+ sno);
	console.log("grp:"+grp);
	
	var param = $('#qna_view').serialize();
    $.post("/qna/qna_view/insertInnerRepl", param, function(data){
       $('#center').html(data);
    })
	
}

function view_update_innerRepl_open(repl_sno){
	// 서머노트 함수가 있었다.....
	// 서머노트에 text 쓰기
	//$('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);
	console.log("te수정버튼, repl_sno:"+repl_sno)
	var summernoteSerial = "view_update_innerRepl_summernote"+repl_sno;
	var summernoteContent = $('#'+summernoteSerial);

	if(summernoteContent.css("display") == "none"){		
		summernoteContent.css('display','block');
	}
	else{
		summernoteContent.css('display','none');
	}
}












	




