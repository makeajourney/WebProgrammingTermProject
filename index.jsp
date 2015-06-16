<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<!-- for Mobile Enviroment -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!-- JQuery -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!-- CSS/JS -->
		<link rel="stylesheet" href="./CSS/index.css"/>
		<script src="./JS/index.js"></script>
		<title>Enjoyable Word Note :D</title>
	</head>
	<body>
		<div class="main col-md-4 container">
			<ul style="padding:0px;" class="nav nav-tabs container-fluid">
				<li role="presentation" class="optionBT active" value="1"><a href="#">Sign Up</a></li>
				<li role="presentation" class="optionBT" value="2"><a href="#">Log In</a></li>
			</ul>
			<form id="loginForm" onsubmit="return checkSubmit();" action="login.jsp?type=signup" method="post">
				<div class="form-group inputForm">
					<input type="email" class="form-control inputText" id="email" name="email" placeholder="이메일을 입력하세요">
				</div>
				<div class="form-group inputForm">
					<input type="text" class="form-control inputText" id="user" name="user_name" placeholder="사용자명을 입력하세요">
				</div>
				<div class="form-group inputForm">
					<input type="password" class="form-control inputText" id="password" name="password" placeholder="암호">
				</div>
				<button type="submit" class="btn btn-default btn-lg submitBT" id="submitBT" nsme="check">Sign Up</button>
			</form>
		</div>
	</body>
</html>