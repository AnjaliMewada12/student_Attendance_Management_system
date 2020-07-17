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
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 2px solid black;
  float: left;
  width: 30%;
  background: #f1f1f1;
}
/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>
</head>
<body style="background:url('back.png');">
<form class="example" method="post" action="oneStudent.jsp">
<div style="justify-content:center;align-items:center;display:flex;">
 <input type="text" placeholder="First Name.." name="first"/>
 <input type="text" placeholder="Last Name" name="last"/>
 <input type="text" placeholder="Roll no" name="roll"/>
 <input type="text" placeholder="subject" name="subject"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:20px">
choose branch<select name="branch"><option value="cse">cse</option><option value="electronics">electronics</option><option value="civil">civil</option><option value="mechanical">mechanical</option></select>
choose semester<select name="semester"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select>
</div>
<div style="justify-content:center;align-items:center;display:flex;">
 <input style="font-size:15px;" type="submit" value="show" name="show"/>
 <span style="color:red;">${error}</span>
</div>
</form>
</body>
</html>