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
<body style="background:url('back.png')">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
Statement stmt = con.createStatement();
String sq="select id,firstName,lastName,email from faculty";
ResultSet rs = stmt.executeQuery(sq);
%>
<table border="2" width="100%" style="margin-top:20px;background:white;">
<tr><th>id</th><th>First Name</th><th>Last Name</th><th>E-mail</th></tr>
<%
while(rs.next()){
	%>
	<tr>
	<td style="text-align:center"><%=rs.getString("id") %></td>
	<td style="text-align:center"><%=rs.getString("firstName") %></td>
	<td style="text-align:center"><%=rs.getString("lastName") %></td>
	<td style="text-align:center"><%=rs.getString("email") %></td>
	</tr>
<%
}
%>
</table>
</body>
</html>