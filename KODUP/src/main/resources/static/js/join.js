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
    Kakao.Auth.login({
		scope: 'account_email', //가져올 항목
        success: function(response) {
            Kakao.API.request({ //사용자 정보 가져오기 
                url: '/v2/user/me',
                success: (res) => {
                	var id = res.id+"K";
                	var email = res.kakao_account.email;
                	$('#center').load('/login/join_kakao_check?id=' + id + "&email=" + email);
                }
            });
        },
        fail: function(error) {
            alert(error);
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

/*
$.ajax({
	type : "post",
	url : '/login/join_kakao_check', //ID중복체크를 통해 회원가입 유무를 결정하고, join_kakao.jsp로 이동 후 
	data : { "userid":kakaoid },
	dataType: "json",
	success : function(json) {
		if(json.idExists) {
			$('#center').load('/login/loginR'); //존재하는 경우 로그인 처리
		} else {
			$.ajax({
				type : "post",
				url : '/login/join_kakao', //INSERT
				data : {"id":kakaoid,
					    "email":response.kakao_account.email},
				dataType :"json",
				success : function(json) {
					if(json.success) {
						$('#center').load('/login/loginR');
					} else {
						alert('카카오 회원가입 실패. 일반계정으로 로그인하시기 바랍니다.');
					}
				},
				error: function(request, status, error) {
	                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
			});
		}						
	},
	error: function(request, status, error) {
           alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    }
});
*/

/***** FIND ACCOUNT *****/
$('.index_find_account').on('click', function() {
	$('#center').load('/login/find_account');
});

/***** CHANGE PASSWORD ******/
$('.index_find_accountR').on('click', function() {
	$('#center').load('/login/change_pwd');
});
