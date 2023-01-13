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
	$('#mantoman_innerSection').load('/mantoman/mantoman_chatlist'); 
});

document.querySelector('#btnMentorList').click();

/* 멘토요청시 작성내용 동적삽입 */
$(document).on("click", ".btnCall", function() {
	var html = `<div class="mentorCallDiv">
					<div class='wrapper'>
					<span>보상픽셀</span>
						<input type="text" class="rewardPixel">
						<input type="button" class="btnAccess" value="확인">
					</div>
					<div class='wrapper'>
					<span>질문내용</span>
						<input type="text" class="question">
						<input type="button" class="btnCancel" value="취소">
					</div>
				</div>`;
	$(this).parent("form").append(html);

});

/* 멘토요청 */
$(document).on("click", ".btnAccess", function() {
	var btnAccess = document.querySelector(".btnAccess");
	btnAccess.disabled=true;
	btnAccess.value='요청중';
	
	var btnCancel = document.querySelector(".btnCancel");
	btnCancel.value="요청취소";
	
	
	var mentoId = this.form.mentorId.value;
	var mentoNickname = this.form.mentoNickname.value;
	var mentiId = $('.mentiId_hidden').val();
	var mentiNickname = $('.mantoman_nickname').val();
	var rewardPixel = $('.rewardPixel').val();
	var question = $('.question').val();
	
	var html2 = `<script>
				dataArray.job = "mentoCall";
				dataArray.mentiId = "${mentiId}";
				dataArray.mentoId = "${mentoId}";
				dataArray.mentiNickname = "${mentiNickname}";
				dataArray.mentoNickname = "${mentoNickname}";
				dataArray.rewardPixel = "${rewardPixel}";
				dataArray.question = "${question}";
				
				var temp = JSON.stringify(dataArray);
				ws.send(temp);
				dataArray = {};
				</script>`;
	
	$(opener.document).find("#sockectController").append(html2);
});

/* 요청 취소 버튼 클릭시 */
$(document).on("click", ".btnCancel", function() {
    var btnCancel = document.querySelector(".btnCancel").value;
    if(btnCancel=="취소"){
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
	console.log("확인");
	var html4 = `<div class='CancelAlertDiv'>
				<span>멘토요청이 취소되었습니다.</span><br/>
				<input type='button' class='CancelCheck' value='확인'>
				</div>`;
				
	$(this).parent("div").parent("div").parent("form").append(html4);
	}
});

/* 요청취소 확인 버튼 클릭시 */
$(document).on("click", ".CancelCheck", function() {
	$(this).parent("div").prev("div").remove();
	$(this).parent("div").remove();
	
});
