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
<form method="post" action="take">
<div style="justify-content:center;align-items:center;display:flex;">
 <input type="text" placeholder="Date...." name="date"/>
 </div>
<%
    String subject=request.getParameter("subject");
    String branch=request.getParameter("branch");
    String semester=request.getParameter("semester");
    System.out.println(subject);
    session.setAttribute("branch",branch);
    session.setAttribute("semester",semester);
    session.setAttribute("subject",subject);
    if(request.getParameter("go")!=null){
    	try{
    int flag=0;
    subject=request.getParameter("subject");
    branch=request.getParameter("branch");
    semester=request.getParameter("semester");
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
	Statement stmt = con.createStatement();
	String sq="select sub from subject";
	ResultSet rs = stmt.executeQuery(sq);
	while(rs.next()){
		 if(rs.getString("sub").equals(subject)){
			 flag=1;
			 break;
		 }
	}
	if(flag==1){
		String s="select rollNo from student where semester='"+semester+"' and branch='"+branch+"'";
		ResultSet r = stmt.executeQuery(s);
		%>
		<table border="2" width="100%" style="margin-top:20px;background:white;">
<tr><th>Roll no.</th><th>Attendance</th></tr>
		<%
		while(r.next()){
			%>
			<tr>
			<td style="text-align:center"><%=r.getString("rollNo") %></td>
			<td style="text-align:center"><select name=<%=r.getString("rollNo")%>><option value="present">Present</option><option value="absent">Absent</option><option>Leave</option></select></td>
			</tr>
			<%
		}
		%>
		</table>
		<%
	}
	else{
		request.setAttribute("error","subject not found");
		RequestDispatcher rd=request.getRequestDispatcher("takeAtt.jsp");
		rd.forward(request,response);
	}
%>    
<%
}
catch(Exception e){System.out.println(e);}
}
%>
<div style="justify-content:center;align-items:center;display:flex;">
<input type="submit" value="submit" name="submit">
<span style="text-colo:red">${error}</span>
</div>
</form>
</body>
</html>