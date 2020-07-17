<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url('back.png')">
<form method="post" action="fillData.jsp">
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 First Name<input style="font-size:15px;" type="text" placeholder="Enter first name" name="first"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Last Name<input style="font-size:15px;" type="text" placeholder="Enter last name" name="last"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Roll no.<input style="font-size:15px;" type="text" placeholder="Enter roll no" name="roll"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Subject<input style="font-size:15px;" type="text" placeholder="Enter subject name" name="subject"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Semester<input style="font-size:15px;" type="text" placeholder="Enter last name" name="semester"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Branch<input style="font-size:15px;" type="text" placeholder="Enter branch" name="branch"/>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Date<input style="font-size:15px;" type="text" placeholder="Enter date" name="date"/>
</div>
</div>
<div style="justify-content:center;align-items:center;display:flex;margin:10px">
 Attendance <select name="attendance"><option valule="present">Present</option><option value="absent">Absent</option><option value="leave">Leave</option></select>
</div>
<div style="justify-content:center;align-items:center;display:flex;">
 <a href="filldata.jsp"><input style="font-size:15px;" type="submit" value="add" name="add"/></a>
 <span style="color:red;">${error}</span>
</div>
</form>
</body>
</html>