/**
 * login.jsp
 */

/***** 강수형 *****/
/***** JOIN & LOGIN *****/
//KODUP LOGIN FORM
$('.index_btnJoin').on('click', function() {
	$('#center').load('/login/join');
});

//KAKAO LOGIN API
$('.index_btnKakaoJoin').on('click', function() {
    Kakao.Auth.login({
		scope: 'account_email, profile_image', //가져올 항목
        success: function(response) {
            Kakao.API.request({ //사용자 정보 가져오기
                url: '/v2/user/me',
                success: (res) => {
                	var id = res.id+'K';
                	var email = res.kakao_account.email;
                	var img = res.properties.profile_image;
                	
					$.ajax({
						type: 'POST',
						url: '/login/join_kakao_check?id=' + id + '&email=' + email + '&img=' + img,
						contentType: false,
						processData: false,
						dataType: 'html',
						success: function(data) {
							$('#center').html(data);
						}
					});
                }
            });
        },
        fail: function(error) {
            alert(error);
        }
    });
});

//KAKAO LOGIN & JOIN
$('.index_btnKakaoJoinR').on('click', function() {
	var frm = $('.index_join_form')[0];
	
	var regExpNickname = /[^\w\sㄱ-힣()0-9]/g;
    if(frm.nickname.value == '') {
		alert('닉네임을 입력해주세요.');
	} else if(regExpNickname.test(frm.nickname.value) ||
			  frm.nickname.value.length <= 3          ||
			  frm.nickname.value.length > 16) {
		alert('닉네임은 4~16자로 한글, 영어, 숫자만 입력해주세요.');
    } else if(frm.date.value == '') {
		alert('생년월일을 선택해주세요.');
	} else if(grecaptcha.getResponse().length == 0) {
		alert('"로봇이 아닙니다"를 체크해주세요.');
	} else {
		var param = new FormData(frm);
		
		$.ajax({
			type: 'POST',
			url: '/login/join_kakao',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				if(data == 'duplicate_nickname') {
					alert('닉네임이 중복입니다. 닉네임을 변경해주세요.');
				} else if(data =='error_join') {
					alert('가입 오류입니다. 잠시후 다시 시도해주세요.');
				} else {
					$('#center').html(data);
					setTimeout(() => {
						location.replace('/');
					}, 200);
				}
			}
		});
	}
});

//KODUP LOGIN
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
				if(data == 'wrong_id&pwd') {
					alert('아이디와 비밀번호를 확인해주세요.');
				} else {
					$('#center').html(data);
					setTimeout(() => {
						location.replace('/');
					}, 200);
				}
			}
		});
	}
});

/***** KODUP JOIN *****/
$('.index_btnJoinR').on('click', function() {
	var frm = $('.index_join_form')[0];
	
	var regExpId = /^[a-z]+[a-z0-9]{5,19}$/g;
	var regExpPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var regExpNickname = /[^\w\sㄱ-힣()0-9]/g;
	
	if(frm.id.value == '') {
		alert('아이디를 입력해주세요.');
	} else if( !regExpId.test(frm.id.value) ) {
		alert('아이디는 6~20자 영문, 숫자만 가능하며 영문으로 시작해주세요.')
	} else if(frm.pwd.value == '') {
		alert('비밀번호를 입력해주세요.');
	} else if( !regExpPwd.test(frm.pwd.value) ) {
		alert('비밀번호는 8~16자로 영문, 숫자, 특수문자를 최소 한가지씩 조합해주세요.');
    } else if(frm.email.value == '') {
		alert('이메일을 입력해주세요.');
	} else if( !regExpEmail.test(frm.email.value) ) {
		alert('이메일을 양식에 맞게 입력해주세요. ex)kodup@naver.com');
    } else if(frm.nickname.value == '') {
		alert('닉네임을 입력해주세요.');
	} else if(regExpNickname.test(frm.nickname.value) ||
			  frm.nickname.value.length <= 3          ||
			  frm.nickname.value.length > 16) {
		alert('닉네임은 4~16자로 한글, 영어, 숫자만 입력해주세요.');
    } else if(frm.date.value == '') {
		alert('생년월일을 선택해주세요.');
	} else if(grecaptcha.getResponse().length == 0) {
		alert('"로봇이 아닙니다"를 체크해주세요.');
	} else {
		var param = new FormData(frm);
		
		$.ajax({
			type: 'POST',
			url: '/login/joinR',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				if(data == 'duplicate_id') {
					alert('아이디가 중복입니다. 아이디를 변경해주세요.');
				} else if(data =='duplicate_nickname') {
					alert('닉네임이 중복입니다. 닉네임을 변경해주세요.');
				} else if(data =='error_join') {
					alert('가입 오류입니다. 잠시후 다시 시도해주세요.');
				} else {
					$('#center').html(data);
					setTimeout(() => {
						location.replace('/');
					}, 200);
				}
			}
		});
	}
});

/***** FIND ACCOUNT *****/
$('.index_find_account').on('click', function() {
	$('#center').load('/login/find_account');
});

$('.index_find_accountR').on('click', function() {
	var frm = $('.index_find_account_form')[0];
	
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(frm.email.value == '') {
		alert('이메일을 입력해주세요.');
	} else if( !regExpEmail.test(frm.email.value) ) {
		alert('이메일을 양식에 맞게 입력해주세요. ex)kodup@naver.com');
    } else {
		var param = new FormData(frm);
		
		$.ajax({
			type: 'POST',
			url: '/login/find_accountR',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				if(data == 'not_found_email') {
					alert('가입하신 이메일을 입력해주세요.');
				} else if(data == 'error_send_email') {
					alert('이메일 발송 오류입니다. 잠시후 다시 시도해주세요.');
				} else {
					$('#center').html(data);
				}
			}
		});
	}
});

$('.index_find_account_keyR').on('click', function() {
	var frm = $('.index_find_account_key_form')[0];
	
	if(frm.keyR.value == '') {
		alert('인증키를 입력해주세요.');
	} else {
		var param = new FormData(frm);
		
		$.ajax({
			type: 'POST',
			url: '/login/find_account_keyR',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				if(data == 'error_send_email') {
					alert('메일전송에 실패했습니다. 잠시후 다시 시도해주세요.');
				} else if(data == 'error_key') {
					alert('인증키를 확인해주세요.');
				} else {
					$('#center').html(data);
				}
			}
		});
	}
});

/***** CHANGE PASSWORD ******/
$('.index_change_passwordR').on('click', function() {
	var frm = $('.index_change_password_form')[0];
	
	var regExpPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	
	if(frm.pwd.value == '') {
		alert('새로운 비밀번호를 입력해주세요.');
	} else if( !regExpPwd.test(frm.pwd.value) ) {
		alert('비밀번호는 8~16자로 영문, 숫자, 특수문자를 최소 한가지씩 조합해주세요.');
    } else {
		var param = new FormData(frm);
		
		$.ajax({
			type: 'POST',
			url: '/login/update_passwordR',
			contentType: false,
			processData: false,
			data: param,
			dataType: 'html',
			success: function(data) {
				if(data == 'error_pwd') {
					alert('비밀번호 변경에 실패했습니다. 잠시후 다시 시도해주세요.');
				} else {
					alert('비밀번호 변경 성공!');
					$('#center').html(data);
					setTimeout(() => {
						location.replace('/');
					}, 200);
				}
			}
		});
	}
});
