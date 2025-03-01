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

<script>
$(function(){
	
	$("#commentBtn").click(function(event) {
		
		event.preventDefault();
		
		var comment_content = $.trim($("#comment_content").val());
	    if(comment_content == "") {
			alert("내용을 입력해주세요");
			$("#comment_content").focus();
			return false;
		}
		$("#comment_content").val($.trim($("#comment_content").val()));
		
		var sendData = "boardUnq=${boardVO.unq}&content="+comment_content;
		
	    // Ajax 요청으로 댓글 추가
	    $.ajax({
	    	type:"post",
			data:sendData,
			url:"commentWriteSave.do",
			dataType:"text",	//리턴 타입

	        success: function(data) {
	        	if(data == "ok") {	//controller -> "ok"
	        		alert("댓글이 등록되었습니다.");
		            location.reload();
				} else {
					alert("댓글 등록에 실패했습니다.");
				}
	        },
	        error: function(data) {
	            alert("오류 발생");
	        }
	    });
	});
});
</script>

<body>

<%@ include file="../include/topMenu.jsp" %>

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

<div style="margin-bottom: 60px;"></div>

<!-- 댓글 입력 폼 -->
<div>
    <h3>댓글</h3>
    
    <table style="width: 600px; margin-top: 20px;">
	    <thead>
	        <tr>
	            <th style="width: 15%;">작성자</th>
	            <th style="width: 70%;">내용</th>
	            <th style="width: 15%;">등록일시</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:if test="${empty comments}">
	            <tr>
	                <td colspan="3" style="text-align: center; color: #888;">댓글이 없습니다.</td>
	            </tr>
	        </c:if>
	        <c:forEach var="comment" items="${comments}">
	            <tr>
	                <td style="width: 15%; text-align: center;">${comment.name}</td>
	                <td style="width: 70%;">${comment.content}</td>
	                <td style="width: 15%; text-align: center;">${comment.rdate}</td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
	<br>
	
	<textarea id="comment_content" name="comment_content" class="textarea" placeholder="댓글을 입력하세요" style="height: 40px;"></textarea>
	<button type="submit" id="commentBtn">등록</button>

</div>

</body>
</html>