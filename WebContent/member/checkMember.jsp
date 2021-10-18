<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "mbdao" class="home.member.MemberDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String name =  request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	if(name==null || name.trim().equals("") ||
			ssn1 ==null || ssn1.trim().equals("") ||
			ssn2 ==null || ssn2.trim().equals("")) {
		response.sendRedirect("memeberSsn.jsp");
		return;
	}
	
	boolean isMember = mbdao.checkMember(name, ssn1, ssn2);
	
	if(isMember) { //참이라면 회원이다 라는것이다 %>
		<script type="text/javascript">
			alert("저희 회원이십니다. 로그인을 해주세요!!");
			self.close(); //현재 열려 있는 윈도우를 닫아줍니다. 
		</script>
	
		
<%	} else { %>
	<form name="member" action="member.jsp" method="post">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="ssn1" value="<%=ssn1 %>">
		<input type="hidden" name="ssn2" value="<%=ssn2 %>">
	</form>
	<script type="text/javascript">
		alert("회원가입페이지로 이동합니다.");
		document.member.submit(); //상단에 name의 member의 정보를 넘겨줘라 라는 의미
	</script>
	
<%  } %>