<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_chatview.jsp</title>
</head>
<body>
<div class='slide_in'>
	<a href='/mantoman/mantoman_index'>뒤로가기</a>
	<div id='web_client'>
		<div id='result'></div>
		<input type='text' id='msg'/>
		<input type='button' value='전송' id='btnSend'/>
	</div>
</div>

<script>
 var webSocket = new WebSocket('ws://192.168.35.78:8888/web-2022-08/chatting');

 webSocket.onopen = function(){
	 /*
	 let rs = document.querySelector('#result');
	 rs.innerHTML = "연결 성공!!!";
     */
	 $('#result').html('연결 성공!!!<br/>');
 }
 webSocket.onclose = function(){	
	 $('#result').html('연결 종료!!!');
 }
  
 webSocket.onmessage = function(msg){
  let str = "<div id='msg2' >" + msg.data + "</div>" + "<br/>";
  	$('#result').append(str);
	$('#result').scrollTop($('#result')[0].scrollHeight)
 }
  
 $('#msg').keyup(function(ev){
	  if(ev.keyCode==13) sendFunc();
 });
 $('#btnSend').click(sendFunc);
  
 function sendFunc(){
	let msg = $('#msg').val();
    webSocket.send( msg );
	console.log('msg : ' , msg)
 }
 
</script>
</body>
</html>