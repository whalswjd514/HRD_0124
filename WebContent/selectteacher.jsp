<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		String sql="select count(*) from teach0124";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1);		
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("총 강사 수 조회 실패");
		e.printStackTrace();
	}
%>
<h1>교과목 목록</h1>
<p id="p1">총 <%=no %>명의 강사가 있습니다.</p>
<hr>
<table border=1 id="tab2">
	<tr>
		<th>강사코드</th>
		<th>강사명</th>
		<th>전공</th>
		<th>세부전공</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	try{
		String sql="select * from teach0124";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String idx=rs.getString(1);
			String name=rs.getString(2);
			String major=rs.getString(3);
			String field=rs.getString(4);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=idx %></td>
		<td><%=name %></td>
		<td><%=major %></td>
		<td><%=field %></td>
		<td><a href="updateteacher.jsp?idx=<%=idx %>">수정</a> / 
			<a href="deleteteacher.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
	<div class="btn_group" align=center>
		<button onclick="location.href='insertteacher.jsp'">작성</button>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>