<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*" %>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url('back.png');">
<form method="post" action="showAttendance.jsp">
<% if(request.getParameter("show")!=null){
	Class.forName("com.mysql.jdbc.Driver");
	String sem=request.getParameter("semester");
	String bran=request.getParameter("branch");
	session.setAttribute("b",bran);
	session.setAttribute("s",sem);
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
	Statement stmt = con.createStatement();
	String checkSql="select rollNo,firstName,lastName,email,semester,branch from student where branch="+"'"+bran+"'"+" and semester="+"'"+sem+"'" ;
	ResultSet rs = stmt.executeQuery(checkSql);%>
<input type="submit" value="attendance" name="attendance" style="font-size:15px"/>
<table border="2" width="100%" style="margin-top:20px;background:white;">
<tr><th>Roll no.</th><th>First Name</th><th>Last Name</th><th>E-mail</th><th>Semester</th><th>Branch</th></tr>
<%while(rs.next()){ %>
<tr>
<td style="text-align:center;"><%=rs.getString("rollNo")%></td>
<td style="text-align:center;"><%=rs.getString("firstName")%></td>
<td style="text-align:center;"><%=rs.getString("lastName")%></td>
<td style="text-align:center;"><%=rs.getString("email")%></td>
<td style="text-align:center;"><%=rs.getString("semester")%></td>
<td style="text-align:center;"><%=rs.getString("branch")%></td>
</tr>
</table>
<%}  
}%>
</form>
</body>
</html>