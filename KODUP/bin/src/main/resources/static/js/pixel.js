/**
 * 
 */

var param;
var frm;
var memberid = document.querySelectorAll('.member_id');
var pixel_price = document.querySelectorAll('.price');
var pixel_amount = document.querySelectorAll('.amount');

for(let i=0; i<memberid.length; i++){
	memberid[i].value = sessionId;
}

// 카드결제 api -------------------------------------------------
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
function requestPay1() {
	frm = $('.pixel_frm1')[0];
	param = new FormData(frm);
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    amount : 100 /*(pixel_price[0].innerHTML).replace(/,/g , '') <- 주석삭제하면 DB에맞는 가격으로 결제됨*/,
	    name : '픽셀 구매'
	    }, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/pixel/pixel_buy_complete", //cross-domain error가 발생하지 않도록 주의
	    		contentType : false,
            	processData : false,
	    		type: 'POST',
	    		data: param,
	    		dataType: 'html',
	    		success : function(data){
					if(data != '') alert(data);
					param = $(frm).serialize();
					$('#center').load('/mypage/mypage_mypixel');
				}	

	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------
// 카드결제 api -------------------------------------------------
function requestPay2() {
	frm = $('.pixel_frm2')[0];
	param = new FormData(frm);
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    amount : 100/*(pixel_price[1].innerHTML).replace(/,/g , '')*/,
	    name : '픽셀 구매'
	    }, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/pixel/pixel_buy_complete", //cross-domain error가 발생하지 않도록 주의
	    		contentType : false,
            	processData : false,
	    		type: 'POST',
	    		data: param,
	    		dataType: 'html',
	    		success : function(data){
					if(data != '') alert(data);
					param = $(frm).serialize();
					$('#center').load('/mypage/mypage_mypixel');
				}	

	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------// 카드결제 api -------------------------------------------------
function requestPay3() {
	frm = $('.pixel_frm3')[0];
	param = new FormData(frm);
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    amount : 100 /*(pixel_price[2].innerHTML).replace(/,/g , '')*/,
	    name : '픽셀 구매'
	    }, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/pixel/pixel_buy_complete", //cross-domain error가 발생하지 않도록 주의
	    		contentType : false,
            	processData : false,
	    		type: 'POST',
	    		data: param,
	    		dataType: 'html',
	    		success : function(data){
					if(data != '') alert(data);
					param = $(frm).serialize();
					$('#center').load('/mypage/mypage_mypixel');
				}	

	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------// 카드결제 api -------------------------------------------------
function requestPay4() {
	frm = $('.pixel_frm4')[0];
	param = new FormData(frm);
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    amount : 100 /*(pixel_price[3].innerHTML).replace(/,/g , '')*/,
	    name : '픽셀 구매'
	    }, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/pixel/pixel_buy_complete", //cross-domain error가 발생하지 않도록 주의
	    		contentType : false,
            	processData : false,
	    		type: 'POST',
	    		data: param,
	    		dataType: 'html',
	    		success : function(data){
					if(data != '') alert(data);
					param = $(frm).serialize();
					$('#center').load('/mypage/mypage_mypixel');
				}	

	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------// 카드결제 api -------------------------------------------------
function requestPay5() {
	frm = $('.pixel_frm5')[0];
	param = new FormData(frm);
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    amount : 100 /*(pixel_price[4].innerHTML).replace(/,/g , '')*/,
	    name : '픽셀 구매'
	    }, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/pixel/pixel_buy_complete", //cross-domain error가 발생하지 않도록 주의
	    		contentType : false,
            	processData : false,
	    		type: 'POST',
	    		data: param,
	    		dataType: 'html',
	    		success : function(data){
					if(data != '') alert(data);
					param = $(frm).serialize();
					$('#center').load('/mypage/mypage_mypixel');
				}	

	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------// 카드결제 api -------------------------------------------------
function requestPay6() {
	frm = $('.pixel_frm6')[0];
	param = new FormData(frm);
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    amount : 100 /*(pixel_price[5].innerHTML).replace(/,/g , '')*/,
	    name : '픽셀 구매'
	    }, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/pixel/pixel_buy_complete", //cross-domain error가 발생하지 않도록 주의
	    		contentType : false,
            	processData : false,
	    		type: 'POST',
	    		data: param,
	    		dataType: 'html',
	    		success : function(data){
					if(data != '') alert(data);
					param = $(frm).serialize();
					$('#center').load('/mypage/mypage_mypixel');
				}	

	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------