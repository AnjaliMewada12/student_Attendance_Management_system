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
<body>
<%
    try{
    	Class.forName("com.mysql.jdbc.Driver");  
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
    	Statement stmt = con.createStatement();
    	String first=request.getParameter("first");
    	String last=request.getParameter("last");
    	String roll=request.getParameter("roll");
    	String semester=request.getParameter("semester");
    	String subject=request.getParameter("subject");
    	String branch=request.getParameter("branch");
    	String date=request.getParameter("date");
    	String attendance=request.getParameter("attendance");
    	String sq="select firstName,rollNo,lastName,semester,branch from student";
    	ResultSet rs = stmt.executeQuery(sq);
    	int flag=0;
    	while(rs.next()){
    		if(rs.getString("firstName").equals(first) && rs.getString("lastName").equals(last) && rs.getString("rollNo").equals(roll) && rs.getString("semester").equals(semester) && rs.getString("branch").equals(branch) ){
   
    			flag=1;
                break;
    		}
    	}
    	if(flag==1){
    		String s="select sub,semester,branch from subject";
    		ResultSet r=stmt.executeQuery(s);
    		while(r.next()){
    			if(r.getString("semester").equals(semester) && r.getString("branch").equals(branch) && r.getString("sub").equals(subject)){
    				flag=0;
    				break;
    			}
    		}
    		if(flag==0){
    			String n="update "+subject+semester+branch+" set "+first+roll+last+" ='"+attendance+"' where dmy='"+date+"'";
    			 PreparedStatement pst = 
   					  con.prepareStatement(n);
    			 pst.executeUpdate();
    			 response.sendRedirect("facultyFirst.jsp");
    		}
    		else{
    			request.setAttribute("error","subject not found");
        		RequestDispatcher rd=request.getRequestDispatcher("editAttendance.jsp");
        		rd.forward(request,response);
    		}
    	}
    	else{
    		request.setAttribute("error","student not found");
    		RequestDispatcher rd=request.getRequestDispatcher("editAttendance.jsp");
    		rd.forward(request,response);
    	}
    }
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>