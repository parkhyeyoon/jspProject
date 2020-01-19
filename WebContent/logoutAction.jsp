<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
<title>jsp 게시판 웹 사이트</title>

<body>
	<%
		//세션의 기능을 중단시키고 무효화 시킴. 자바는 가비지컬렉터가 메모리를 관리 하기 떄문에 세션객체 자체를 소멸시키는 것이 아님. 무효화시킴.
		session.invalidate();
	%>
	<script type="text/javascript">
		location.href = 'main.jsp';
	</script>
</body>
</html>