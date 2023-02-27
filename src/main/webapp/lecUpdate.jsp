<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.id.value==""){
		alert("강사id를 입력하세요");
		document.form.id.focus();
		return false;
	}
	if(document.form.name.value==""){
		alert("강사이름을 입력하세요");
		document.form.name.focus();
		return false;
	}
	if(document.form.major.value==""){
		alert("전공을 입력하세요");
		document.form.majoe.focus();
		return false;
	}
	if(document.form.field.value==""){
		alert("세부 전공을 입력하세요");
		docuent.form.field.focus();
		return false;
	}
	document.form.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 id="inSh2">강사 추가</h2>
<form name="form" method="post" action="lecUpdatePro.jsp">
<table border=1 id="tab3">
<tr>
<th>강사 ID</th>
<%@include file="DBconn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
String id=request.getParameter("id");

String sql="select * from lecturer0224 where idx=?";
try{
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String major=rs.getString("major");
		String field=rs.getString("field");
	
%>
<td><input id="inStd1" type="text" name="id" value="<%=id %>"></td>
</tr>
<tr>
<th>강 사 명</th>
<td><input id="inStd1" type="text" name="name" value="<%=name%>"></td>
</tr>
<tr>
<th>전 공</th>
<td><input id="inStd1" type="text" name="major" value="<%=major%>"></td>
</tr>
<tr>
<th>세부 전공</th>
<td><input id="inStd1" type="text" name="field" value="<%=field%>"></td>
</tr>
<tr>
<td colspan=2 align=center>
<input type="button" id="btn1" value="저장" onclick="check()">
<input type="reset" id="btn1" value="취소">

</td>
</tr>
<%
	}
	}catch(Exception e){
		System.out.println("강사 테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>


</form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>