<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content,newline,'<br>')}"/>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>게시글 상세</title>

<script src="/myboard/script/jquery-1.12.4.js"></script>
<script src="/myboard/script/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
</head>

<body>

<form id="frm">
<table>
	<caption>게시글 상세</caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%">${boardVO.title}</td>
	</tr>
	<tr>
		<th><label for="name">작성자</th>
		<td>${boardVO.name}</td>
	</tr>
	<tr>
		<th><label for="content">내용</th>
		<td height="50">${content}</td>
	</tr>
	<tr>
		<th><label for="rdate">등록일</th>
		
		<td>${boardVO.rdate}</td>
	</tr>
	<tr>
		<th><label for="hits">조회수</th>
		<td>${boardVO.hits}</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="button" onclick="location='boardList.do'">목록</button>
			<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
			<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq}'">삭제</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>