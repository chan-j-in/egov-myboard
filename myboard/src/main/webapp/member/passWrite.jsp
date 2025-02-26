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
	
	$("#btn_modify").click(function() {
		var pass = $.trim($("#pass").val());
		if(pass == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		var sendData = "pass="+pass;
		
		$.ajax({	//비동기방식 전송
			type:"post",
			data:sendData,
			url:"memberPassCheck2.do",
			dataType:"text",	//리턴 타입
			
			success:function(data) {
				if(data == "1") {	//controller -> "1"
					location="memberModify.do";
				} else {
					alert("비밀번호가 일치하지 않습니다.")
				}
			},
			error:function() {	//시스템적인 장애 발생
				alert("오류 발생");
			}
		});
	});
	$(document).keypress(function(e) {
        if (e.which == 13) { // Enter 키 코드
            e.preventDefault(); // 기본 동작 방지
            $("#btn_modify").click(); // 로그인 버튼 클릭
        }
    });
});
</script>

<body>
<div>
    <label for="pass">비밀번호</label>
    <input type="password" id="pass">
    <button type="submit" id="btn_modify">입력</button>
    <button type="reset" onclick="location='boardList.do'">취소</button>
</div>
</body>
</html>