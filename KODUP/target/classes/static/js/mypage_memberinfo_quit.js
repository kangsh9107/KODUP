/**
 mypage_memberinfo_quit.js
 */

//(board = function(){
	

$('.btnQuit_Irreversible').on('click', function(){

	if( $('.member_quit_checkbox').is(":checked") == true) {
		console.log("탈퇴완료");
		
    	frm = $('.member_quit_frm')[0];
    	param = new FormData(frm);
    	
    	$.ajax({
    		type : 'POST',
    		url : '/board/mypage_memberinfo_quit_real',
    		contentType : false,
    		processData : false,
    		data : param,
    		dataType : 'html',
    		success : function(data){
			
				console.log("Asdfasdfasdf"); //콘솔 안 찍힘
				
    			$('#center').html(data);
    			setTimeout(() => {
					location.replace('/');
				}, 500);
    		}
    	})
		

	}else{
		alert("체크박스에 체크해주세요.");
		console.log("체크박스에 체크해주세요.");
		
}});
	