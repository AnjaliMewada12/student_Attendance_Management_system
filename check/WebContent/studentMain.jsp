<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url('back.png')">
<form method="post" action="studentAttendance.jsp">
<%
if(request.getParameter("logout")!=null){
	response.sendRedirect("firstpage.jsp");
}
else if(request.getParameter("attendance")!=null){
	%>
<div style="justify-content:center;align-items:center;display:flex;">
 <input type="text" placeholder="subject name.." name="sub"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;">
 <input type="submit" value="go" name="go"/>
 <span style="color:red;">${error}</span>
</div>
	<%
}
	%>
	</form>
</body>
</html>