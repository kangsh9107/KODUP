/**
 	mypage_memberinfo_update.js
 */
 
 //회원정보_내 정보수정_수정취소 버튼 클릭 시
$('.mypage_update_cancel').on('click', function(){
	console.log("수정취소 버튼");
	$('#m_section2').load('/board/mypage_memberinfo');
});


//회원정보_내 정보수정_수정완료 버튼 클릭 시
$('.mypage_update_complete').on('click', function(){
	console.log("수정완료 버튼");
	//$('#m_section2').load('/board/mypage_memberinfo');
	$('#m_section2').load('/board/mypage_memberinfo_update_complete');
});
 