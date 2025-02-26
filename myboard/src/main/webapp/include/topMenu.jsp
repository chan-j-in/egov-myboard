<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.a1 {
	color: black;
	text-decoration: none;
}

.a1:visited {
	color: black;
}

.a1:hover {
	color: blue;
}

.a1:active {
	color: darkblue;
}
</style>
</head>
<body>

<%
String USERID = (String) session.getAttribute("SessionUserId");
%>
<table>
	<tr>
		<th width="25%"><a href="/myboard/boardList.do" class="a1">홈</th>
		<th width="25%"><a href="/myboard/boardList.do" class="a1">게시판</a></th>
		
	<% 
	if(USERID == null) {
	%>	
		<th width="25%"><a href="/myboard/memberWrite.do" class="a1">회원가입</a></th>
		<th width="25%"><a href="/myboard/loginWrite.do" class="a1">로그인</a></th>
	<%
	} else {
	%>
		<th width="25%"><a href="/myboard/memberPassCheck.do" class="a1">회원정보 수정</a></th>
		<th width="25%"><a href="/myboard/logout.do" class="a1">로그아웃</a></th>
	<%
	}
	%>
		
	</tr>
</table>
<br>
</body>
</html>