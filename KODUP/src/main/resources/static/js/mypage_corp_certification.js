/**
 mypage_corp_certification.js 
 */
 
$('.btn_index_move').on('click', function(){
	console.log("인덱스로 이동");
	$('#m_section2').load('/board/mypage_memberinfo');
});


//멘토인증
 $('.btn_mentor_certification').on('click', function(){
	 
	 var frm = $('.mentor_certification')[0];
	 var param = new FormData(frm);
	 
	 $.ajax({
		 type : 'POST',
		 url : '/board/mypage_mentor_certification',
		 contentType : false,
		 processData : false,
		 data : param,
		 dataType : 'html',
		 success: function(data){
			 
		 }						
	 })
	 
 })


//기업인증
 $('.btn_corp_certification').on('click', function(){
	 
	 var frm = $('.corp_certification')[0];
	 var param = new FormData(frm);
	 
	 $.ajax({
		 type : 'POST',
		 url : '/board/mypage_corp_certification',
		 contentType : false,
		 processData : false,
		 data : param,
		 dataType : 'html',
		 success: function(data){
			 
			/*setTimeout(() => {
				$('#m_section2').load('/board/mypage_memberinfo');
			}, 800)*/
		 }						
	 })
	 
 })