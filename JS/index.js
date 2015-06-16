$(document).ready(function(){
	$('.optionBT').click(function() {
		$('.optionBT').removeClass('active');
		$(this).addClass('active');

		if ( this.value == "1" ) {
			document.getElementById('user').style.display = 'inline-block';
			document.getElementById('submitBT').innerHTML = 'Sign Up';
			document.getElementById('loginForm').action = 'login.jsp?type=signup';
		} else if ( this.value == "2" ) {
			document.getElementById('user').style.display = 'none';
			document.getElementById('submitBT').innerHTML = 'Log In';
			document.getElementById('loginForm').action = 'login.jsp?type=login';
		}
	});
});

// 입력된 값에 대한 유효성 검사.
function checkSubmit() {
	// form elements에 입력된 값을 변수에 저장.
	var email = document.forms[0].email.value;
	var username = document.forms[0].user_name.value;
	var password = document.forms[0].password.value;
	
	// 로그인 버튼을 눌렀을 때
	if (document.getElementById('submitBT').innerHTML == "Log In") {
		// email주소가 입력되지 않은 경우
		if (email == null || email == "") {
			alert('E-mail 주소를 입력하세요.');
			document.forms[0].email.focus();
			return false;
		} 
		// password가 입력되지 않은 경우
		if (password == null || password == "") {
			alert('Password를 입력하세요');
			document.forms[0].password.focus();
			return false;
		}
	}
	// Sign in 버튼을 눌렀을 때 
	else {
		if (email == null || email == "") {
			alert('E-mail 주소를 입력하세요.');
			document.forms[0].email.focus();
			return false;
		} 
		// username이 입력되지 않은 경우
		if (username == null || username == "") {
			alert('User name을 입력하세요.');
			document.forms[0].user_name.focus();
			return false;
		}
		if (password == null || password == "") {
			alert('Password를 입력하세요');
			document.forms[0].password.focus();
			return false;
		}
	}
}
