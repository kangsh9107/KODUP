/**
 * login.jsp
 */

$(document).ready(function() {
	$(".index_login_form").keydown(function (key) {
		if (key.keyCode == 13) {
			$('.index_btnLoginR').click();
		}
	});
	
	$(".index_join_form").keydown(function (key) {
		if (key.keyCode == 13) {
			$('.index_btnJoinR').click();
		}
	});
});