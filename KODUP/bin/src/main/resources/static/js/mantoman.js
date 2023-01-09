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

$('#mantoman_innerSection').load('/mantoman/mantoman_mentorlist');

$('#btnMentorList').on('click', function() {
	$('#mantoman_innerSection').load('/mantoman/mantoman_mentorlist'); 
});

$('#btnChatList').on('click', function() {
	$('#mantoman_innerSection').load('/mantoman/mantoman_chatlist'); 
});


