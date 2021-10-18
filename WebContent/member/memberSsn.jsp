<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버체크</title>
	<link rel="stylesheet" type="text/css" href="../style.css">

</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>회원 가입 유무</h2>
		<hr color="green" width="300">
		<form action="checkMember.jsp" name="f" method="post">
			<table width="500" class="outline">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" class="box" maxlength="6"> -
						<input type="password" name="ssn2" class="box" maxlength="7">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="조회">
						<input type="reset" value="취소">
						
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>