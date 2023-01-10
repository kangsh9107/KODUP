/**
 * login.jsp
 */

/***** 강수형 *****/
/***** JOIN *****/
//KODUP
$('.index_btnJoin').on('click', function() {
	$('#center').load('/login/join');
});

/***** LOGIN *****/
//KAKAO LOGIN
$('.index_btnKakaoJoin').on('click', function() {
	window.Kakao.Auth.login({
		scope: 'profile_nickname, account_email, gender',
		success: function(autoObj) {
			console.log("authObj : " + authObj);
			window.Kakao.API.request({
				url: '/v2/user/me',
				siccess: res => {
					const kakao_account = res.kakao.account;
					console.log("kakao_account : " + kakao_account);
				}
			});
		}
	});
});

//KODUP
$('.index_btnLoginR').on('click', function() {
	var frm = $('.index_login_form')[0];
	
	if(frm.id.value == '') {
		alert('아이디를 입력해주세요.');
	} else if(frm.pwd.value == '') {
		alert('비밀번호를 입력해주세요.');
	} else {
		var param = new FormData(frm);
	
		$.ajax({
			type: 'POST',
			url: '/login/loginR',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				$('#center').html(data);
				location.replace('/');
			}
		});
	}
});

/***** FIND ACCOUNT *****/
$('.index_find_account').on('click', function() {
	$('#center').load('/login/find_account');
});

/***** CHANGE PASSWORD ******/
$('.index_find_accountR').on('click', function() {
	$('#center').load('/login/change_pwd');
});
