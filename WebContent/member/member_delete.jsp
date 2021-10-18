<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<%
	String no = request.getParameter("no");
	if(no == null || no.trim().equals("")) {
		response.sendRedirect("memberAll.jsp");
		return;
	}
	
	int res = mbdao.deleteMember(Integer.parseInt(no));
	String msg = null;
	
	if(res > 0) {
		msg = "회원님을 삭제 하셨습니다.!";
	} else {
		msg = "회원삭제 실패!!";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=request.getContextPath()%>/member/memberAll.jsp"
</script>
