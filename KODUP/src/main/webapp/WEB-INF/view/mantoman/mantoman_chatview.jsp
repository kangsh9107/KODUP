<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_chatview.jsp</title>
<style>
@import url('https://webfontworld.github.io/dgb/IMHyemin.css');
@import url('https://webfontworld.github.io/BMJua/BMJua.css');
@import url('https://webfontworld.github.io/sebang/SebangGothic.css');

::-webkit-scrollbar {
  display: none;
}
body{
	-ms-overflow-style: none;
	padding:0;
	margin:0;
}

.slide_in{
	position:relative;
	background-color:#bb7b8a;
	height:100vh;
}

#chatt{
	width: 100%;
}

#chatt>.chattNav .profileImg{
	position:absolute;
	top:6px;
	left:10px;
	width:40px;
	height:40px;
	border-radius:50%;
}

#chatt>.chattNav{
	position:relative;
	width:100%;
	height:50px;
	background-color:#3a3a3a;
}

#chatt>.chattNav>#yid{
	position:absolute;
	top:13px;
	left:60px;
	background-color:#3a3a3a;
	color:white;
	font-size:17px;
	border-radius:5px;
	border:none;
	text-align:center;
	font-family: 'SebangGothic';
}
/* 
#chatt>.chattNav>#btnLogin{
	position:absolute;
	background-color:#c89d9d;
	top:8px;
	left:170px;
	font-size:16px;
	padding:6px;
	border-radius:8px;
	border:1.5px solid #534444;
	font-family: 'BMJua';
	vertical-align: center;
} */

#chatt>.chattNav .btnBack{
	position:absolute;
	top:8px;
	right:20px;
	width:22px;
	height:32px;
}

#chatt #talk{
	height: 75vh;
	overflow: scroll;
}
#chatt #msg{
/* 	position:absolute;
	bottom:10px; */
	width: 75%;
	height:30px;
	display: inline-block;
	margin-left:10px;
}

#chatt #sendZone > *{
	vertical-align: top;
}

#chatt #btnSend{
	width: 54px;
	height: 35px;
	border-radius:4px;
	border:1.3px solid #b0b0b0;
	font-family: 'SebangGothic';
	font-size:13px;
}

#chatt #talk .other{
	position:relative;
	margin-bottom:7px;
}

#chatt #talk .other .yourPicture{
	width:45px;
	height:45px;
	border-radius:50%;
	margin-left:5px;
	float:left;
}

#chatt #talk .other .yourId{
	position:absolute;
	left:65px;
	top:2px;
	font-size:12px;
	margin-left:5px;
	font-family: 'BMJua';
}

#chatt .other .yourBalloon{
	position:relative;
	display:inline-block;
	max-width:50%;
	margin:20px 0 0 20px;
	background:white;
	border-radius: 3px;
	padding:5px;
	box-shadow: 1px 2px 1px #c7c7c7;
	font-family: 'IMHyemin';
	font-size:14px;
}

#chatt .other .yourBalloon:after {
	border-top:15px solid white;
	border-left: 15px solid transparent;
	border-right: 0px solid transparent;
	border-bottom: 0px solid transparent;
	content:"";
	position:absolute;
	top:6px;
	left:-11px;
}

#chatt .other .dateTime{
	display:inline-block;
	margin-left:70px;
	font-size:8px;
}

#chatt #talk .me{
	position:relative;
	margin-bottom:7px;
}

#chatt #talk .me .myPicture{
	width:45px;
	height:45px;
	border-radius:50%;
	margin-right:5px;
	float:right;
}

#chatt #talk .me .myId{
	position:absolute;
	top:2px;
	right:65px;
	font-size:12px;
	margin-right:5px;
	font-family: 'BMJua';
}

#chatt .me .myBalloon{
	position:relative;
	display:inline-block;
	max-width:50%;
	float:right;
	margin:20px 20px 0 0;
	background:#852138;
	color:white;
	border-radius: 3px;
	padding:5px;
	box-shadow: 1px 2px 1px #5d1727;
	font-family: 'IMHyemin';
	font-size:14px;
}

#chatt .me .myBalloon:after {
	border-top:15px solid #852138;
	border-left: 0px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 0px solid transparent;
	content:"";
	position:absolute;
	top:6px;
	right:-11px;
}

#chatt .me .dateTime{
 	display:inline-block; 
	font-size:8px;
	margin-right:70px;
}

/* #chatt .me .talk_wrapper{
	text-align:right;
} */

</style>
</head>
<input type='hidden' value='${param.roomCode }' class="roomCode_hidden">
<input type='hidden' value='${param.sessionId }' class="sessionId_hidden">
<div class='slide_in'>
	<div id='chatt'>
		<div class='chattNav'>
			<img src='../images/basic_profile.jpg' class='profileImg'>
			<input type='text' id='yid' value='${param.yourNickname }' size='9'>
			<input type='hidden' id='mid' value='${param.myNickname }'>
			<!-- <input type='button' value='로그인' id='btnLogin'> -->
			<a href='/mantoman/mantoman_index?sessionId=${param.sessionId }'><img src='../images/back_button.png' class='btnBack'></a>
		</div>
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<input type='text' id='msg' autocomplete='off'>
			<input type='button' value='전 송' id='btnSend'>
		</div>
	</div>
</div>

<script>
function getId(id){
	return document.getElementById(id);
}

var data = {};//전송 데이터(JSON)

var ws;
var mid = getId('mid');
//var btnLogin = getId('btnLogin');
var btnSend = getId('btnSend');
var talk = getId('talk');
var msg = getId('msg');
var roomCode = document.querySelector(".roomCode_hidden").value;

window.onload = function(){
	ws = new WebSocket("ws://" + location.host + "/chatt");
	
	ws.onmessage = function(msg){
		var data = JSON.parse(msg.data);
		if(data.roomCode==roomCode){
			var css;
			var item="";
			
			if(data.mid == mid.value){
				css = 'class=me';
				
				item = `<div \${css} >
							<span class='myId'>\${data.mid}</span>
							<img src='../images/basic_profile.jpg' class='myPicture'>
							<div>
								<div class='myBalloon'>
									<span>\${data.msg}</span>
								</div><br/><br/>
								<div style="text-align: right; margin-top: 6px;">
									<span class='dateTime'>\${data.date}</span>
								</div>
							</div>
							
						</div>`;
			}else{
				css = 'class=other';
				
				item = `<div \${css} >
							<span class='yourId'>\${data.mid}</span>
							<img src='../images/fox_profile.png' class='yourPicture'>
							<div class='yourBalloon'><span>\${data.msg}</span></div><br/>
							<span class='dateTime'>\${data.date}</span>
						</div>`;
			}
			
	
			console.log(item);			
			talk.innerHTML += item;
			talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
		}
	}
/* 	btnLogin.disabled=true;
	btnLogin.value='접속됨'; */
}
		


msg.onkeyup = function(ev){
	if(ev.keyCode == 13){
		send();
	}
}

btnSend.onclick = function(){
	send();
}

function send(){
	if(msg.value.trim() != ''){
		data.mid = getId('mid').value;
		console.log("mid : " + data.mid);
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		data.roomCode = roomCode;
		var temp = JSON.stringify(data);
		ws.send(temp);
	}
	msg.value ='';
}

/* 빈방을 열어볼때(지난 대화) */
console.log(roomCode);
if(roomCode=="emptyRoom"){
	console.log("확인");
	var msg = document.querySelector('#msg');
	msg.readOnly = true;
	document.getElementById('msg').style.background = "#aaa";
	msg.value='현재는 대화가 불가능합니다';
	btnSend.disabled=true;
}
 
</script>
</html>