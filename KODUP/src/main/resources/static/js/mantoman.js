/**
 * mantoman.js
 */
/*-------------------------네비게이션 슬라이딩 바---------------------------*/

var horizontalBar = document.querySelector("#horizontal-underline");
var horizontalMenus = document.querySelectorAll(".atag");

function horizontalIndicator(e) {
  a=horizontalBar.style.left = e.offsetLeft + "px";
  b=horizontalBar.style.width = e.offsetWidth + "px";
  c=horizontalBar.style.top = e.offsetTop + e.offsetHeight + 5 + "px";
  console.log(a);
  console.log(b);
  console.log(c);
}

horizontalMenus.forEach((menu) =>
  menu.addEventListener("click", (e) =>
    horizontalIndicator(e.currentTarget)
  )
);

/*------------------------------------------------------------------------*/

//$('#mantoman_innerSection').load('/mantoman/mantoman_mentorlist');

$('#btnMentorList').on('click', function() {
	var mentiId = $('.mentiId_hidden').val();
	$('#mantoman_innerSection').load('/mantoman/mantoman_mentorlist?mentiId='+mentiId); 
});

$('#btnChatList').on('click', function() {
	var mentiId = $('.mentiId_hidden').val();
	$('#mantoman_innerSection').load('/mantoman/mantoman_chatlist?id='+mentiId);
});

document.querySelector('#btnMentorList').click();

/* 멘토요청시 작성내용-1 동적삽입 */
$(document).on("click", ".btnCall", function() {
	var html = `<div class="mentorCallDiv_1">
					<div class='wrapper'>
					<span>보상 픽셀</span>
					<input type="text" class="rewardPixel">
					<input type="button" class="btnNext" value="다 음">
					</div>
					<div class='wrapper'>
						<span>요구 시간</span>
						<select class="requiredTime">
						    <option value=""></option>
						    <option value="80">1분 20초</option>
						    <option value="300">5분</option>
						    <option value="600">10분</option>
						    <option value="1200">20분</option>
						    <option value="1800">30분</option>
						    <option value="2700">45분</option>
						    <option value="3600">60분</option>
						</select>
						<input type="button" class="btnCancel1" value="취 소">
					</div>
				</div>`;
	$(this).parent("form").append(html);

});

/* 멘토요청시 작성내용-2 동적삽입  */
$(document).on("click", ".btnNext", function() {
	console.log("실행확인");
	var html7 = `<div class="mentorCallDiv_2">
					<div class='wrapper'>
						<span>질문 내용</span>
						<textarea class="question"></textarea>
						<input type="button" class="btnAccess" value="확 인">
						<input type="button" class="btnCancel2" value="이 전">
					</div>
				</div>`;
	$(this).parent("div").parent("div").parent("form").append(html7);
	console.log("실행후 확인");
});

/* 멘토요청 */
$(document).on("click", ".btnAccess", function() {
	var btnAccess = document.querySelector(".btnAccess");
	btnAccess.disabled=true;
	btnAccess.value='요청중';
	btnAccess.style.backgroundColor = "#d08a9a";
	
	var btnCancel2 = document.querySelector(".btnCancel2");
	btnCancel2.value="요청취소";
	
	
	var mentoId = this.form.mentorId.value;
	var mentoNickname = this.form.mentoNickname.value;
	var mentoProfile_img = this.form.mentoProfile_img_hidden.value;
	
	var mentiId = $('.mentiId_hidden').val();
	var mentiNickname = $('.mantoman_nickname').val();
	var mentiProfile_img = $('.mentiProfile_img_hidden').val();
	
	var rewardPixel = $('.rewardPixel').val();
	var question = $('.question').val();
	var requiredTime = $('.requiredTime').val();
	
	var html2 = `<script>
				dataArray.job = "mentoCall";
				
				dataArray.mentiId = "${mentiId}";
				dataArray.mentiNickname = "${mentiNickname}";
				dataArray.mentiProfile_img = "${mentiProfile_img}";
				
				dataArray.mentoId = "${mentoId}";
				dataArray.mentoNickname = "${mentoNickname}";
				dataArray.mentoProfile_img = "${mentoProfile_img}";
				
				dataArray.rewardPixel = "${rewardPixel}";
				dataArray.question = "${question}";
				dataArray.requiredTime = "${requiredTime}";
				
				var temp = JSON.stringify(dataArray);
				ws.send(temp);
				dataArray = {};
				</script>`;
	
	$(opener.document).find("#sockectController").append(html2);
});

/* 작성내용-1 취소시 */
$(document).on("click", ".btnCancel1", function() {
	$(this).parent("div").parent("div").remove();
});
/* 요청 취소 버튼 클릭시 */
$(document).on("click", ".btnCancel2", function() {
    var btnCancel2 = document.querySelector(".btnCancel2").value;
    if(btnCancel2=="이 전"){
		$(this).parent("div").parent("div").remove();
	}else{
	var mentoId = this.form.mentorId.value;
	var mentiId = $('.mentiId_hidden').val();
	var nickname = $('.mantoman_nickname').val();
    
    var html3 = `<script>
				dataArray.job = "CancelCall";
				dataArray.mentiId = "${mentiId}";
				dataArray.mentoId = "${mentoId}";
				dataArray.mentiNickname = "${nickname}";
				
				var temp = JSON.stringify(dataArray);
				ws.send(temp);
				dataArray = {};
				</script>`;
				
	$(opener.document).find("#sockectController").append(html3);
	
	var html4 = `<div class='cancelAlertDiv'>
					<span class='cancelMsg'>멘토요청이 취소되었습니다.</span>
					<input type='button' class='CancelCheck' value='확인'>
				</div>`;
	
	$(this).parent("div").parent("div").parent("form").append(html4);
	}
});

/* 요청취소 확인 버튼 클릭시 */
$(document).on("click", ".CancelCheck", function() {
	$(this).parent("div").prev("div").prev("div").remove();
	$(this).parent("div").prev("div").remove();
	$(this).parent("div").remove();
});
