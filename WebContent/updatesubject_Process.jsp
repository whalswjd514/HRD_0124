<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String subject_name=request.getParameter("subject_name");
	String credit=request.getParameter("credit");
	String lecturer=request.getParameter("lecturer");
	String week=request.getParameter("week");
	String start_hour=request.getParameter("start_hour");
	String end_hour=request.getParameter("end_hour");

	try{
		String sql="update sub0124 set subject_name=?,credit=?,lecturer=?,week=?,start_hour=?,end_hour=? where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(7, id);
		pstmt.setString(1, subject_name);
		pstmt.setString(2, credit);
		pstmt.setString(3, lecturer);
		pstmt.setString(4, week);
		pstmt.setString(5, start_hour);
		pstmt.setString(6, end_hour);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		%>
			<script>
				alert("데이터 수정을 성공하였습니다!");
				location.href="selectsubject.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
		e.printStackTrace();
	}
%>
			<script>
				alert("데이터 등록을 실패하였습니다!");
				history.back(-1);
			</script>
</body>
</html>