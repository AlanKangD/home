<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check() {
		if(f.id.value=="") {
			alert("아이디를 입력하세요!!");
			f.id.focus(); //이렇게 사용하면 alert경고창이 뜨고나서 마우스 커서가 id입력창으로 깜박거리게 해줍니다. 
			return;  
		}
		if(f.password.value=="") {
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return;
		}
		document.f.submit();
	}
</script>
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
%>


<body onload="f.name.focus()">
		<form name="f" method="POST" action="member_input.jsp">
			<table width="600" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">회원가입</td>
 				</tr>
				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="name" class="box" value="<%=name%>" disabled>
						<input type="hidden" name="name" value="<%=name %>">
						<!-- 위의 input에서 checkMemeber에서 받아온 이름을 수정하지 못하게 막아주는 역할을 disabled로 막아주고
								여기서 hidden으로 값을 다시 넘겨주는 역할을 할 수 있습니다.  -->
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="id" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="password" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">주민번호</td>
					<td class="m3">
						<input type="text" name="ssn1" class="box" value="<%=ssn1%>" readOnly> -
				<input type="password" name="ssn2" class="box" value="<%=ssn2%>" readOnly>
				<!-- name에서와 같이 쓸수 없게 만들어 줄 수 있는 것은 readOnly를 맨 뒤에 적어준다면 이것을 수정하지 못하게 막을 수 있고 
						전송 역시 가능할 수 있게 만들어 주는 것입니다.  -->
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">이메일</td>
					<td class="m3">
						<input type="text" name="email" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">연락처</td>
					<td class="m3">
						<input type="text" name="hp1" class="box" size="3" maxlength="3"> -
						<input type="text" name="hp2" class="box" size="4" maxlength="4"> -
						<input type="text" name="hp3" class="box" size="4" maxlength="4">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[전송]</a>
						<a href="#">[취소]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>
 </html>