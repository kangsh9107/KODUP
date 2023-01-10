/**
 * 
 */

var memberid = document.querySelector('.member_id');
// 카드결제 api -------------------------------------------------
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
function requestPay() {
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ //param
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "merchant_" + new Date().getTime(),
	    name : '픽셀 구매',
	    amount : 100,
	    buyer_id : memberid,
/*	 
	    buyer_email : 'iamport@siot.do',
	    buyer_tel : '010-1111-1111',
	    buyer_addr : '서울특별시 관악구 봉천동',
	    buyer_postcode : '11111'
*/	
	}, function(rsp) { //callback
	    if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	//jQuery로 HTTP 요청
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
	    	jQuery.ajax({
	    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
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
   			console.log(rsp);
   			console.log(rsp.name);
   			var tempName = rsp.name;
   			console.log(rsp.paid_amount);
   			var tempAmount = rsp.paid_amount;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}
// -------------------------------------------------