<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" >
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel='stylesheet' href='../css/pixel.css'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>pixel/pixel_buy_popup.jsp</title>
</head>
<body>
	<h2 class="pg_title">픽셀충전</h2>
	<div class="inwrap">
	<c:forEach var="vo" items="${list }">
		<div class="item_pixel container text-center">
			<div class="st_area st1">
				<form class='pixel_frm1' method='post'>
					<input type='hidden' class='member_id' name='id' value=''/>
					<input type='hidden' name="pixel_buy_amount" value="${vo.pixel_1_amount }">
					<input type='hidden' name="pixel_buy_price" value="${vo.pixel_1_price }">				
					<div class="buy">
						<div class="area">
							<span class='pixelfont'>픽셀</span>
							<span class="num num1"><strong><fmt:formatNumber value="${vo.pixel_1_amount }" pattern="#,###"/></strong>
							</span><span class='pixelfont'>개</span> <span class="price price1"><fmt:formatNumber value="${vo.pixel_1_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy1" onclick="requestPay1()">구매하기</button>
					</div>
				</form>	
			</div>
			<div class="st_area st2">
				<form class='pixel_frm2' method='post'>
					<input type='hidden' class='member_id' name='id' value=''/>				
					<input type='hidden' name="pixel_buy_amount" value="${vo.pixel_2_amount }">
					<input type='hidden' name="pixel_buy_price" value="${vo.pixel_2_price }">
					<div class="buy">
						<div class="area">
							<span class='pixelfont'>픽셀</span><span class="num num2"><strong><fmt:formatNumber value="${vo.pixel_2_amount }" pattern="#,###"/></strong>
							</span><span class='pixelfont'>개</span> <span class="price price2"><fmt:formatNumber value="${vo.pixel_2_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy2" onclick="requestPay2()">구매하기</button>
					</div>
				</form>
			</div>
			<div class="st_area st3">
				<form class='pixel_frm3' method='post'>
					<input type='hidden' class='member_id' name='id' value=''/>
					<input type='hidden' name="pixel_buy_amount" value="${vo.pixel_3_amount }">
					<input type='hidden' name="pixel_buy_price" value="${vo.pixel_3_price }">
					<div class="buy">
						<div class="area">
							<span class='pixelfont'>픽셀</span><span class="num num3"><strong><fmt:formatNumber value="${vo.pixel_3_amount }" pattern="#,###"/></strong>
							</span><span class='pixelfont'>개</span> <span class="price price3"><fmt:formatNumber value="${vo.pixel_3_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy3" onclick="requestPay3()">구매하기</button>
					</div>
				</form>
			</div>

			<div class="st_area st4">
				<form class='pixel_frm4' method='post'>
					<input type='hidden' class='member_id' name='id' value=''/>
					<input type='hidden' name="pixel_buy_amount" value="${vo.pixel_4_amount }">
					<input type='hidden' name="pixel_buy_price" value="${vo.pixel_4_price }">
								
					<div class="buy">
						<div class="area">
							<span class='pixelfont'>픽셀</span><span class="num num4"><strong><fmt:formatNumber value="${vo.pixel_4_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span><span class="price price4"><fmt:formatNumber value="${vo.pixel_4_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy4" onclick="requestPay4()">구매하기</button>
					</div>
				</form>
			</div>

			<div class="st_area st5">
				<form class='pixel_frm5' method='post'>
					<input type='hidden' class='member_id' name='id' value=''/>
					<input type='hidden' name="pixel_buy_amount" value="${vo.pixel_5_amount }">
					<input type='hidden' name="pixel_buy_price" value="${vo.pixel_5_price }">
					<div class="buy">
						<div class="area">
							<span class='pixelfont'>픽셀</span><span class="num num5"><strong><fmt:formatNumber value="${vo.pixel_5_amount }" pattern="#,###"/></strong>
							</span><span class='pixelfont'>개</span> <span class="price price5"><fmt:formatNumber value="${vo.pixel_5_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy5" onclick="requestPay5()">구매하기</button>
					</div>
				</form>
			</div>

			<div class="st_area st6">
				<form class='pixel_frm6' method='post'>
					<input type='hidden' class='member_id' name='id' value=''/>
					<input type='hidden' name="pixel_buy_amount" value="${vo.pixel_6_amount }">
					<input type='hidden' name="pixel_buy_price" value="${vo.pixel_6_price }">				
					<div class="buy">
						<div class="area">
							<span class='pixelfont'>픽셀</span><span class="num num6"><strong><fmt:formatNumber value="${vo.pixel_6_amount }" pattern="#,###"/></strong>
							</span><span class='pixelfont'>개</span> <span class="price price6"><fmt:formatNumber value="${vo.pixel_6_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy6" onclick="requestPay6()">구매하기</button>
					</div>
				</form>
			</div>
		</div>
		</c:forEach>
	</div>
	<br />
	<h2>픽셀을 어디에 사용하나요?</h2>
	<div class="inwrap">
		<div class="item_pixel container text-center">
			<div class="st_area use1">
				<div class="buy">
					<dl>
						<dt>궁금한 것이 있을 땐?</dt>
						<dd>Q&A 게시판을 이용해보세요!</dd>
						<dd>이용자들이 답변해 줄 거예요.</dd>
					</dl>
				</div>
			</div>
			<div class="st_area use2">
				<div class="buy">
					<dl>
						<dt>전문가 상담이 필요할 땐?</dt>
						<dd>멘토 시스템을 이용해보세요!</dd>
						<dd>24시간 대기하고 있습니다.</dd>
					</dl>
				</div>
			</div>
			<div class="st_area use3">
				<div class="buy">
					<dl>
						<dt>현장감 있는 리뷰가 궁금할 땐?</dt>
						<dd>프리미엄 리뷰를 읽어보세요!</dd>
						<dd>전&현직원의 생생한 후기입니다.</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<div class="notice">
		<dl>
			<dt>픽셀 구매 안내</dt>
			<dd>구매한 픽셀의 유효기간은 구매일로 부터 5년 입니다.</dd>
			<dd>픽셀 보유/구매/환전 내역은 마이페이지에서 확인 하실 수 있습니다.</dd>
			<dd>픽셀 환전 신청은 마이페이지에서 가능합니다</dd>
			<dd>1일 픽셀 결제한도는 100,000개 입니다.</dd>
			<dd>
				미성년자가 결제할 경우 법정대리인이 동의하지 아니해도 본인 또는 법정대리인이 계약을 취소할 수 
				<strong>없습니다.</strong>
			</dd>
		</dl>
	</div>

<script>
var IMP = window.IMP;
IMP.init("imp68151717"); 
var param;
var frm;
var memberid = document.querySelectorAll('.member_id');
var pixel_price = document.querySelectorAll('.price');
var pixel_amount = document.querySelectorAll('.amount');

for(let i=0; i<memberid.length; i++){
	memberid[i].value = sessionId;
}
$('#popup_ok').on('click',function(){
	window.close();
	$('.kgLayer').remove();
})	
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
	    	window.resizeTo(500,500);
	    	window.reload();
	    	window.close();

	    }
	});

}
// -------------------------------------------------
// 카드결제 api -------------------------------------------------

var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
var IMP = window.IMP;    //안해도 괜찮다
IMP.init("imp68151717"); //본인 아임포트 가맹점 식별코드
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
</script>	
</body>
</html>