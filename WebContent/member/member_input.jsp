<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />

<%

	if(mbdto.getName()==null || mbdto.getName().trim().equals("")) {
		response.sendRedirect("memberSsn.jsp");
		return;
		
	} 
	int res = mbdao.insertMember(mbdto);
	if(res > 0) { %>
		<script type="text/javascript">
			alert("회원가입 성공하셨습니다.")
			self.close()
		</script>
		
		
	<% }else {%>
		<script type="text/javascript">
			alert("회원가입실패!! 회원가입페잊로 이동합니다." )
			location.href="memberSsn.jsp"
		</script>
<%} %>
