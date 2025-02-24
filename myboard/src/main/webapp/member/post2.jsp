<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>

<script src="/myboard/script/jquery-1.12.4.js"></script>

</head>

<script>
$(function(){
	$("#btn_send").click(function(){
		var addr = $("#address").val();	//[123456] 서울특별시 강남구 역삼동 ~
		var addr_array = addr.split(" ");
		var zipcode = addr_array[0].substring(1,addr_array[0].length-1);
		var address = $.trim(addr.replace(addr_array[0],""));

		opener.document.frm.zipcode.value = "["+zipcode+"] "+address;
		
		self.close();
	});	
});
</script>

<body>

<div style="width=100%; text-align:left;">
<select name="address" id="address">

	<c:forEach var="result" items="${resultList}">	
		<option value="${result.addr}">${result.addr}</option>
	</c:forEach>
	
</select>

<br><br>
<button type="button" id="btn_send">선택</button>
</div>

</body>
</html>