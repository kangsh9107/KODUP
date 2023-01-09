/**
 * login.jsp
 */

/***** 강수형 *****/
/***** JOIN *****/
//KODUP
$('.index_btnJoin').on('click', function() {
	$('#center').load('/login/join');
});

//KAKAO

/***** FIND ACCOUNT *****/
$('.index_find_account').on('click', function() {
	$('#center').load('/login/find_account');
});

/***** CHANGE PASSWORD ******/
$('.index_find_accountR').on('click', function() {
	$('#center').load('/login/change_pwd');
});
