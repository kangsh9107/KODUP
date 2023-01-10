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
function qna_view() {
	$('#center').load('/qna/qna_view');
}

$('.btnUpdate').on('click', function() {
	$('#center').load('/qna/qna_update');
});

/*$(function(){
	$('#repl_inner_display_onkey').click(function(){
		if($("#qna_view_repl_inner_insert1").css("display")=="none"){
			$('#qna_view_repl_inner_insert1').show();
			$('#repl_inner_display_onkey').hide();
			$('#repl_inner_display_offkey').show();
		}
	})
});
$(function(){
	$('#repl_inner_display_offkey').click(function(){
		if($("#qna_view_repl_inner_insert1").css("display")!="none"){
			$('#qna_view_repl_inner_insert1').hide();
			$('#repl_inner_display_onkey').show();
			$('#repl_inner_display_offkey').hide();
		}
	})
});*/



function insertFormToggle(OptNo){
        var insertId = "repl_insert_section"+OptNo;
        var insertCon = $('#' + insertId).css("display");
        
        if( insertCon == "none"){
            $('#' +insertId).css('display','block');
        }
        else {
            $('#' +insertId).css('display','none');
        }
}











