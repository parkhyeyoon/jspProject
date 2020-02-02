<%@page import="sun.security.mscapi.PRNG"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
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
		
		int bbsID = 0;
		if(request.getParameter("bbsID")!=null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		if(bbsID == 0){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않는 게시물입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("<script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
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
				<li><a href="main.jsp">메인</a>
				<li class = "active"><a href="bbs.jsp">게시판</a>
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
	<div class ="container">
		<div class = "row">
		<form method = "post" action = "writeAction.jsp">		
			<table class = "table table-striped" style= "text-align: center;border : 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan = "2" style = "background-color: #eeeeee; text-align : center;">게시판 글보기</th>
					</tr>	
				</thead>
				<tbody>
					<tr>
						<td style = "width: 20%;">글제목</td>
						<td colspan = "2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>							
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan = "2"><%= bbs.getBbsID()%></td>
					</tr>
					<tr>
						<td>작성일자</td>	
						<td colspan = "2"><%= bbs.getBbsDate()%></td>						
					</tr>
					<tr>
						<td>내용</td>	
						<td colspan = "2"  style = "min-height:200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>						
					</tr>
				</tbody>
			</table>
			<a href = "bbs.jsp" class = "btn btn-primary">목록</a>
			
			<!-- 해당글의 유저 id와 동일하다면 삭제와 수정이 가능함. -->
			<% 
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
					<a href = "update.jsp?bbsID=<%=bbsID%>" class = "btn btn-primary">수정</a>
					<a href = "deleteAction.jsp?bbsID=<%=bbsID%>&userID=<%=userID%>" class = "btn btn-primary">삭제</a>
			<%		
				}
			%>
		</form>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
</body>
</html>