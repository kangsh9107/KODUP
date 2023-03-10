<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mantoman/mantoman_chatview.jsp</title>
<style>
@import url('https://webfontworld.github.io/dgb/IMHyemin.css');
@import url('https://webfontworld.github.io/BMJua/BMJua.css');
@import url('https://webfontworld.github.io/sebang/SebangGothic.css');

::-webkit-scrollbar {
  display: none;
}

html{
	min-width:360px;
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
	font-family: 'SebangGothic';
}

#chatt>.chattNav .btnComplete{
 	position:absolute;
 	background:none;
 	border:none;
	top:8.5px;
	right:5px;
}

#chatt>.chattNav .btnComplete:hover{
	cursor:pointer;
}



#chatt>.chattNav .btnCompleteImg{
 	/* position:absolute; */
/* 	top:10px;
	right:15px; */
	width:30px;
	height:30px;
}

#chatt>.chattNav .btnBack{
	position:absolute;
	visibility:hidden;
	top:10px;
	right:15px;
	width:22px;
	height:32px;
}

#chatt #talk{
	height: 75vh;
	overflow: scroll;
}

#chatt #msg{
	bottom:0;
	font-size:16px;
	border:none;
	resize: none;
	font-family: 'SebangGothic';
}

#chatt #msg:focus {
  outline: none;
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

#chatt .me .mySendImg{
	display:inline-block; 
	width:55%;
	margin-top:20px;
	margin-right:10px;
	border-radius:3px;
}

#chatt .other .yourSendImg{
	display:inline-block; 
	width:55%;
	margin-top:20px;
	margin-left:10px;
	border-radius:3px;
}

#senderDiv{
	width:100%;
	background-color:white;
	display:grid;
	grid-template-columns:50px 1fr 65px;
	position:absolute;
	height:60px;
	bottom:0;
}


#timerDiv{
	color:white;
	font-family: 'SebangGothic';
	position: absolute;
	right:60px;
	top:16px;
	font-size:14px;
	z-index:3;
}

#remainning_time{
	color:white;
	font-family: 'SebangGothic';
	position: absolute;
	right:120px;
	top:16px;
	font-size:14px;
}

@keyframes box-ani {
	0% { transform: translate(0, -50px); opacity: 0%; }
	100% { transform: translate(0, 0); opacity: 89.5%;}
}

#talk>.popupCallDiv {
	padding:20px;
	z-index:10;
	position:fixed;
	right:1.5%;
	top:10%;
	width:200px;
	height:80px;
	background-color:white;
	border:1px solid black;
	border-radius:10px;
	opacity: 98%;
	animation: box-ani 1s cubic-bezier(0.49, -0.51, 0.33, 1.79);
	overflow:hidden;
	height:auto;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

#talk>.popupCallDiv input[type=text]{
	width:95%;
}

#talk>.popupCallDiv input[type=button]{
	border-radius:3px;
	border:none;
	border:0.3px solid #aaa;
	padding:3.6px 0;
	width:97px;
	font-size:16px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
}

#talk>.popupCallDiv input[type=button]:hover{
	cursor:pointer;
}

#talk .alertMsg{
	text-align:center;
	margin:10px 0;
}

#talk .alertMsg span{
	background:rgba(0, 0, 0, 0.1);
	display:inline-block;
	padding:6px;
	border-radius:5px;
	color:#1e1e1e;
	font-size:15px;
	font-family: 'SebangGothic';
}

</style>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<input type='hidden' value='${param.sessionId }' class="sessionId_hidden">
<input type='hidden' value='${param.myProfile_img }' class='myProfile_img_hidden'>
<input type='hidden' value='${param.yourProfile_img }' class='yourProfile_img_hidden'>
<input type='hidden' value='${mtmVo.requiredTime }' class='requiredTime_hidden'>
<input type='hidden' value='${param.relation }' class='relation_hidden'>
<input type='hidden' value='${param.yourId }' class='yourId_hidden'>
<input type='hidden' value='${mtmVo.mantoman_pixel_reward}' class='pixel_reward_hidden'>
<div class='slide_in'  oncontextmenu="return false">
	<div id='chatt'>
		<div class='chattNav'>
			<img src='../upload/${param.yourProfile_img }' class='profileImg'>
			<input type='text' id='yid' value='${param.yourNickname }' size='11'>
			<input type='hidden' id='mid' value='${param.myNickname }'>
			<c:if test='${mtmVo.requiredTime ne null}'>
				<span id="remainning_time">???????????? : </span>
			</c:if>
			<div id="timerDiv"></div>
			
			<a href='/mantoman/mantoman_index?sessionId=${param.sessionId }'><img src='../images/back_button.png' class='btnBack'></a>
			<input type='hidden' class="chat_complete_check">
			<c:if test="${param.relation eq 'menti' }">
				<button class='btnComplete' type='button'><img src='../images/done_button.png' class='btnCompleteImg'></button>
			</c:if>
		</div>
		<br/>
		<form id='talk' method="post" name="doc">
			<div class='before_chat'>${param.doc }</div>
		</form>
 		<div id='sendZone'>
			<form class='attFileForm' enctype='multipart/form-data'>
				<input type='file' name='attFile' class='fileUploader' accept='image/*' style='display: none;'>
				<input type='hidden' name="roomCode" value='${param.roomCode }' class="roomCode_hidden">
			</form>
			<div id="senderDiv">
				<img src="../images/export-image-photo-icon.png" class="btnUpload" style="width:35px; margin-top:13px; margin-left:10px;">
				<textarea id='msg' autocomplete='off'></textarea>
				<input type='button' value='??? ???' id='btnSend' style="margin-top:12px; margin-right:7px;">
			</div>
		</div>
	</div>
</div>

<script>


function getId(id){
	return document.getElementById(id);
}

var data = {};//?????? ?????????(JSON)

var ws;
var mid = getId('mid');
var btnSend = getId('btnSend');
var talk = getId('talk');
var msg = getId('msg');
var roomCode = document.querySelector(".roomCode_hidden").value;
var myProfile_img = document.querySelector(".myProfile_img_hidden").value;
var yourProfile_img = document.querySelector(".yourProfile_img_hidden").value;

talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????(?????? ?????????)

window.onload = function(){
	ws = new WebSocket("ws://" + location.host + "/chatt");
	
	ws.onmessage = function(msg){
		var data = JSON.parse(msg.data);
		if(data.roomCode==roomCode){
			var css;
			var item="";
			var last_talk="";
			/* job??? ?????????????????? */
			if(data.job == "sendTalk"){
				last_talk = data.msg;
				
				if(data.mid == mid.value){
					css = 'class=me';
					
					item = `<div \${css} >
								<span class='myId'>\${data.mid}</span>
								<img src='../upload/\${myProfile_img }' class='myPicture'>
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
								<img src='../upload/\${yourProfile_img }' class='yourPicture'>
								<div class='yourBalloon'><span>\${data.msg}</span></div><br/>
								<span class='dateTime'>\${data.date}</span>
							</div>`;
				}
			}
			/* job??? ?????? ???????????? */
			if(data.job == "sendImg"){
				var sendImg = data.sendImg;
				last_talk = "????????? ???????????????.";
				
				if(data.mid == mid.value){
					css = 'class=me';
						
					item = `<div \${css} >
								<span class='myId'>\${data.mid}</span>
								<img src='../upload/\${myProfile_img }' class='myPicture'>
								<div>
									<div style="text-align: right; margin-top: 6px;">
										<div class='mySendImg_wrapper'>
											<a href="../mantoman_images/\${sendImg }" download="\${sendImg }">
												<img src="../mantoman_images/\${sendImg }" class='mySendImg'>
											</a>
										</div>
										<span class='dateTime'>\${data.date}</span>
									</div>
								</div>
							</div>`;
				}else{
					css = 'class=other';
					
					item = `<div \${css} >
								<span class='yourId'>\${data.mid}</span>
								<img src='../upload/\${yourProfile_img }' class='yourPicture'>
								<div class='yourSendImg_wrapper'>
									<a href="../mantoman_images/\${sendImg }" download="\${sendImg }">
										<img src='../mantoman_images/\${sendImg }' class='yourSendImg'>
									</a>
								</div>
								<span class='dateTime'>\${data.date}</span>
							</div>`;
				}
			}
			var sendImg = data.sendImg;
			
			/* ???????????? append */
			if(data.job == "sendTalk"){
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????
				setTimeout(function() {
					 talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????
				},15);
			}
			/* ?????? append */
			else if(data.job == "sendImg"){
				setTimeout(function() {
					talk.innerHTML += item;
				}, 2700);
				setTimeout(function() {
					talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????
					btnUpload.src = "../images/export-image-photo-icon.png";
				},2780);
			}
			
			/* ????????????(????????????) DB?????? */
			setTimeout(function() {
				if(data.job == "sendTalk" || data.job == "sendImg"){
		        	var frmData = talk.innerHTML;
			        $.ajax({
			            url : "/updateTalk",
			            type : "GET",
			            data : {
			            	frmData : frmData
			            	,last_talk : last_talk
			            	,roomCode : roomCode
			            },
			            contentType: "application/json",
			            dataType: "json",
			            success : function(data){
							if(data=="fail"){
								alert("????????? ?????? ??????");
							}
			            }
			        })
		        }
			},3000);
			/* job??? ???????????? 1??? ???????????? */
			if(data.job == "oneMinute"){
	        	item = `<div class='alertMsg' >
							<span>??????????????? 1??? ???????????????.</span>
	        			</div>`;
				talk.innerHTML += item;
			}
	        /* job??? ?????????????????? */
	        if(data.job == "chatComplete"){
	        	$('.chat_complete_check').attr('value',"complete");
        		document.querySelector('.btnBack').style.visibility="visible";
	        	var mantoman_pixel_reward = $('.pixel_reward_hidden').val()
	        	if(data.myId == $('.sessionId_hidden').val()){
		        	item = `<div class='alertMsg' >
								<span>????????? ?????????????????????.</span>
		        			</div>`;
					
					talk.innerHTML += item;
					setTimeout(function() {
						talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????
					},100);
	        	}
	        	
	        	
	        	if(data.yourId == $('.sessionId_hidden').val()){
	        		$.ajax({
	        	        url : "/mantoman/chatComplete",
	        	        type : "GET",
	        	        data : {
	        	        	mentoId:data.yourId,
	        	        	mentiId:$('.yourId_hidden').val(),
	        				mantoman_pixel_reward:mantoman_pixel_reward
	        	        },
	        	        contentType: "application/json",
	        	        dataType: "json",
	        	        success : function(data){
	        				if(data=="fail"){
	        					alert("????????? ?????? ??????");
	        				}
	        	        }
	        	    })
	        	    item = `<div class='alertMsg' >
						<span>????????? ???????????? \${mantoman_pixel_reward}????????? ?????????????????????.</span>
        			</div>`;
			
					talk.innerHTML += item;
					setTimeout(function() {
						talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????
					},100);
	        	}
	        }
		}
	}
	
}

/* ???????????? ?????? */
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
		data.job = "sendTalk";
		data.mid = getId('mid').value;
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		data.roomCode = roomCode;
		var temp = JSON.stringify(data);
		ws.send(temp);
	}
    msg.value ='';
}

/* ????????? ???????????? */
var btnUpload = document.querySelector('.btnUpload');
var fileUploader = document.querySelector('.fileUploader');

btnUpload.onclick = function(){
	fileUploader.click();
}

fileUploader.onchange = fileUpload;

function fileUpload(ev){
	let event = ev || window.event;
	let file = event.srcElement.files[0];
	
	let reader = new FileReader();
	reader.onload = function(){
		let img = new Image();
	}
	reader.readAsDataURL(file);
	
	 var frm = $('.attFileForm')[0];
	 var param = new FormData(frm);
	 
	 $.ajax({
		type : 'POST',
		url : '/updateFile',
		contentType : false,
		processData : false,
		data : param,
		dataType : 'html',
		success: function(result){
			data.job = "sendImg";
			data.roomCode = roomCode;
			data.mid = getId('mid').value;
			data.sendImg = result;
			data.date = new Date().toLocaleString();
			var temp = JSON.stringify(data);
			ws.send(temp);
		 }	
	 })
	 btnUpload.src = "../images/Loading_icon.gif";
}

/* ????????? */
var requiredTime = document.querySelector('.requiredTime_hidden').value; //????????????
console.log("requiredTime : " + requiredTime);
if(requiredTime!=""){
	if(requiredTime=="1??? 20???"){
		requiredTime=80;
	}else if(requiredTime=="5???"){
		requiredTime=300;
	}else if(requiredTime=="10???"){
		requiredTime=600;
	}else if(requiredTime=="15???"){
		requiredTime=900;
	}else if(requiredTime=="20???"){
		requiredTime=1200;
	}else if(requiedTime=="30???"){
		requiredTime=1800;
	}else if(RequiredTime=="45???"){
		requiredTime=2700;
	}else{
		requiredTime=3600;
	}
	
	var min = ""; //???
	var sec = ""; //???

	// set interval(??????, ??????) : ???????????? ??????
	var x = setInterval(function() {
		//parseInt() : ????????? ??????
		min = parseInt(requiredTime/60); //?????? ??????
		sec = requiredTime%60; //???????????? ??????
		
		//???????????? 10??? ????????????
		if(requiredTime < 600 && requiredTime >= 60){ 
			document.getElementById("timerDiv").style.right = "60px";
		}
		
		//???????????? 60??? ????????????
		if(requiredTime >= 60){ 
			document.getElementById("timerDiv").innerHTML = min + "???" + sec + "???";
		}
		
		//1??? ???????????? ??????
		if(requiredTime == 60){
			if($('.relation_hidden').val()=="menti"){
				data.job = "oneMinute";
				data.roomCode = roomCode;
				var temp = JSON.stringify(data);
				ws.send(temp);
			}
		}
		
		//???????????? 60????????? ??????
		if(requiredTime < 60){
			document.getElementById("timerDiv").innerHTML =  sec + "???";
			document.getElementById("timerDiv").style.right = "80px";
		}
		//10??? ????????????
		if(requiredTime <= 10){
			document.getElementById("timerDiv").style.color = "red";
		}
		
		requiredTime--;
		//???????????? ???
		if(requiredTime < 0) {
			clearInterval(x); //setInterval() ????????? ??????
			document.getElementById("timerDiv").style.color = "white";
			document.getElementById("timerDiv").innerHTML = "????????????";
			document.getElementById("remainning_time").innerHTML = "";
			var msg = document.querySelector('#msg');
			msg.readOnly = true;
			document.getElementById('senderDiv').style.background = "#e2e2e2";
			document.getElementById('msg').style.background = "#e2e2e2";
			document.getElementById('msg').style.padding = "10px";
			$("#btnSend").attr("type", "hidden");
			btnUpload.style.visibility = "hidden";
			msg.style.textAlign = "center";
			msg.value=' ??????????????? ?????????????????????.\n ????????? ?????? ????????? ?????? ?????????';
			if($('.chat_complete_check').val() != "complete"){
				console.log("??????????????? ??????");
				$('.btnComplete').trigger("click");
				$('.btnFinalComplete').trigger("click");
			}
		}
	}, 1000);
}

/* ?????? ???????????? ????????? ????????? */
$('.btnComplete').on('click', function() {
	var popupCall = `<div class='popupCallDiv'>
		<span>????????? ?????????????????????????</span><br/><br/>
		<input type="button" style="background-color:#a8a8c8;" value="??? ???" class="btnFinalComplete">
		<input type="button" value="??? ???" class="btnRefuseComplete">			
	</div>`;
	
	$("#talk").append(popupCall);
});

/* ?????? ?????? ???????????? ????????? */
$(document).on('click', '.btnFinalComplete', function() {
	data.job = "chatComplete";
	data.myId = $('.sessionId_hidden').val();
	data.yourId = $('.yourId_hidden').val();
	data.roomCode = roomCode;
	var temp = JSON.stringify(data);
	ws.send(temp);
	$('.btnComplete').hide();
	$(this).parent().remove();
});

/* ?????? ?????? ???????????? ????????? */
$(document).on('click', '.btnRefuseComplete', function() {
	$(this).parent().remove();
});

/* ????????? ????????????(?????? ??????) */
console.log(roomCode);
if(roomCode=="emptyRoom"){
	document.querySelector('.btnBack').style.visibility="visible";
	setTimeout(function() {
		talk.scrollTop=talk.scrollHeight;//???????????? ???????????? ??????
	},50);
	var msg = document.querySelector('#msg');
	msg.readOnly = true;
	document.getElementById('senderDiv').style.background = "#e2e2e2";
	document.getElementById('msg').style.background = "#e2e2e2";
	document.getElementById('msg').style.padding = "20px";
	$("#btnSend").attr("type", "hidden");
	btnUpload.style.visibility = "hidden";
	msg.style.textAlign = "center";
	msg.value='    ????????? ????????? ??????????????????';
}

/* ???????????? ??????(??????????????? ???????????? ??? ???????????? ????????? ??????) */

function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;

</script>
</html>