<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String name=request.getParameter("name");
String dept=request.getParameter("dept");
String position=request.getParameter("position");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String val[]=request.getParameterValues("hobby");
String hobby="";
if(val !=null){
	for(int i=0;i<val.length;i++){
		if(i==(val.length-1)){
			hobby += val[i]; //+=는 hobby=hobby+val[i]
		}else{
			hobby += val[i]+",";
					
		}
	}
}

System.out.println("hobby"+hobby);
PreparedStatement pstmt=null;
String sql="update stud0224 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
try{
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, dept);
	pstmt.setString(3, position);
	pstmt.setString(4,address);
	pstmt.setString(5, phone);
	pstmt.setString(6, hobby);
	pstmt.setString(7, id);
	pstmt.executeUpdate();
	%>
	<script>
	alert("학사정보 수정 성공");
	location.href="selStudent.jsp";
	</script>
	<%
}catch(Exception e){
	System.out.println("학사정보 수정 실패");
	e.printStackTrace();
}
%>
</body>
</html>