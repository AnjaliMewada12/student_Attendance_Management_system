<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background: url('back.png');">
<h2 style="font-size:300%;text-align:center;">Sign up as</h2>
<form method="post" action="showSign">
<table style="margin-left:auto;margin-right:auto;">
<tr>
<td>
<a><input style="border-width:20%;font-size:150%;border-radius:40%;height:150px;width:150px;" type="submit" value="Student" name="student"></a>
</td>
<td></td>
<td>
<input style="font-size:150%;border-radius:40%;height:150px;width:150px;" type="submit" value="Admin" name="admin">
</td>
<td></td>
<td>
<input style="font-size:150%;border-radius:40%;height:150px;width:150px;" type="submit" value="Faculty" name="faculty">
</td>
</tr>
</table>
</form>
<h2 style="text-align: center;">or</h2>
<p style="text-align: center;"><a href="firstpage.jsp"><input style="font-size:150%;border-radius:40%;height:50px;width:150px;" type="submit" value="Log in" name="faculty"></a>
</p>
</body>
</html>