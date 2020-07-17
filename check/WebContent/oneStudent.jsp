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
<%if(request.getParameter("show")!=null){
	String first=request.getParameter("first");
	String last=request.getParameter("last");
	String roll=request.getParameter("roll");
	String semester=request.getParameter("semester");
	String branch=request.getParameter("branch");
	String subject=request.getParameter("subject");
	try{ 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
		Statement stmt = con.createStatement();
		int flag=0;
		String fsq="select firstName,lastName,rollNo from student";
		ResultSet rs = stmt.executeQuery(fsq);
		while(rs.next()){
			if(rs.getString("rollNo").equals(roll) && rs.getString("firstName").equals(first) && rs.getString("lastName").equals(last)){
				flag=1;
			}
		}
		if(flag==1){
			String sq="select sub,semester,branch from subject";
			ResultSet rst = stmt.executeQuery(sq);
			while(rst.next()){
				if(rst.getString("sub").equals(subject) && rst.getString("branch").equals(branch) && rst.getString("semester").equals(semester)){
					flag=0;
				}
			}
			if(flag==0){
		     String checkSql="select dmy,"+first+roll+last+" from "+subject+semester+branch;
		     ResultSet r = stmt.executeQuery(checkSql);
		     %>
		     <table border="2" width="100%" style="margin-top:20px;background:white;">
             <tr><th>date</th><th>Attendance</th></tr>
		     <%
		     while(r.next()){
		     %>
		     <tr>
		     <td style="text-align:center"><%= r.getString("dmy")%></td>
		     <td style="text-align:center"><%=r.getString(first+roll+last) %></td>
		     </tr>
		     <%
		     }
		     %>
		     </table>
		     <% 
		}
			else{
				request.setAttribute("error","subject not found");
				RequestDispatcher rd=request.getRequestDispatcher("showAttendance.jsp");
				rd.forward(request,response);
			}
		}
		else{
			request.setAttribute("error","student not found");
			RequestDispatcher rd=request.getRequestDispatcher("showAttendance.jsp");
			rd.forward(request,response);
		}
		}
	catch(Exception e){System.out.println(e);}
} 
%>
</body>
</html>