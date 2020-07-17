<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background: url('back.png');">
		<h2 style="font-size:300%;text-align:center;">You are a student </h2>
		<form method="post" action="studentMain.jsp">
		<table style="margin-left:auto;margin-right:auto;">
		<tr>
		<td>
		<a><input style="font-size:180%;border-radius:40%;height:150px;width:200px;" type="submit" value="logout" name="logout"></a>
		</td>
		<td></td>
		<td>
		<input style="font-size:180%;border-radius:40%;height:150px;width:200px;" type="submit" value="Attendance" name="attendance">
		</td>
		</tr>
		</table>
		</form>
		</body>
</html>