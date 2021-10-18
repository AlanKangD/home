<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>내가 만든 홈페이지</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function openMember() {
			window.open("<%=request.getContextPath() %>/member/memberSsn.jsp", "member", "width=650, height=400")
		}
	</script>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="600">  
			<tr height="10%">
				<td colspan="2" align="center">
					<a href="<%=request.getContextPath() %>/index.jsp">  main  </a> |
					<a href="<%=request.getContextPath() %>logon.jsp">로그인 </a> |
					<a href="javascript:openMember()">회원가입</a> |
					<a href="<%=request.getContextPath() %>/member/memberAll.jsp">회원보기</a>	 |
					<a href="<%=request.getContextPath() %>/member/memberAll.jsp?cmd=Find">회원찾기</a> | <!-- memberAll에서 파라미터 값으로 같은페이지를 공유할 수 있게 만들어준 기능인데 ?cmd=파라미터값  이런 형식으로 넣어주게 되면 같은페이지 이지만 다른 결과출력값을 낼 수 있습니다. -->
					  게시판 |
					<a href="<%=request.getContextPath() %>company.jsp">회사소개 </a>
				</td>
			</tr>
				
			<tr>
				<td width="20%">
					서브메뉴
				</td>
				<td>