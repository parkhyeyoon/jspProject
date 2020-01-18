<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
<!-- 부트스트랩 반응형 웹 메타 태그 -->
<meta name = viewport" content = "width=device-width", initial-scale = "1">
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
					data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
			</button>
			<a class = "navbar-brand" href = "main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<div class ="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
			</ul>
			<ul>
				<li class ="dropdown">
					<a href= "#" class = "dropdown-toggle" 
					   data-toggle="dropdown" role ="button" aria-haspopup="true"
					   aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>			
		</div>
	</nav>
	<div class = "container" style="background-color: pink;">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<div class = "jsmbotron" style="padding-top: 20px;">
				<!-- loginAction 페이지로 로그인 정보를 보내기 위한 form -->
				<form method = "post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입화면</h3>
					<div class="form-group"> 
						<input type="text" class = "form-control" placeholder = "아이디 " name = "userID" maxlength="20">
					</div>
					<div class="form-group"> 
						<input type="password" class = "form-control" placeholder = "비밀번호" " name = "userPassword" maxlength="20">
					</div>
					<div class="form-group"> 
						<input type="text" class = "form-control" placeholder = "이름 " name = "userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align:center;"> 
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type= "radio" name = "userGender" autocomplete = "off" value = "남자" checked>남자
							</label>
							<label class="btn btn-primary">
								<input type= "radio" name = "userGender" autocomplete = "off" value = "여자" >여자
							</label>						
						</div>
					</div>
					<div class="form-group"> 
						<input type="email" class = "form-control" placeholder = "이메일" " name = "userEmail" maxlength="50">
					</div>					
					<input type="submit" class="btn btn-primary form-control" value ="회원가입">
				</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
</body>
</html>