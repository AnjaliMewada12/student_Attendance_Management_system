<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url(back.png)">
<form method="post" action="nowTake.jsp">
<div style="justify-content:center;align-items:center;display:flex;">
 <input type="text" placeholder="Enter the subject name" name="subject"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:20px">
choose branch<select name="branch"><option value="cse">cse</option><option value="electronics">electronics</option><option value="civil">civil</option><option value="mechanical">mechanical</option></select>
choose semester<select name="semester"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select>
</div>
<div style="justify-content:center;align-items:center;display:flex;">
 <input style="font-size:15px;" type="submit" value="go" name="go"/>
 <span style="color:red;">${error}</span>
</div>
</form>
</body>
</html>