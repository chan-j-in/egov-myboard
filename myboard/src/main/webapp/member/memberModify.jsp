<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="/myboard/script/jquery-1.12.4.js"></script>
<script src="/myboard/script/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">

<script>
$( function() {
	$( "#birthday" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "1950:2030",
		dateFormat: "yy-mm-dd"
	});
	
	$("#btn_zipcode").click(function(){
		var w = 400;
		var h = 150;
		var url="post1.do"
		window.open(url,'zipcode','width='+w+',height='+h);
	});
	
	$("#btn_update").click(function(){
		var pass=$.trim($("#pass").val());
		var passCheck=$.trim($("#passCheck").val());
		var name=$.trim($("#name").val());
		
		if(pass == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if(passCheck == "") {
			alert("비밀번호 확인을 입력해주세요.");
			$("#passCheck").focus();
			return false;
		}
		if(name == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if(pass!=passCheck) {
			alert("두 비밀번호가 일치하지 않습니다.")
			$("#passCheck").focus();
			return false;
		}
		
		var formData = $("#frm").serialize();
		
		$.ajax({	//비동기방식 전송
			type:"post",
			data:formData,
			url:"memberModifySave.do",
			dataType:"text",	//리턴 타입
			
			success:function(result) {
				if(result == "ok") {	//controller -> "1"
					alert("수정완료");
					location="boardList.do";
				} else {
					alert("수정실패");
				}
			},
			error:function() {	//시스템적인 장애 발생
				alert("오류 발생");
			}
		}); 
	});
} );
</script>

</head>
<body>

<%@ include file="../include/topMenu.jsp" %>

<form name="frm" id="frm">
<div class="div1">회원정보 수정</div>
<table>
	<tr>
		<th><label for="userid">ID</label></th>
		<td><input type="text" name="userid" id="userid" value="${member.userid}" readonly></td>
	</tr>
	<tr>
		<th><label for="pass">새 비밀번호</label></th>
		<td><input type="password" name="pass" id="pass" placeholder="새 비밀번호 입력"></td>
	</tr>
	<tr>
		<th><label for="passCheck">새 비밀번호 확인</label></th>
		<td><input type="password" name="passCheck" id="passCheck" placeholder="새 비밀번호 확인"></td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td><input type="text" name="name" id="name" value="${member.name}"></td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
			<input style="width:15px" type="radio" name="gender" value="M" ${member.gender == 'M' ? 'checked' : ''}>남
			<input style="width:15px" type="radio" name="gender" value="F" ${member.gender == 'F' ? 'checked' : ''}>여
		</td>
	</tr>
	<tr>
		<th><label for="birthday">생년월일</label></th>
		<td><input type="text" name="birthday" id="birthday" value="${member.birthday}" readonly></td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" name="phone" id="phone" value="${member.phone}"> (예: 010-1234-5678)</td>
	</tr>
	<tr>
		<th><label for="zipcode">우편번호</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode" value="${member.zipcode}" readonly>
			<button type="button" id="btn_zipcode">우편번호 찾기</button>
			<br>
			<input type="text" name="address" id="address" value="${member.address}">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_update">수정</button>
	<button type="reset" onclick="location='boardList.do'">취소</button>
</div>
</form>

</body>
</html>