<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("강사명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.major.value==""){
			alert("전공이 입력되지 않았습니다.");
			document.form.major.focus();
		}else if(document.form.field.value==""){
			alert("세부전공이 입력되지 않았습니다.");
			document.form.field.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select idx2_seq.nextval from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1)+1;
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("시퀀스 조회 실패");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="insertteacher_Process.jsp">
<h1>강사 추가</h1>
<table border=1 id="tab3">
	<tr>
		<th>강사 ID</th>
		<td><input type="text" name="idx" value="<%=no %>">자동증가(Sequence 발생)</td>
	</tr>
	<tr>
		<th>강 사 명</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>전 공</th>
		<td><input type="text" name="major"></td>
	</tr>
	<tr>
		<th>세부 전공</th>
		<td><input type="text" name="field"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="목록" onclick="location.href='selectteacher.jsp'" id="btn3">
			<input type="button" value="등록" onclick="check()" id="btn3"> 
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>