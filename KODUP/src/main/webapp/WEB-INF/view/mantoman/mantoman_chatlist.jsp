<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_chatlist.jsp</title>
</head>
<body>
<div class='slide_in'>
	<div class='chatlist'>
		<c:forEach var='mtmVo' items='${list }'>
				<form class='chat_user separator'>
					<img src="../images/${mtmVo.profile_img}" class="mentoProfile_img">
					<input type='hidden' name='yourProfile_img_hidden' value='${mtmVo.profile_img}'>
					<input type='hidden' name='roomCode_hidden' value='${mtmVo.roomCode }'>
					<input type='hidden' name='yourNickname_hidden' value='${mtmVo.nickname }'>
					<input type='hidden' name='yourId_hidden' value='${mtmVo.your_id }'>
					<input type='hidden' name='mantoman_pixel_reward_hidden' value='${mtmVo.mantoman_pixel_reward }'>
					<input type='hidden' name='doc_hidden' value='${mtmVo.doc }'>
					<div class='clickSection'>
						<span class='profile_nickname'>${mtmVo.nickname}</span>
						<span class='nal'>${mtmVo.last_talktime }</span><br>
						<span class='last_talk'>${mtmVo.last_talk }</span>
					</div>
				</form>
		</c:forEach>
			
		<form class='chat_user separator'>
			<img src="../images/girlchar.png" class="mentoProfile_img">
			<div class='clickSection'>
				<span class='profile_nickname'>이리나이</span>
				<span class='nal'>2023-01-07 17:38:32</span><br>
				<span class='last_talk'>네 다음에 또 얘기해요!</span>
			</div>
		</form>
		<form class='chat_user separator'>
			<img src="../images/devil_profile.png" class="mentoProfile_img">
			<div class='clickSection'>
				<span class='profile_nickname'>딥러닝악마</span>
				<span class='nal'>2023-01-06 12:30:13</span><br>
				<span class='last_talk'>고생하셨습니다!</span>
			</div>
		</form>
		<form class='chat_user separator'>
			<img src="../images/cat_profile.png" class="mentoProfile_img">
			<div class='clickSection'>
				<span class='profile_nickname'>min2us</span>
				<span class='nal'>2023-01-01 21:36:21</span><br>
				<span class='last_talk'>넹 안녕히주무세요!</span>
			</div>
		</form>
	</div>
</div>
<script>

$('.mentoProfile_img').on('click',function() {
	var title  = "member/member_profile_chat.jsp";
	var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=400, left=870"; 
    window.open("/profile/member_profile_chat", title, status);
});

$(document).on("click", ".clickSection", function() {
	var roomCode = this.parentNode.roomCode_hidden.value;

	var mentoId = this.parentNode.yourId_hidden.value;
	var mentoNickname = this.parentNode.yourNickname_hidden.value;
	var mentoProfile_img = this.parentNode.yourProfile_img_hidden.value;

	var mentiId = $('.mentiId_hidden').val();
	var mentiNickname = $('.mantoman_nickname').val();
	var mentiProfile_img = $('.mentiProfile_img_hidden').val();

	var mantoman_pixel_reward = this.parentNode.mantoman_pixel_reward_hidden.value;
	var doc = this.parentNode.doc_hidden.value;
	
	console.log("mantoman_pixel_reward : " + mantoman_pixel_reward);
	console.log("doc : " + doc);
	
	var mentiProfile_img = $('.mentiProfile_img_hidden').val();
	
	var params = {
    	roomCode : "emptyRoom",
    	yourNickname : mentoNickname,
    	myNickname : mentiNickname,
    	sessionId : mentiId,
    	yourId : mentoId,
    	mantoman_pixel_reward : mantoman_pixel_reward,
    	myProfile_img : mentiProfile_img,
    	yourProfile_img : mentoProfile_img,
    	doc : doc
    }
	
	$.ajax({
        type : "GET",
        url : "/mantoman/mantoman_before_chatview",
        data: params,
        success : function(data){
			$(".slide").html(data);
			if(data=="fail"){
				alert("저장중 오류 발생");
			}
        }
    })
});

</script>
</body>
</html>