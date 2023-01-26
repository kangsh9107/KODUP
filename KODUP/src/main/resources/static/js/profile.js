/**
 * profile.js
 */

/*-------------------------네비게이션 슬라이딩 바---------------------------*/

var horizontalBar = document.querySelector("#horizontal-underline");
var horizontalMenus = document.querySelectorAll(".atag");

function horizontalIndicator(e) {
  let a = horizontalBar.style.left = e.offsetLeft + "px";
  let b = horizontalBar.style.width = e.offsetWidth + "px";
  let c = horizontalBar.style.top = e.offsetTop + e.offsetHeight + 5 + "px";
/*  console.log(a);
  console.log(b);
  console.log(c);*/
}

horizontalMenus.forEach((menu) =>
  menu.addEventListener("click", (e) =>
    horizontalIndicator(e.currentTarget)
  )
);

/*------------------------------------------------------------------------*/
var id = $(".id_hidden").val();

/* 프로필 열릴때 */
//$('#profile_innerSection').load('/profile/member_profile_myarticle?id='+id);



/* 내 게시글 조회 버튼클릭시 */
$('#btnMyarticle').on('click', function() {
	$('#profile_innerSection').load('/profile/member_profile_myarticle?id='+id); 
});

/* 내 댓글 조회 버튼클릭시 */
$('#btnMyrepl').on('click', function() {
	$('#profile_innerSection').load('/profile/member_profile_myrepl?id='+id); 
});

setTimeout(function() {
	document.querySelector('#btnMyarticle').click();
},10);

/* 내 게시글 클릭시 */

$(document).on('click', '.subject', function() {
	var sno = this.parentNode.sno_hidden.value;
	var boardtype = this.parentNode.boardtype_hidden.value;
	console.log("sno : " + sno);
	console.log("boardtype : " + boardtype);
	if(boardtype=="qna"){
		$.post("/profile/qna_view?sno="+sno, function(data){
	        $('#profile_innerSection').html(data);
	    })
	}else if(boardtype=="freetalking"){
		$.post("/profile/freetalking_view?sno="+sno, function(data){
        	$('#profile_innerSection').html(data);
    	})
	}else if(boardtype=="JOBSearCh"){
		$.post("/profile/jobsearch_view?sno="+sno, function(data){
        	$('#profile_innerSection').html(data);
    	})
	}else if(boardtype=="notifiCation"){
		$.post("/profile/jobsearch_view?sno="+sno, function(data){
        	$('#profile_innerSection').html(data);
    	})
	}else if(boardtype=="infoshare"){
		$.post("/profile/infoshare_view?sno="+sno, function(data){
        	$('#profile_innerSection').html(data);
    	})
	}else if(boardtype=="mansearch"){
		$.post("/profile/mansearch_view?sno="+sno+"&id="+id, function(data){
        	$('#profile_innerSection').html(data);
    	})
	}
});
