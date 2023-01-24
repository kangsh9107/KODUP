/**
 * index.jsp
 */

/***** 강수형 *****/
/***** MAIN *****/
var id = $('.sessionId_hidden').val();

//qna, freetalking, weeklybest, editors, infoshare, notification
var main = function() {
	$('#center').load('/login/main');
}
var hotTag = function() {
	$('#index_hashtag').load('/login/hot_tag');
}
var topWriter = function() {
	$('#index_top_writer').load('/login/top_writer');
}
main();
hotTag();
topWriter();

function runHashtagIndex(hashtag) {
	nonClick.forEach((e) => { //e는 element
		e.classList.remove('click');
	});
	
	var frm = $('.index_cb_form')[0];
	var sort = $('#sort option:selected').val();
	frm.sort.value = sort;
	frm.hashtag.value = hashtag;
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

/***** NAV *****/
//모든 .non-click 가져옴
var nonClick = document.querySelectorAll('.non-click');

function handleClick(event) {
	//모든 .non-click의 .click 제거
	nonClick.forEach((e) => { //e는 element
		e.classList.remove('click');
	});
	//클릭한 .non-click의 .click 추가
	event.target.classList.add('click');
}
//.non-click 클릭시 이벤트 실행
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
			setTimeout(() => {
				location.replace('/');
			}, 500);
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
	nonClick.forEach((e) => {
		e.classList.remove('click');
	});
	
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

/***** LIST *****/
var quick = function(sno, boardtype) {
	var frm = $('.index_cb_form')[0];
	frm.sno.value = sno;
	frm.boardtype.value = boardtype;
}
//QNA LIST
$('.btnQna').on('click', function() {
	var frm = $('.index_cb_form')[0];
	frm.boardtype.value = 'qna';
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

$(document).on('click', '.btnMainQna', function() {
	$('.btnQna').addClass('click');
	$('.btnQna').click();
});

//INFOSHARE LIST
$('.btnInfoshare').on('click', function() {
	$('#center').load('/infoshare/infoshare');
});

$(document).on('click', '.btnMainInfoshare', function() {
	$('.btnInfoshare').addClass('click');
	$('#center').load('/infoshare/infoshare');
});

function runInfoshare() {
	console.log('테스트');
}

//FREETALKING LIST
$('.btnFreetalking').on('click', function() {
	$('#center').load('/freetalking/freetalking');
});

$(document).on('click', '.btnMainFreetalking', function() {
	$('.btnFreetalking').addClass('click');
	$('.btnFreetalking').click();
});

function runFreetalking() {
	console.log('테스트');
}

//JOBSEARCH LIST
$('.btnJobsearch').on('click', function() {
	$('#center').load('/jobsearch/jobsearch');
});

function runJobsearch() {
	console.log('테스트');
}

//NOTIFICATION LIST
$('.btnNotification').on('click', function() {
	$('#center').load('/notification/notification');
});

$(document).on('click', '.btnMainNotification', function() {
	$('.btnNotification').addClass('click');
	$('#center').load('/notification/notification');
});

function runNotification() {
	console.log('테스트');
}





/***** 이세형 *****/
$('#btnMyprofile').on('click', function() {
   $('#center').load('/profile/member_profile'); 
});

/* 맨투맨 팝업창 */
$('#btnMantoman').on('click',function() {
	var title  = 'popup';
	var status = 'toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=360, height=500, top=400, left=1300'; 
	window.open('/mantoman/mantoman_index?sessionId=' + sessionId, title, status);
});

let sessionId = document.querySelector('.sessionId_hidden').value;


var dataArray = {};//전송 데이터(JSON)

var ws;

if(sessionId != ''){
	ws = new WebSocket('ws://' + location.host + '/socket_login');
	ws.onopen = () => { //webSocket이 맺어지고 난 후, 실행
		console.log(ws.readyState);
    	
    	dataArray.job = "login";
		dataArray.msg = sessionId;
		
		var temp = JSON.stringify(dataArray);
		ws.send(temp);
		dataArray = {};
	}
	
	ws.onmessage = function(msg){
		var data = JSON.parse(msg.data);
		/* job이 로그인일떄 */
		if(data.job=="login"){
			var id = data.msg;
			console.log("id	: " + id);
		
			$.ajax({
				type: 'POST',
				url: '/login/chat?id=' + id,
				contentType: false,
				processData: false,
				dataType: 'html',
				success: function(data) {
					if(data == 'error_chat') {
						alert('채팅서버 연결에 실패했습니다.');
					} else {
						console.log("ok");
						//$('#center').html(data);
					}
				}
			});
		}
		/* job이 멘토요청 팝업일때 */
		if(data.job=="mentoCall"){
			if(data.mentoId==sessionId){
				var popupCall = `<div class='popupCallDiv'>
									<br/>
									<span>${data.mentiNickname}님이 멘토요청하였습니다.</span><br/><br/>
									<input type="text" value="보상픽셀 : ${data.rewardPixel}픽셀" readonly><br/>
									<input type="text" value="상담내용 : ${data.question}" size=30 readonly><br/>
									<input type="text" value="요구시간 : ${data.requiredTime}" size=30 readonly><br/><br/>
									<input type="button" value="수 락" class="btnAccessCall">
									<input type="button" value="거 절" class="btnRefuseCall">			
									
									<input type="hidden" value="${data.mentiId}" class="mentiId_hidden">
									<input type="hidden" value="${data.mentiNickname}" class="mentiNickname_hidden">
									<input type="hidden" value="${data.mentiProfile_img}" class="mentiProfile_img_hidden">
									
									<input type="hidden" value="${data.mentoId}" class="mentoId_hidden">
									<input type="hidden" value="${data.mentoNickname}" class="mentoNickname_hidden">
									<input type="hidden" value="${data.mentoProfile_img}" class="mentoProfile_img_hidden">
									
									<input type="hidden" value="${data.rewardPixel}" class="rewardPixel_hidden">
									<input type="hidden" value="${data.requiredTime}" class="requiredTime_hidden">
								</div>`;
				console.log("요청 : " + data.mentoProfile_img);			
				console.log("요청 : " +data.mentiProfile_img);			
				$("#sockectController").append(popupCall);
			}
		}
		/* job이 채팅시작일때(yourId와 sessionId를 구분해서 파라미터로 넘긴다) */
		if(data.job=="startChat"){
			
			if(data.mentoId==sessionId){
				/* 공통 저장 컬럼(mantoman_room) */
				var params = {
		    		roomCode : data.roomCode,
		    		mantoman_pixel_reward : data.mantoman_pixel_reward
		    	}
				$.ajax({
		        	type : "GET",
		        	url : "/mantoman/mantoman_chatview",
		        	data: params,
		        	success : function(data){
		        	}
		    	})
				var title  = 'popup';
				var status = 'toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=360, height=500, top=400, left=1300';
				window.open("/mantoman/mantoman_chatview2?roomCode="+data.roomCode+"&yourNickname="+data.mentiNickname+"&myNickname="+data.mentoNickname
							+"&sessionId="+sessionId+"&yourId="+data.mentiId+"&mantoman_pixel_reward="+data.mantoman_pixel_reward+"&requiredTime="+data.requiredTime
							+"&myProfile_img="+data.mentoProfile_img+"&yourProfile_img="+data.mentiProfile_img+"&relation=mento", title, status);
			}else if(data.mentiId==sessionId){
				var title  = 'popup';
				var status = 'toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=360, height=500, top=400, left=1300';
				window.open("/mantoman/mantoman_chatview2?roomCode="+data.roomCode+"&yourNickname="+data.mentoNickname+"&myNickname="+data.mentiNickname
							+"&sessionId="+sessionId+"&yourId="+data.mentoId+"&mantoman_pixel_reward="+data.mantoman_pixel_reward+"&requiredTime="+data.requiredTime
							+"&myProfile_img="+data.mentiProfile_img+"&yourProfile_img="+data.mentoProfile_img+"&relation=menti", title, status);
			}
		}
		/* job이 멘토 요청 취소일때 */
		if(data.job=="CancelCall"){
			if(data.mentoId==sessionId){
				$('.popupCallDiv').remove();
				alert(data.mentiNickname+"님이 멘토요청을 취소하였습니다.");
			}
		}
		/* job이 요청거절일때 */
		if(data.job=="refuseCall"){
			if(data.mentiId==sessionId){
				alert("멘토요청이 거절되었습니다.");
				var title  = 'popup';
				var status = 'toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=350, height=500, top=400, left=1300'; 
				window.open('/mantoman/mantoman_index?sessionId=' + sessionId, title, status);
			}
		}
	}
}

/*요청 거절 버튼 클릭시*/
$(document).on("click", ".btnRefuseCall", function() {
    dataArray.job = "refuseCall";
	dataArray.mentiId = $('.mentiId_hidden').val();
	
	$(this).parent().remove();
	
	var temp = JSON.stringify(dataArray);
	ws.send(temp);
	dataArray = {};
});

/* 요청 수락 버튼 클릭시 채팅방 이동 */

$(document).on("click", ".btnAccessCall", function() {
	function uuidv4(){
		return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
			(c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
		);
	}
	
	var roomCode = uuidv4();
	
	dataArray.job = "startChat";
	dataArray.roomCode = roomCode;
	
	dataArray.mentoId = $('.mentoId_hidden').val();
	dataArray.mentoNickname = $('.mentoNickname_hidden').val();
	dataArray.mentoProfile_img = $('.mentoProfile_img_hidden').val();
	
	dataArray.mentiId = $('.mentiId_hidden').val();
	dataArray.mentiNickname = $('.mentiNickname_hidden').val();
	dataArray.mentiProfile_img = $('.mentiProfile_img_hidden').val();
	
	dataArray.mantoman_pixel_reward = $('.rewardPixel_hidden').val();
	dataArray.requiredTime = $('.requiredTime_hidden').val();
	
	$(this).parent().remove();
	
	var temp = JSON.stringify(dataArray);
	ws.send(temp);
	dataArray = {};
});

/* 브라우저 종료시 로그아웃 처리 */

var closing_window = false;
 	$(window).on('focus', function () {
		closing_window = false;
	 	//if the user interacts with the window, then the window is not being
	 	//closed
 });

 $(window).on('blur', function () {

	 closing_window = true;
	 if (!document.hidden) { //when the window is being minimized
		 closing_window = false;
	 }
	 $(window).on('resize', function (e) { //when the window is being maximized
		 closing_window = false;
	 });
	 $(window).off('resize'); //avoid multiple listening
 });

 $('html').on('mouseleave', function () {
	 closing_window = true;
	 //if the user is leaving html, we have more reasons to believe that he's
	 //leaving or thinking about closing the window
 });

 $('html').on('mouseenter', function () {
	 closing_window = false;
	 //if the user's mouse its on the page, it means you don't need to logout
	 //them, didn't it?
 });

 $(document).on('keydown', function (e) {

	 if (e.keyCode == 91 || e.keyCode == 18) {
		 closing_window = false; //shortcuts for ALT+TAB and Window key
	 }

	 if (e.keyCode == 116 || (e.ctrlKey && e.keyCode == 82)) {
		 closing_window = false; //shortcuts for F5 and CTRL+F5 and CTRL+R
	 }
 });

 // Prevent logout when clicking in a hiperlink
 $(document).on("click", "a", function () {
	 closing_window = false;
 });

 // Prevent logout when clicking in a button (if these buttons rediret to some page)
 $(document).on("click", "button", function () {
	 closing_window = false;

 });
 // Prevent logout when submiting
 $(document).on("submit", "form", function () {
	 closing_window = false;
 });
 // Prevent logout when submiting
 $(document).on("click", "input[type=submit]", function () {
	 closing_window = false;
 });

 var toDoWhenClosing = function() {
	$.ajax({
		type: 'POST',
		url: '/login/logoutR',
		contentType: false,
		processData: false,
		dataType: 'html',
		success: function(data) {
		}
	});
 };

window.addEventListener("beforeunload", function (e) {
	if (closing_window) {
		toDoWhenClosing();
	}
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