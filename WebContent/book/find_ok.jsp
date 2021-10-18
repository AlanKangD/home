<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search = request.getParameter("search");
	String searchString = request.getParameter("searchString");
	if(search == null || search.trim().equals("") ||
			searchString==null || searchString.trim().equals("")){
		response.sendRedirect("find.jsp");
		return; //밑에 있는 코드가 실행 되지 않도록 막아주는 역할을 합니다
	}
		
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서찾기</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도서[<%=search %>]찾기</h2>
	<hr color="green" width="300">
	<table border="1" width="600">
		<tr bgcolor="yellow">
			<th>책이름</th>
			<th>출판사</th>
			<th>지은이</th>
			<th>입고일</th>
			<th>판매가</th>
		</tr>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "spring";
	String pw = "spring";
	String sql = "select * from book where"+search+" = ?";
	Connection con = DriverManager.getConnection(url,id,pw);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, searchString);
	ResultSet rs = ps.executeQuery();
	while(rs.next()) { %>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("writer") %></td>
		<td><%=rs.getString("publisher") %></td>
		<td><%=rs.getInt("price") %></td>
		<td><%=rs.getString("joindate") %></td>
	</tr>
	
	<%} %>
	</table> 
</div>


</body>
</html>