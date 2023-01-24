/**
 mypage_pixel.js
 */

//나의 페이지 > 나의픽셀 > 충전버튼 클릭 시
$('.btn_mypage_pixel_charge').on('click', function(){
	console.log("충전페이지로 이동");
	$('#center').load('/pixel/pixel_buy');	
});


//나의 페이지 > 나의픽셀 > 전체 환전하기 클릭 시
$('.btn_mypage_pixel_exchange_total').on('click', function(){
		console.log(sessionId);
		var pixel = $('.class_pixel').val();
		
	if(pixel >= 10000){
		
		$('.class_pixel_want_exchange').attr('value', $('.class_pixel').val());
		
	} else {
		alert("환전은 1만 픽셀부터 가능합니다"); 
	};
	
});



//나의 페이지 > 나의픽셀 > 환전신청버튼 클릭 시
$('.btn_mypage_pixel_exchange').on('click', function(){
	
	var pixel = $('.class_pixel').val();
	var pixel_want_exchange = $('.class_pixel_want_exchange').val();
	
	console.log("보유픽셀: " + $('.class_pixel').val());	
	console.log("환전희망픽셀" + $('.class_pixel_want_exchange').val());


	if((pixel < pixel_want_exchange) || (pixel_want_exchange < 10000)) {
		
		alert('환전신청 픽셀은 보유픽셀을 초과할 수 없으며 최소 10000픽셀부터 환전가능합니다');		
	} else {
	
		var frm = $('.pixel_exchange')[0];
		var param = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url : '/board/mypage_pixel_exchange',
			contentType : false,
			processData : false,
			data : param,
			dataType : 'html',
			success: function(data){
				
				$('#m_section2').load('/board/mypage_mypixel');
				}
			});
		}
				console.log("환전 후 남은픽셀" + $('.class_pixel').val());
	}); 

//나의 페이지 > 나의픽셀 > 전체 버튼 클릭 시
$('.btn_mypage_pixel_total_list').on('click', function(){
	console.log("픽셀 전체 이력");
	$('#m_section2').load('/board/mypage_mypixel');
});


//나의 페이지 > 나의픽셀 > 획득 버튼 클릭 시
$('.btn_mypage_pixel_charge_list').on('click', function(){
	console.log("픽셀 획득 이력");
	$('#m_section2').load('/board/mypage_pixel_get');
});


//나의 페이지 > 나의픽셀 > 사용 버튼 클릭 시
$('.btn_mypage_pixel_exchange_list').on('click', function(){
	console.log("픽셀 사용 이력");
	$('#m_section2').load('/board/mypage_pixel_use');
});


//픽셀 페이징 처리
/*
var value = $('.mypixel_hidden_btn').val();

$('.btn_mypage_pixel_total_list').on("click", function(){
		console.log("전체버튼클릭");
	value = 1;
	console.log(value);
});


$('.btn_mypage_pixel_charge_list').on("click", function(){
		console.log("획득버튼클릭");
	//$('.mypixel_hidden_btn').attr('value', 2);
		value = 2;
		console.log(value);
});

$('.btn_mypage_pixel_exchange_list').on("click", function(){
		console.log("사용버튼클릭");
	value = 3;
	console.log(value);
});

*/
mypageMove = function(nowPage){
	frm = $('.frm_search')[0];
	frm.nowPage.value = nowPage;
	param = $(frm).serialize();
	
	console.log(nowPage);
	
	var value = $('.mypixel_hidden_btn').val();
	
	$('.btn_mypage_pixel_total_list').on("click", function(){
		console.log("전체버튼클릭");
		value = 1;
		console.log(value);
	});
	
	
	$('.btn_mypage_pixel_charge_list').on("click", function(){
			console.log("획득버튼클릭");
		//$('.mypixel_hidden_btn').attr('value', 2);
			value = 2;
			console.log(value);
	});
	
	$('.btn_mypage_pixel_exchange_list').on("click", function(){
			console.log("사용버튼클릭");
		value = 3;
		console.log(value);
	});
	
	if(value == 1){
		$.post("/board/mypage_mypixel", param, function(data){
			$('#m_section2').html(data);
	    })
	} else if(value == 2){
		$.post("/board/mypage_mypixel_get", param, function(data){
			$('#m_section2').html(data);
		})
	} else {
		$.post("/board/mypage_mypixel_use", param, function(data){
			$('#m_section2').html(data);
	})
}
}


/*
mypageMove = function(nowPage){
	frm = $('.frm_search')[0];
	frm.nowPage.value = nowPage;
	param = $(frm).serialize();
	
	console.log(nowPage);
	var value = $('.mypixel_hidden_btn').val();
	
	if(value=1){
	
		$.post("/board/mypage_mypixel", param, function(data){
			$('#m_section2').html(data);
	    })
	} else if (value=2){
		$.post("/board/mypage_mypixel_get", param, function(data){
			$('#m_section2').html(data);
	    })
		
	} else {
		$.post("/board/mypage_mypixel_use", param, function(data){
			$('#m_section2').html(data);
	})
};
*/
/* 원래 있던 거
mypageMove = function(nowPage){
	frm = $('.frm_search')[0];
	frm.nowPage.value = nowPage;
	param = $(frm).serialize();
	
	console.log(nowPage);
	
	$.post("/board/mypage_mypixel", param, function(data){
		$('#m_section2').html(data);
    })
}

*/



//버튼 클릭 시 컨트롤러
/*
var value = $('.mypixel_hidden_btn').val();

$('.btn_mypage_pixel_total_list').on("click", function(){
		console.log("전체버튼클릭");
	value = 1;
	console.log(value);
});


$('.btn_mypage_pixel_charge_list').on("click", function(){
		console.log("획득버튼클릭");
	value = 2;
});

$('.btn_mypage_pixel_exchange_list').on("click", function(){
		console.log("사용버튼클릭");
	value = 3;
});
*/
