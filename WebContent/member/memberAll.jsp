<%@page import="home.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" type="text/css" href="../style.css">

</head>
<body>
<%@ include file="../top.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	String cmd = request.getParameter("cmd"); 
		if(cmd == null || cmd.trim().equals("")) {
			cmd = "All";
	}
%>  <!-- 이렇게 cmd라는 파라미터를 걸어준다면 여기서 조건문으로도 걸수 있습니다. -->
	<div align="center">
		<hr color="green" width="300">
<% if(cmd.equals("Find")) { %>
		<h2>회 원 찾 기</h2>
		<form name="f" method="post"> <!-- action태그가 없으면 자신의 페이지에서 보여줍니다. -->
			<select name="search">
				<option value="id"> 아이디
				<option value="name"> 이름
			</select>
				<input type="text" name="searchString">
				<input type="submit" value="찾기">
			
		</form>
		<jsp:setProperty property="*" name="mbdao"/>
<%}else { %>
		<h2>회 원 목 록 보 기</h2>
		
<%} %>
		<hr color="green" width="300">
		<table width="99%" class="outline">
			<tr bgcolor="yellow">
				<th class="m3">이름</th>
				<th class="m3">아이디</th>
				<th class="m3">이메일</th>
				<th class="m3">전화번호</th>
				<th class="m3">가입일</th>
				<th class="m3">수정 | 삭제</th>
			
			</tr>
<%  ArrayList<MemberDTO> memberList = null; 
	if(cmd.equals("Find")) {
		memberList = mbdao.findMember();
	}else{
		memberList = mbdao.listMember(); 
	}
	if(memberList == null || memberList.size() == 0) { %>
		<tr>
			<td colspan="6">등록된 회원이 없습니다.</td>
		</tr>
	<% }else {
		for(MemberDTO dto : memberList) {
	%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=dto.getAllHp() %></td>
			<td><%=dto.getJoindate() %></td>
			<td>
			수정 |
			<a href="member_delete.jsp?no=<%=dto.getNo()%>"> 삭제</a></td>
			<!-- 상단에 파라미터에 pk인 no의 값을 넘겨주고 처리해주면 삭제하고 싶은 해당 아이디를 간단하게 삭제 시킬 수 있습니다. -->
		</tr>
	<%
		}
		} %>
		</table>
	</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>