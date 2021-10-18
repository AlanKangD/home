<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	if(name == null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");
		return;
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "spring";
	String pw = "spring";
	String sql = "delete from book where name=?";
	Connection con = DriverManager.getConnection(url,id,pw);
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, name);
	int res = ps.executeUpdate();
	String msg = null;
	String href = null;
	if (res >0) {
		msg = "도서삭제성공!!도서보기페이지로 이동합니다.";
		href="list.jsp";
	} else {
		msg = "도서삭제실패!!도서삭제페이지로 이동합니다.";
		href="delete.jsp";
		
	}
	ps.close();
	con.close();
%>

<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>