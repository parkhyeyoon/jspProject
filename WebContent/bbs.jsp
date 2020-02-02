<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
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
<style type ="text/css">
	a, a:hover{
		color : "#eeeeee";
		text-decoration: none;
	}
</style></head>
<body>
	<%	//userID 값이 빈값이 아니면 해당 세션 값을 계속 유지
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		int pageNumber = 1; // 기본 1페이지임
		if(request.getParameter("pageNumber") != null){
			String pageNubmerStr = request.getParameter("pageNumber").trim();
			pageNumber = Integer.parseInt(pageNubmerStr);
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
			<table class = "table table-striped" style= "text-align: center;border : 1px solid #dddddd">
				<thead>
					<tr>
						<th style = "background-color: #eeeeee; text-align : center">번호</th>
						<th style = "background-color: #eeeeee; text-align : center">제목</th>
						<th style = "background-color: #eeeeee; text-align : center">작성자</th>
						<th style = "background-color: #eeeeee; text-align : center">작성일</th>
					</tr>	
				</thead>
				<tbody>
					<% 
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i<list.size(); i++){
					%>
					<tr>
						<td><%=list.get(i).getBbsID() %></td>
						<!-- 제목을 누를 경우 해당 게시글의 내용을 볼 수 있도록 이동 -->
						<td><a href = "view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle() %></a></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) +"시"+
							   list.get(i).getBbsDate().substring(14,16) +"분"%></td>		
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){ //1페이지가 아니면 이전 버튼 활성화
			%>
				<a href = "bbs.jsp?pageNumber= <%=pageNumber - 1%>" class = "btn btn-success btn-arraw-left">이전</a>
			<% 
				}
				
				if(bbsDAO.nextPage(pageNumber+1)){ //
			%>
				<a href = "bbs.jsp?pageNumber= <%=pageNumber + 1%>" class = "btn btn-success btn-arraw-right">다음</a>
			<%  
				}
			%>
			<%	if(userID != null && userID != ""){ %>
				<a href = "write.jsp" class ="btn btn-primary pull-right">글쓰기</a>
		    <%  } %>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
</body>
</html>