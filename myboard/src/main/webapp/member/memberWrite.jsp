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
<title>회원가입</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="/myboard/script/jquery-1.12.4.js"></script>
<script src="/myboard/script/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">

<script>
$( function() {
	$( "#birthday" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "1950:2050",
		dateFormat: "yy/mm/dd"
	});
	
	$("#btn_zipcode").click(function(){
		var w = 500;
		var h = 100;
		var url="post1.do"
		window.open(url,'zipcode','width='+w+',height='+h);
	});
	
	$("#btn_idCheck").click(function(){
		var userid=$.trim($("#userid").val());
		
		if(userid == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		
		$.ajax({
			type:"post",
			data:"userid="+userid,
			url:"idCheck.do",
			dataType:"text",	//리턴 타입
			
			success:function(result) {
				if(result == "0") {	//controller -> "0"
					alert("사용 가능한 아이디입니다.");
				} else {
					alert("이미 사용중인 아이디입니다.");
				}
			},
			error:function() {	//시스템적인 장애 발생
				alert("오류 발생");
			}
		});
	});
	
	$("#btn_submit").click(function(){
		var userid=$.trim($("#userid").val());
		var pass=$.trim($("#pass").val());
		var passCheck=$.trim($("#passCheck").val());
		var name=$.trim($("#name").val());
		
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
		$("#userid").val(userid);
		$("#pass").val(pass);
		$("#name").val(name);
		
		var formData = $("#frm").serialize();
		
		$.ajax({	//비동기방식 전송
			type:"post",
			data:formData,
			url:"memberWriteSave.do",
			dataType:"text",	//리턴 타입
			
			success:function(result) {
				if(result == "ok") {	//controller -> "1"
					alert("저장완료");
					location="loginWrite.do";
				} else {
					alert("저장실패");
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
<form name="frm" id="frm">
<div class="div1">회원가입</div>
<table>
	<tr>
		<th><label for="userid">ID</label></th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="ID는 필수값입니다">
			<button type="button" id="btn_idCheck">중복 확인</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">비밀번호</label></th>
		<td><input type="password" name="pass" id="pass" placeholder="비밀번호는 필수값입니다"></td>
	</tr>
	<tr>
		<th><label for="passCheck">비밀번호 확인</label></th>
		<td><input type="password" name="passCheck" id="passCheck" placeholder="비밀번호 확인은 필수값입니다"></td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td><input type="text" name="name" id="name" placeholder="이름은 필수값입니다"></td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
			<input style="width:15px" type="radio" name="gender" id="gender_m" value="M">남
			<input style="width:15px" type="radio" name="gender" id="gender_f" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birthday">생년월일</label></th>
		<td><input type="text" name="birthday" id="birthday" readonly></td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" name="phone" id="phone"> (예: 010-1234-5678)</td>
	</tr>
	<tr>
		<th><label for="zipcode">우편번호</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode" readonly>
			<button type="button" id="btn_zipcode">우편번호 찾기</button>
			<br>
			<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>