<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="DBconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;

String sql="insert into lecturer0224 values(?,?,?,?)";
try{
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("major"));
	pstmt.setString(4, request.getParameter("field"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("저장 성공");
	location.href="selStudent.jsp";
	</script>
<%
}catch(Exception e){
	System.out.println("강사 저장 실패");
    e.printStackTrace();
}
%>
</body>
</html>