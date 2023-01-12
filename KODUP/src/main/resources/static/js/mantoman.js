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
	$('#mantoman_innerSection').load('/mantoman/mantoman_mentorlist'); 
});

$('#btnChatList').on('click', function() {
	$('#mantoman_innerSection').load('/mantoman/mantoman_chatlist'); 
});

document.querySelector('#btnMentorList').click();





$('.btnTest').on('click', function() {
	console.log(nickname);
	var mentoId = this.value;
	var mentiId = $('.mentiId_hidden').val();
	var nickname = document.querySelector(".mantoman_nickname").value;
	
	var html = `<script>
				dataArray.job = "mentoCall";
				dataArray.mentiId = "${mentiId}";
				dataArray.mentoId = "${mentoId}";
				dataArray.mentiNickname = "${nickname}";
				var temp = JSON.stringify(dataArray);
				ws.send(temp);
				</script>`;
	
	$(opener.document).find("#sockectController").append(html);
});