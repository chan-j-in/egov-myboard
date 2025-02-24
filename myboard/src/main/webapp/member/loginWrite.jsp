<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="/myboard/script/jquery-1.12.4.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">

<script>
$(function(){
	$("#btn_login").click(function() {
		var userid=$.trim($("#userid").val());
		var pass=$.trim($("#pass").val());
		
		if(userid == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		
		if(pass == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			type:"post",
			data:"userid="+userid+"&pass="+pass,
			url:"loginWriteSub.do",
			dataType:"text",	//리턴 타입
			
			success:function(result) {
				if(result == "ok") {	//controller -> "1"
					alert(userid+"님 로그인 되었습니다.");
					location="boardList.do"
				} else if(result == "-1") {
					alert("존재하지 않는 아이디입니다.");
				} else {
					alert("아이디와 비밀번호를 확인해주세요.");
				}
			},
			error:function() {	//시스템적인 장애 발생
				alert("오류 발생");
			}
		});
	});
});
</script>

</head>
<body>

<%@ include file="../include/topMenu.jsp" %>

<form name="frm" id="frm">
<div class="div1">로그인</div>
<table>
	<tr>
		<th><label for="userid">ID</label></th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="ID를 입력해주세요">
		</td>
	</tr>
	<tr>
		<th><label for="pass">비밀번호</label></th>
		<td><input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요"></td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_login">로그인</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>