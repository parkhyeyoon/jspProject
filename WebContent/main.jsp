<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
<!-- 부트스트랩 반응형 웹 메타 태그 -->
<meta name = viewport" content = "width=device-width", initial-scale = "1">
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/common.css"> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%	//userID 값이 빈값이 아니면 해당 세션 값을 계속 유지
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
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
				<li class = "active"><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
			</ul>
			<%  //userID 값이 null 이면 접속하기 드롭다운 메뉴를 보여줌 
				if(userID  == null ){ 
			%>
			<ul>
				<li class ="dropdown">
					<a href= "#" class = "dropdown-toggle" 
					   data-toggle="dropdown" role ="button" aria-haspopup="true"
					   aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>			
			<%
				}else{				
			%>
			<ul>
				<li class ="dropdown">
					<a href= "#" class = "dropdown-toggle" 
					   data-toggle="dropdown" role ="button" aria-haspopup="true"
					   aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>				
			<%			
				}
			%>
			
		</div>
	</nav>
	
	<div class="jumbotron">
  		<h1>Hello, world!</h1>
  		<p>이 웹사이트는 부트스트랩으로 만든 jsp 웹사이트 입니다.최소한의 간단한 로직만을 이용해서 개발하였씁니다. 디자인 템플릿으로는 부트스트랩을 이용하였습니다.</p>
  		<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
	</div>
	
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  		<!-- Indicators -->
  		<ol class="carousel-indicators">
    		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
    		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
 		 </ol>

  		<!-- Wrapper for slides -->
  		<div class="carousel-inner" role="listbox">
    		<div class="item active">
      			<img src="image/1.JPG"  style = "align:center">
    		</div>
		    <div class="item">
		      	<img src="image/2.JPG"  style = "align:center">
	    	</div>
  		</div>
	  	<!-- Controls -->
	  	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    	<span class="sr-only">Previous</span>
	  	</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		</a>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
</body>
</html>