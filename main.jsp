<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!Doctype html>
<html>
	<head>
		<!-- JQuery  -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- 부트스트랩 -->
		<link type="text/css" rel='stylesheet' href='./CSS/bootstrap.min.css'>
		<script src='./JS/bootstrap.min.js'></script>
		<!-- CSS/JS -->
		<link type="text/css" rel='stylesheet' href='./CSS/main.css'>
		<title>Enjoyable Word Note :D</title>
	</head>
	<body>
		<!-- login session -->
		<%
			// HttpSession session = request.getSession(); 
			String username = (String) session.getAttribute("WNUserName");
			String email = (String) session.getAttribute("WNEmail");
		%>
		<!-- 상단 메뉴 -->
		<nav class='navbar navbar-default navbar-fixed-top'>
			<div class="container">
				<a class="navbar-brand" href="#">Enjoyable Word Note :D</a>
				<!-- login 한 user 의 username 표시 -->
				<p class="navbar-text navbar-right" style="margin-right:10px;">Signed in as <a href="#" class="navbar-link"><%=username%></a></p>
			</div>
		</nav>
		<!-- homepage explanation -->
		<div class="jumbotron">
			<div class="container">
				<h1>Hello, <%=username%>!</h1>
				<p>site explanation</p>
			</div>
		</div>
		<!-- menu -->
		<div class="container">
			<div class="row">
				<div class="col-xs-6 col-md-3">
					<a href="wordList.jsp" class="thumbnail">
						<img src="./image/Class_Notes_256.png" alt="Word List">
	    			</a>
	    			<div class="caption">
						<h3>Word List</h3>
						<p>저장된 단어를 확인하고 추가, 삭제 할 수 있습니다.</p>
			    	</div>
	  			</div>
	  			<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img src="./image/Paper_and_pencil_256.png" alt="Word Test">
	    			</a>
	    			<div class="caption">
						<h3>Memory Your Word!</h3>
						<p>저장된 단어를 외워보세요!</p>
			    	</div>
	  			</div>
	  			<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img src="./image/Poker_cards_256.png" alt="Card Game">
	    			</a>
	    			<div class="caption">
						<h3>Turn Card Over!</h3>
						<p>단어들로 카드 게임을 해봅시다!</p>
			    	</div>
	  			</div>
	  			<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img src="./image/Cloud_with_Raindrops_256.png" alt="Rain Game">
	    			</a>
	    			<div class="caption">
						<h3>Words are falling!</h3>
						<p>떨어지는 뜻에 맞는 단어를 입력해요!</p>
			    	</div>
	  			</div>
			</div>
		</div>
	</body>
</html>