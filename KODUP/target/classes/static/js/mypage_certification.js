//mypage_corp_certification (인증페이지_기업인증)
$('.btn_corp_certification').on('click', function(){
	console.log("ok");
   var status = Number($("#status").val());
   if(status==0) {
      var frm = $('.corp_certification')[0];
      var param = new FormData(frm);
      
      $.ajax({
         type : 'POST',
         url : '/board/mypage_corp_certification',
         contentType : false,
         processData : false,
         data : param,
         dataType : 'html',
         success: function(data) {
			 alert('인증 신청 완료!');
            $('#m_section2').html(data);
         }
      });
   }
});