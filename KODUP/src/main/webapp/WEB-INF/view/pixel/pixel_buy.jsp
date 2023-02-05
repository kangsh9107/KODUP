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
<link rel='stylesheet' href='css/pixel.css'>
<script defer src="js/pixel.js"></script>
<title>pixel/pixel_buy.jsp</title>
</head>
<body>
	<h3 class="pg_title">픽셀충전</h3>
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
							<span class="num num1"><strong><fmt:formatNumber value="${vo.pixel_1_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span>
							<span class="price price1"><fmt:formatNumber value="${vo.pixel_1_price }" pattern="#,###"/></span>원
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
							<span class='pixelfont'>픽셀</span>
							<span class="num num2"><strong><fmt:formatNumber value="${vo.pixel_2_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span>
							<span class="price price2"><fmt:formatNumber value="${vo.pixel_2_price }" pattern="#,###"/></span>원
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
							<span class='pixelfont'>픽셀</span>
							<span class="num num3"><strong><fmt:formatNumber value="${vo.pixel_3_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span>
							<span class="price price3"><fmt:formatNumber value="${vo.pixel_3_price }" pattern="#,###"/></span>원
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
							<span class='pixelfont'>픽셀</span>
							<span class="num num4"><strong><fmt:formatNumber value="${vo.pixel_4_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span>
							<span class="price price4"><fmt:formatNumber value="${vo.pixel_4_price }" pattern="#,###"/></span>원
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
							<span class='pixelfont'>픽셀</span>
							<span class="num num5"><strong><fmt:formatNumber value="${vo.pixel_5_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span>
							<span class="price price5"><fmt:formatNumber value="${vo.pixel_5_price }" pattern="#,###"/></span>원
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
							<span class='pixelfont'>픽셀</span>
							<span class="num num6"><strong><fmt:formatNumber value="${vo.pixel_6_amount }" pattern="#,###"/></strong></span>
							<span class='pixelfont'>개</span>
							<span class="price price6"><fmt:formatNumber value="${vo.pixel_6_price }" pattern="#,###"/></span>원
						</div>
						<button type="button" class="btn_buy btn_buy6" onclick="requestPay6()">구매하기</button>
					</div>
				</form>
			</div>
		</div>
		</c:forEach>
	</div>
	<br />
	<h4>픽셀을 어디에 사용하나요?</h4>
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
	
</body>
</html>