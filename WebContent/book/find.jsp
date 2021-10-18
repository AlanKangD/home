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
	<h2>도서찾기페이지</h2>
	<hr color="green" width="300">
	<form action="find_ok.jsp" name="find" method="post">
		<table border="1">
			<tr>
				<td>
					<select name="search">
						<option value="name">도서명
						<option value="publisher">출판사
						<option value="writer">지은이
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>