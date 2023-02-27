<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
try{
String url="jdbc:oracle:thin:@//localhost:1521/xe";
String user="system";
String pwd= "1234";
String Dri="oracle.jdbc.OracleDriver";
Class.forName(Dri);

conn = DriverManager.getConnection(url,user,pwd);
System.out.println("연결 성공");
}catch(Exception e){
	System.out.println("연결 실패");
	e.printStackTrace();
}
%>
</body>
</html>