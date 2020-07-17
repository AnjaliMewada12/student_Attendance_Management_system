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
try{
	 Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
		Statement stmt = con.createStatement();
		String id=request.getParameter("id");
		String sq="select * from classes where id='"+id+"'";
		ResultSet rs = stmt.executeQuery(sq);
		%>
		<table border="2" width="100%" style="margin-top:20px;background:white;">
<tr><th>From</th><th>To</th><th>branch</th><th>semester</th><th>subject</th></tr>
		<%
		while(rs.next()){
			%>
			<tr>
			<td style="text-align:center"><%=rs.getString("fro") %></td>
			<td style="text-align:center"><%=rs.getString("t") %></td>
			<td style="text-align:center"><%=rs.getString("branch") %></td>
			<td style="text-align:center"><%=rs.getString("semester") %></td>
			<td style="text-align:center"><%=rs.getString("sub") %></td>
			</tr>
			<%
		}
		%>
		</table>
		<%
}
catch(Exception e){System.out.println(e);}
%>
</body>
</html>