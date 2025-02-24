<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>

</head>


<body>

<c:if test="${not empty errorMsg}">
    <script>
        alert("${errorMsg}");
    </script>
</c:if>

<form name="frm" method="post" action="post2.do">
<table>
	<tr>
		<th>동 입력</th>
		<td><input type="text" name="dong"></td>
		<td><button type="submit">검색</button></td>
	</tr>
</table>
</form>
</body>
</html>