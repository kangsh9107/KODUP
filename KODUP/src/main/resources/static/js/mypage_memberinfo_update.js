/**
 	mypage_memberinfo_update.js
 */

/*(update = function(){
	var frm= $('.frm')[0];
	var param;
})*/

 //회원정보_내 정보수정_수정취소 버튼 클릭 시
$('.mypage_update_cancel').on('click', function(){
	console.log("수정취소 버튼");
	$('#m_section2').load('/board/mypage_memberinfo');
});



//회원정보 수정 시 수정되는 코드 (글만)
/*$('.mypage_update_complete').on('click', function(){
 	param = $('.memberinfo_update_complete').serialize();
 	
 	$.post("/board/mypage_memberinfo_update_complete", param, function(data){
	$('#m_section2').html(data);
	});
 })*/
 
 $('.mypage_update_complete').on('click', function(){
	 var frm = $('.memberinfo_update_complete')[0];
	 var param = new FormData(frm);
	 
	 $.ajax({
		 type : 'POST',
		 url : '/board/mypage_memberinfo_update_complete',
		 contentType : false,
		 processData : false,
		 data : param,
		 dataType : 'html',
		 success: function(data){
			 
			setTimeout(() => {
				$('#m_section2').load('/board/mypage_memberinfo');
			}, 800)
		 }						
	 })
	 
 })
 
//회원정보 프로필 이미지 클릭 시 첨부 파일 창이 뜨는 코드.
var logo = document.querySelector('.mypage_member_profile_img');
var logofile = document.querySelector('.mypage_member_profile_btn');
logo.onclick = function(){
	logofile.click();
	console.log('첨부파일')
}

logofile.onchange=preview;
function preview(ev){
	let event = ev || window.event;
	let file = event.srcElement.files[0];
	
	let reader = new FileReader();
	reader.onload = function(){
		let pre_img = logo
		let img = new Image();
		img.src = reader.result;
		pre_img.src = img.src;
	}
	reader.readAsDataURL(file);
}
 