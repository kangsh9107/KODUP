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
function qna_view() {
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
        var replInnerCon = $('#' + replInnerSectionId).css("display");
        console.log("리플섹션:"+replInnerSectionId);
        console.log("클릭된grp:"+grp);
        if( replInnerCon == "none"){
            $('#' +replInnerSectionId).css('display','block');
        }
        else {
            $('#' +replInnerSectionId).css('display','none');
        }
}










