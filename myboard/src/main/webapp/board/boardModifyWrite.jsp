<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<script src="/myboard/script/jquery-1.12.4.js"></script>
<script src="/myboard/script/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
</head>

<script>
	
function fn_submit() {

	if( $.trim($("#title").val()) == "") {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	$("#title").val($.trim($("#title").val()));
	
	if( $.trim($("#pass").val()) == "") {
		alert("비밀번호를 입력해주세요");
		$("#pass").focus();
		return false;
	}
	$("#pass").val($.trim($("#pass").val()));
	
	var formData = $("#frm").serialize();
	
	$.ajax({	//비동기방식 전송
		type:"post",
		data:formData,
		url:"boardModifySave.do",
		dataType:"text",	//리턴 타입
		success:function(data) {
			if(data == "1") {	//controller -> "1"
				alert("저장완료");
				location="boardList.do";
			} else if(data == "-1"){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pass").focus();
			} else {
				alert("저장실패");
			}
		},
		error:function() {	//시스템적인 장애 발생
			alert("오류 발생");
		}
	});
}

</script>

<body>

<%@ include file="../include/topMenu.jsp" %>

<form id="frm">

<input type="hidden" name="unq" value="${boardVO.unq}">

<table>
	<caption>게시글 수정</caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1" value="${boardVO.title}"></td>
	</tr>
	<tr>
		<th><label for="pass">암호</th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th><label for="name">작성자</th>
		<td><input type="text" name="name" id="name" value="${boardVO.name}"></td>
	</tr>
	<tr>
		<th><label for="content">내용</th>
		<td><textarea type="text" name="content" id="content" class="textarea">${boardVO.content}</textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit" onclick="fn_submit();return false;">저장</button>
		<button type="reset" onclick="location='boardList.do'">취소</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>