<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DocType html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
 <body style="background: url('back.png');">
<h1 style="font-size:500%;text-align:center;font-style:italic;color:indianred;">Student Attendance Management System</h1>
<h2 style="font-size:300%;text-align:center;">Login as</h2>
<form method="post" action="login">
<table style="margin-left:auto;margin-right:auto;">
<tr>
<td>
<a><input style="border-width:20%;font-size:180%;border-radius:40%;height:150px;width:150px;" type="submit" value="Student" name="student"></a>
</td>
<td></td>
<td>
<input style="font-size:180%;border-radius:40%;height:150px;width:150px;" type="submit" value="Admin" name="admin">
</td>
<td></td>
<td>
<input style="font-size:180%;border-radius:40%;height:150px;width:150px;" type="submit" value="Faculty" name="faculty">
</td>
</tr>
</table>
</form>
<h2 style="text-align: center;">or</h2>
<p style="text-align: center;"><a href="signupas.jsp"><input style="font-size:150%;border-radius:40%;height:50px;width:150px;" type="submit" value="Sign Up" name="faculty"></a>
</p>
</body>
</html>