<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도서삭제페이지</h2>
	<hr color="green" width="300">
	<form  name = "delete" method="post" action="delete_ok.jsp">
	<table border="1" >
		<tr>
			<td>
				도서명 : <input type="text" name="name">
				<input type="submit" value="삭제">
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>