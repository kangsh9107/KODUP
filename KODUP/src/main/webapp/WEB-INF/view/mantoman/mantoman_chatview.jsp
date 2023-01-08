<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_chatview.jsp</title>
<style>
body{
	padding:0;
	margin:0;
	background-color:#bb7b8a;
}
/* .slide_in{
	background-color:#bb7b8a;
	height:100%;
} */

#chatt{
	width: 100%;
}

.profileImg{
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
	background-color:#2f2f2f;
}

#chatt>.chattNav>#mid{
	position:absolute;
	top:13px;
	left:60px;
	background-color:#2f2f2f;
	color:white;
	font-size:18px;
	border-radius:5px;
	border:none;
	text-align:center;
}

#chatt>.chattNav>#btnLogin{
	position:absolute;
	top:13px;
	left:190px;
}

#chatt>.chattNav .btnBack{
	position:absolute;
	top:8px;
	right:20px;
	width:20px;
	height:32px;
}

#chatt #talk{
	width: 100%;
	height: 380px;
	overflow: scroll;
}
#chatt #msg{
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
}

#chatt #talk div{
	width: 100%;
	display: inline-block;
	padding: 6px;
	border-radius:10px;
	margin-left:8px;
}

#chatt .me{
	background-color : #ffc;
	margin : 1px 0px 2px 30%;
}

#chatt .other{
	background-color : #eee;
	margin : 2px;
}
</style>
</head>
<body>
<div class='slide_in'>
	<div id='chatt'>
		<div class='chattNav'>
			<img src='../images/basic_profile.jpg' class='profileImg'>
			<input type='text' id='mid' value='옥다방고양이' size='8'>
			<input type='button' value='로그인' id='btnLogin'>
			<a href='/mantoman/mantoman_index'><img src='../images/back_button.png' class='btnBack'></a>
		</div>
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<input type='text' id='msg'>
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
var btnLogin = getId('btnLogin');
var btnSend = getId('btnSend');
var talk = getId('talk');
var msg = getId('msg');

btnLogin.onclick = function(){
	ws = new WebSocket("ws://" + location.host + "/chatt");
	
	ws.onmessage = function(msg){
		
		var data = JSON.parse(msg.data);
		console.log(data);
		console.log(data.msg);
		var css;
		
		if(data.mid == mid.value){
			css = 'class=me';
		}else{
			css = 'class=other';
		}
		
		var item = `<div ${css} >
		                <span><b>\${data.mid}</b></span> [ \${data.date} ]<br/>
                      <span>\${data.msg}</span>
						</div>`;
		console.log(item);			
		talk.innerHTML += item;
		talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
	}
	btnLogin.disabled=true;
	btnLogin.value='접속중';
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
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		var temp = JSON.stringify(data);
		ws.send(temp);
	}
	msg.value ='';
}
 
</script>
</body>
</html>