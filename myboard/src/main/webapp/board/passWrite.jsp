<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 입력</title>
<script src="/myboard/script/jquery-1.12.4.js"></script>
<script src="/myboard/script/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
</head>

<script>
$(function(){
	
	$("#delBtn").click(function() {
		var pass = $.trim($("#pass").val());
		if(pass == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		var sendData = "unq=${unq}&pass="+pass;
		
		$.ajax({	//비동기방식 전송
			type:"post",
			data:sendData,
			url:"boardDelete.do",
			dataType:"text",	//리턴 타입
			
			success:function(data) {
				if(data == "1") {	//controller -> "1"
					alert("삭제완료");
					location="boardList.do";
				} else if(data =="-1") {
					alert("비밀번호가 일치하지 않습니다.")
				} else {
					alert("삭제실패");
				}
			},
			error:function() {	//시스템적인 장애 발생
				alert("오류 발생");
			}
		});
	});
	
});
</script>

<body>

<table>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" id="pass"></td>
		<td><button type="submit" id="delBtn">삭제</button></td>
	</tr>
</table>

</body>
</html>