<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도서목록보기</h2>
	<a href="index.jsp">메인페이지</a>
	<hr color="green" width="300">
	<table border="1" width="600">
		<tr bgcolor="yellow">
			<th>책이름</th>
			<th>지은이</th>
			<th>출판사</th>
			<th>판매가</th>
			<th>입고일</th>
		</tr>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "spring";
	String pw = "spring";
	String sql = "select * from book";
	Connection con = DriverManager.getConnection(url, id, pw);
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()) { %>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("writer") %></td>
		<td><%=rs.getString("publisher") %></td>
		<td><%=rs.getInt("price") %></td>
		<td><%=rs.getString("joindate") %></td>
	</tr>
	
	
		
<%}%>
</table>
</div>
</body>
</html>














