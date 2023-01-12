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
	 frm = $('.memberinfo_update_complete')[0];
	 param = new FormData(frm);
	 
	 $.ajax({
		 type : 'POST',
		 url : '/board/mypage_memberinfo_update_complete',
		 contentType : false,
		 processData : false,
		 data : param,
		 dataType : 'html',
		 success: function(data){
			 if(data != '')alert(data);
			 frm.enctype='';
			 param = $(frm).serialize();
			 $('#m_section2').load('/board/mypage_memberinfo_update', param);
		 }
	 })
	 
 })
 
 
 
 
 
 
 
 
 