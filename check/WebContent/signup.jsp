<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url(back.png);">
<form method="post" action="facultySign">
		<table style="width:500px;height:600px;border:5px solid whitesmoke;margin:0px auto;background-color:whitesmoke;padding:10px;margin-top:50px;border-radius:30px;">
			<tr>
                <td colspan="2">
                    <h1 style="font-size:45px;margin:0px auto;">
                        <center>
                            Signup here
                        </center>
                    </h1>
                </td>
            </tr>
			<tr>
		    <td>id</td>
		    <td><input type="text" name="id" style="border-radius:22px;padding:10px;" required></td>
		    </tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstname" style="border-radius:22px;padding:10px;" required></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text"  required name="lastname" style="border-radius:22px;padding:10px;"></td>
			<tr>
			    <td>Password</td>
			    <td><input id="ps1" type="password"  required name="password" style="border-radius:22px;padding:10px;"></td>
			</tr>
			<tr>
			    <td>Retype-password</td>
			    <td><input id="ps2" type="password" required name="retype" style="border-radius:22px;padding:10px;"></td>
			</tr>
			
			<tr>
			<td>E-mail</td>
			<td><input type="text" name="email" required style="border-radius:22px;padding:10px;"></td>
			</tr>
			<tr>
			    <td>
			    <input type="submit" value="signup" name="submit">
			    </td>
			</tr>
		</table>
		<h1 id="invalid"></h1>
	</form>
</body>
</html>