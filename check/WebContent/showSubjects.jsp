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
<jsp:include page="changeSubject.jsp"/> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/db" user="root" password="aayushi@12"/>
<sql:query dataSource="${db}" var="rs">
select sub,semester,branch from subject;
</sql:query>
<table border="2" width="100%" style="margin-top:20px;background:white;">
<tr><th>Subject</th><th>Semester</th><th>Branch</th></tr>
<c:forEach var="table" items="${rs.rows}">
<tr>
<td style="text-align:center;"><c:out value="${table.sub}"/></td>
<td style="text-align:center;"><c:out value="${table.semester}"/></td>
<td style="text-align:center;"><c:out value="${table.branch}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>