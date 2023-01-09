/**
 * index.jsp
 */

/***** 강수형 *****/
/***** MAIN *****/
$('#center').load('/login/main');

/***** NAV *****/
const nonClick = document.querySelectorAll('.non-click');

function handleClick(event) {
	// div에서 모든 'click' 클래스 제거
	nonClick.forEach((e) => { //e는 element
		e.classList.remove('click');
	});
	// 클릭한 span만 'click' 클래스 추가
	event.target.classList.add('click');
}

nonClick.forEach((e) => {
	e.addEventListener('click', handleClick);
});

$('.pixelbuy').on('click', function() {
	nonClick.forEach((e) => {
		e.classList.remove('click');
	});
});

$('#btnMyprofile').on('click', function() {
	nonClick.forEach((e) => {
		e.classList.remove('click');
	});
});

$('.btnMypage').on('click', function() {
	nonClick.forEach((e) => {
		e.classList.remove('click');
	});
});

/***** LOGOUT *****/
$('.btnLogoutR').on('click', function() {
	nonClick.forEach((e) => {
		e.classList.remove('click');
	});
	
	$('#center').load('/login/logoutR');
	location.replace('/');
});

/***** MANTOMAN *****/
$(document).ready(function() {
	$(window).scroll(function() {
		var position = $(window).scrollTop()+800; //80%로 주는 방법 찾기. vh 계산해서 800대신 변수 대입.
		$('.btnMantoman').stop().animate({top:position+'px'},400);
	});
});

/***** LOGIN *****/
$('.index_btnLogin').on('click', function() {
	$('#center').load('/login/login');
});

//KAKAO
var cnt = 0;
if(cnt == 0) {
	cnt++;
	window.Kakao.init('76fd5185be40793e6d0205f6710f85d0');
}

$('.index_btnJoinKakaoR').on('click', function() {
	$('#center').load('/login/login_kakao');
});

/***** QNA LIST *****/
$('.btnQna').on('click', function() {
	$('#center').load('/qna/qna');
});

function runQna() {
	console.log('테스트');
}

/***** INFOSHARE LIST *****/
$('.btnInfoshare').on('click', function() {
	$('#center').load('/infoshare/infoshare');
});

function runInfoshare() {
	console.log('테스트');
}

/***** FREETALKING LIST *****/
$('.btnFreetalking').on('click', function() {
	$('#center').load('/freetalking/freetalking');
});

function runFreetalking() {
	console.log('테스트');
}

/***** JOBSEARCH LIST *****/
$('.btnJobsearch').on('click', function() {
	$('#center').load('/jobsearch/jobsearch');
});

function runJobsearch() {
	console.log('테스트');
}

/***** NOTIFICATION LIST *****/
$('.btnNotification').on('click', function() {
	$('#center').load('/notification/notification');
});

function runNotification() {
	console.log('테스트');
}





/***** 이세형 *****/
$('#btnMyprofile').on('click', function() {
   $('#center').load('/profile/member_profile'); 
});

$('#btnMantoman').on('click',function() {
	var title  = 'popup';
	var status = 'toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=350, height=500, top=400, left=1300'; 
	window.open('/mantoman/mantoman_index', title, status);
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
	console.log('회원정보');
	$('#center').load('/board/mypage');
});