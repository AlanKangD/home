<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	1.넘어온 데이타를 받아오기
	2.넘어온 데이터의 유효성 검사
	3.DB와 연결하기
 -->
    
<% request.setCharacterEncoding("utf-8");  //post방식에서의 한글처리
	String name = request.getParameter("name");
	String publisher = request.getParameter("publisher");
	String writer = request.getParameter("writer");
	String price = request.getParameter("price"); // 파라미터러 넘어오는 데이터는 모드 String입니다.
	if(name == null || name.trim().equals("") || publisher == null ||
			publisher.trim().equals("") || writer==null || writer.trim().equals("")
			|| price ==null || price.trim().equals("")) { %>
	<script type="text/javascript">
		alert("도서등록내용이 부족합니다. 다시 확인하시고 입력해주세요");
		history.back();
	</script>	
<%	return;	 //return을 적어줘야 잘못된 데이터가 넘어가는 일이 안생깁니다.
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "spring";
	String pw = "spring";
	String sql = "insert into book values(?,?,?,?,sysdate)";
	// joindate 자리에 sysdate 함수를 실행시켜 현재 날짜가 입력되도록 합니다.
	
	Connection con = DriverManager.getConnection(url, id, pw);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, writer);
	ps.setString(3, publisher);
	ps.setInt(4, Integer.parseInt(price));
	int rs = ps.executeUpdate(); //rs값이 1이상이면 한개이상 insert성공, 0이면 insert 실패
	if(rs >0) { %>

	<script type="text/javascript">
	alert("도서등록성공!! 도서보기페이지로 이동합니다.");
	location.href="list.jsp";
	</script>
	<%} else { %>
	<script type="text/javascript">
	alert("도서등록실패!! 도서등록페이지로 이동합니다.");
	location.href="insert.jsp";
	</script>
	<%}
		ps.close();
		con.close();
	%>
	
	
	
	