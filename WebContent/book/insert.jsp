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
	<h2>도서등록페이지</h2>
	<hr color="green" width="300">
	<form name="insert" method="post" action="insert_ok.jsp">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name"><br>
					출판사 : <input type="text" name="publisher"><br>
					지은이 : <input type="text" name="writer"><br>
					판매가 : <input type="text" name="price"><br>
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>