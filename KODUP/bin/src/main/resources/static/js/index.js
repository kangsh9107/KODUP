/**
 * index.jsp
 */

/***** 강수형 *****/
/***** MAIN *****/
$('#center').load('/login/main');

/***** NAV *****/
const nonClick = document.querySelectorAll(".non-click");

function handleClick(event) {
	// div에서 모든 "click" 클래스 제거
	nonClick.forEach((e) => { //e는 element
		e.classList.remove("click");
	});
	// 클릭한 span만 "click" 클래스 추가
	event.target.classList.add("click");
}

nonClick.forEach((e) => {
	e.addEventListener("click", handleClick);
});

/***** MANTOMAN *****/
$(document).ready(function() {
	$(window).scroll(function() {
		var position = $(window).scrollTop()+750; 
		$(".btnMantoman").stop().animate({top:position+"px"},400);
	});
});

/***** LOGIN *****/
$('.index_btnLogin').on('click', function() {
	$('#center').load('/login/login');
});

/***** SESSION LOGIN(세형작업중) *****/
//console.log("js들어옴");
//let sessionId = document.querySelector('.sessionId_hidden').value;
//console.log("sessionId : " + sessionId);
$('.btn1234').on('click', function() {
	let sessionId = sessionStorage.getItem('sessionId');
	console.log(sessionId)
});

$('.sessionId_hidden').change(function() {
	console.log('실행');
	ws = new WebSocket("ws://" + location.host + "/socket_login");
	
	ws.onmessage = function(msg){
	}
	console.log("세션 로그인");
});

/***** QNA LIST *****/
$('.btnQna').on('click', function() {
	$('#center').load('/qna/qna');
});

function runQna() {
	console.log("테스트");
}

/***** INFOSHARE LIST *****/
$('.btnInfoshare').on('click', function() {
	$('#center').load('/infoshare/infoshare');
});

function runInfoshare() {
	console.log("테스트");
}

/***** FREETALKING LIST *****/
$('.btnFreetalking').on('click', function() {
	$('#center').load('/freetalking/freetalking');
});

function runFreetalking() {
	console.log("테스트");
}

/***** JOBSEARCH LIST *****/
$('.btnJobsearch').on('click', function() {
	$('#center').load('/jobsearch/jobsearch');
});

function runJobsearch() {
	console.log("테스트");
}

/***** NOTIFICATION LIST *****/
$('.btnNotification').on('click', function() {
	$('#center').load('/notification/notification');
});

function runNotification() {
	console.log("테스트");
}

/***** BACK TO LIST *****/
$('.btnList').on('click', function() {
	
});





/***** 이세형 *****/
$('#btnMyprofile').on('click', function() {
   $('#center').load('/profile/member_profile'); 
});

$('#btnMantoman').on('click',function() {
	var title  = "popup";
	var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=350, height=500, top=400, left=1300"; 
	window.open("/mantoman/mantoman_index", title, status);
});





/***** 박요한 *****/
$('.mansearch').on('click',function(){
   $('#center').load('/mansearch/mansearch');
});
$('.pixelbuy').on('click',function(){
   $('#center').load('/pixel/pixel_buy');
});





/***** 이한나 *****/

//mypage_memberinfo (회원정보)
$('.btnMypage').on('click', function(){
	console.log("회원정보");
	$('#center').load('/board/mypage');
});