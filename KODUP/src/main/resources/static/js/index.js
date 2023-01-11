/**
 * index.jsp
 */

/***** 강수형 *****/
/***** MAIN *****/
var id = $('.sessionId_hidden').val();

var topWriter = function() {
	$('#index_top_writer').load('/login/top_writer');
}
var hotTag = function() {
	$('#index_hashtag').load('/login/hot_tag');
}
topWriter();
hotTag();


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
	
	$.ajax({
		type: 'POST',
		url: '/login/logoutR',
		contentType: false,
		processData: false,
		dataType: 'html',
		success: function(data) {
			$('#center').html(data);
			location.replace('/');
		}
	});
});

/***** SESSION CLOSE *****/
/* 세션 종료시 chat테이블에서 삭제하는 것은 고도화에서 고려
window.addEventListener('beforeunload', (event) => {
	$('#center').load('/login/logoutR');
});
*/

/***** MANTOMAN *****/
$(document).ready(function() {
	$(window).scroll(function() {
		var height80vh = parseInt($(window).height() * 0.8); //VH의 80%
		var position = $(window).scrollTop()+height80vh;
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
	window.open('/mantoman/mantoman_index?sessionId=' + sessionId, title, status);
});

let sessionId = document.querySelector('.sessionId_hidden').value;
console.log("sessionId : " + sessionId);

var dataArray = {};//전송 데이터(JSON)

var ws;

if(sessionId != ""){
	ws = new WebSocket("ws://" + location.host + "/socket_login");
	ws.onopen = () => { //webSocket이 맺어지고 난 후, 실행
		console.log(ws.readyState);
    	
    	dataArray.job = "login";
		dataArray.msg = sessionId;
		
		var temp = JSON.stringify(dataArray);
		ws.send(temp);
	}
	
	ws.onmessage = function(msg){
		var data = JSON.parse(msg.data);
		/* job이 로그인일떄 */
		if(data.job=="login"){
			var id = data.msg;
		
			$.ajax({
				type: 'POST',
				url: '/login/chat?id=' + id,
				contentType: false,
				processData: false,
				dataType: 'html',
				success: function(data) {
					if(data == 'false') {
						alert('채팅서버 연결에 실패했습니다.');
					} else {
						$('#center').html(data);
					}
				}
			});
		}
		/* job이 멘토요청일때 */
		if(data.job=="mentoCall"){
			console.log("mentoId : " + data.mentoId);
			if(data.mentoId==sessionId){
				alert(data.mentiNickname+"님이 멘토요청하였습니다.");
				//var popupCall = `<div`
				
			}
		}
		
	}
}



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