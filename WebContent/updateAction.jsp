<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class = "bbs.Bbs" scope = "page"/>
<jsp:setProperty name = "bbs" property= "bbsTitle" />
<jsp:setProperty name = "bbs" property= "bbsID" />
<jsp:setProperty name = "bbs" property= "bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
<title>jsp 게시판 웹 사이트</title>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");	
		}
		else{
			if(bbs.getBbsTitle()==null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 값이 있습니다..')");
				script.println("history.back()");
				script.println("</script>");	
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(bbs.getBbsID(), bbs.getBbsTitle(),bbs.getBbsContent() , userID);
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정되었습니다.')");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");					
				}else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정 중 에러가 발생했습니다.')");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");						
				}
			}
		}
	%>
</body>
</html>