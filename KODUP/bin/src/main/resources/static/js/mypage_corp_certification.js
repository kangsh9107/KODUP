/**
 mypage_corp_certification.js 
 */
 
$(.btn_index_move').on('click', function(){
	console.log("인덱스로 이동")
	$(.m_section2').load('/board/mypage_memberinfo');
});