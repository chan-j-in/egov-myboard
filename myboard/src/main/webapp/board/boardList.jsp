<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>

<script src="/myboard/script/jquery-1.12.4.js"></script>
<script src="/myboard/script/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">

</head>
<body>

<%@ include file="../include/topMenu.jsp" %>

<div class="div1">게시글 목록</div>
<div style="width:600px;margin-top:5px;margin-bottom:5px;text-align:right;">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
</div>
<div class="div2">검색된 게시글 수 : ${total}</div>
<table>

	<tr>
		<th width="15%">번호</th>
		<th width="40%">제목</th>
		<th width="15%">작성자</th>
		<th width="20%">등록일</th>
		<th width="10%">조회수</th>
	</tr>

	<c:forEach var="result" items="${resultList}">
		<tr align="center">
			<td><c:out value="${result.unq}"/></td>
			<td align="left">
				<a href="boardDetail.do?unq=${result.unq}"><c:out value="${result.title}"/></a>
			</td>
			<td><c:out value="${result.name}"/></td>
			<td><c:out value="${result.rdate}"/></td>
			<td><c:out value="${result.hits}"/></td>
		</tr>
	</c:forEach>
</table>

<div class="page">

	<c:forEach var="i" begin="1" end="${totalPage}">
		<a href="boardList.do?page=${i}">${i}</a>
	</c:forEach>
	
</div>

<div class="div2" style="text-align:center;">
<form name="searchFrm" method="post" action="boardList.do">
	<select name="searchType" id="searchType">
		<option value="title">제목</option>
		<option value="name">작성자</option>
		<option value="content">내용</option>
	</select>
	<input type="text" name="searchText" id="searchText">
	<button type="submit">검색</button>
</form>
</div>

</body>
</html>