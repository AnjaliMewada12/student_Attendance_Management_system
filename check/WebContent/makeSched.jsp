<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url('back.png')">
<form method="post" action="make">
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 To:<input style="font-size:15px;" type="text" name="to">
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px;">
 From:<input style="font-size:15px;" type="text" name="from">
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px;">
 Subject:<input style="font-size:15px;" type="text" name="subject">
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px;">
 Semester:<select name="semester">
			     <option value="1">1</option>
			     <option value="2">2</option>
			     <option value="3">3</option>
			     <option value="4">4</option>
			      <option value="5">5</option>
			     <option value="6">6</option>
			     <option value="7">7</option>
			     <option value="8">8</option>
			     </select>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px;">
 Branch:<select name="branch">
			     <option value="cse">Cse</option>
			     <option value="civil">Civil</option>
			     <option value="mechanical">Mechanical</option>
			     <option value="electronics">Electronics</option>
			     </select>
</div>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px;">
 id:<input style="font-size:15px;" type="text" name="id">
</div>
<div style="justify-content:center;align-items:center;display:flex;">
 <input style="font-size:15px;" type="submit" name="set" value="set">
 <span style="color:red">${error}</span>
</div>
</form>
</body>
</html>