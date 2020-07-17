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
    String first="";
    String last="";
    String semester="";
    String branch="";
    String roll=(String)session.getAttribute("name");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
	Statement stmt = con.createStatement();
	String sq="select firstName,lastName,semester,branch from student where rollNo='"+roll+"'";
	ResultSet rs = stmt.executeQuery(sq);
	while(rs.next()){
		first=rs.getString("firstName");
		last=rs.getString("lastName");
		semester=rs.getString("semester");
		branch=rs.getString("branch");
	}
	String s="select sub from subject";
	ResultSet ra=stmt.executeQuery(s);
	int f=0;
	System.out.println(f);
	while(ra.next()){
		f=1;
	}
	if(f==0){
		%>
		<h1 style="text-align:center;color:red">subject not found</h1>
		<%
	}
	else{
	String chsq="select sub from subject where id='"+request.getParameter("sub")+semester+branch+"'";
	ResultSet r = stmt.executeQuery(chsq);
	int flag=0;
	while(r.next()){
		if(request.getParameter("sub").equals(r.getString("sub"))){
		    flag=1;		
		    break;
		}
	}
	if(flag==1){
	    String n="select dmy,"+first+roll+last+" from "+request.getParameter("sub")+semester+branch;  
	    ResultSet rt = stmt.executeQuery(n);
	    %>
	    <table border="2" width="100%" style="margin-top:20px;background:white;">
       <tr><th>Date</th><th>Attendance</th></tr>
	    <%
	    while(rt.next()){
	    	%>
	    	<tr>
	    	<td style="text-align:center"><%=rt.getString("dmy") %></td>
	    	<td style="text-align:center"><%=rt.getString(first+roll+last) %></td>
	    	</tr>
	    	<%
	    }
	    %>
	    </table>
	  <%
	}
	else{
		%>
		<h1 style="text-align:center;color:red">subject not found</h1>
		<%
	}
	}
%>
</body>
</html>