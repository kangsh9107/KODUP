/**
 * profile.js
 */

/*-------------------------네비게이션 슬라이딩 바---------------------------*/

var horizontalBar = document.querySelector("#horizontal-underline");
var horizontalMenus = document.querySelectorAll(".atag");

function horizontalIndicator(e) {
  horizontalBar.style.left = e.offsetLeft + "px";
  horizontalBar.style.width = e.offsetWidth + "px";
  horizontalBar.style.top = e.offsetTop + e.offsetHeight + 5 + "px";
}

horizontalMenus.forEach((menu) =>
  menu.addEventListener("click", (e) =>
    horizontalIndicator(e.currentTarget)
  )
);

/*------------------------------------------------------------------------*/

$('#profile_innerSection').load('/profile/member_profile_myarticle');

$('#btnMyarticle').on('click', function() {
	$('#profile_innerSection').load('/profile/member_profile_myarticle'); 
});



$('#btnMyrepl').on('click', function() {
	$('#profile_innerSection').load('/profile/member_profile_myrepl'); 
});



