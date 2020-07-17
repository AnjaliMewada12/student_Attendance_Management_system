<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background: url('back.png');background-size:cover;">
<form method="post" action="checkLoginFaculty">
		<table style="width:500px;height:500px;border:5px solid whitesmoke;margin:0px auto;background-color:whitesmoke;padding:10px;margin-top:50px;border-radius:30px;">
            <tr>
                <td colspan="2">
                    <h1 style="font-size:50px;margin:0px auto;">
                        <center>
                            Login here
                        </center>
                    </h1>
                    <span>${error}</span>
                </td>
            </tr>
            <tr>
				<td colspan="2"><center><input type="text" name="id" placeholder="Enter the Id " style="border-radius:22px;padding:10px;"></center></td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="password" name="password" placeholder="Enter the password" style="border-radius:22px;padding:10px;"></center></td>
            </tr>
            <tr>
                <td colspan="2">
                <center>
                    <input type="submit" style="font-size:130%;" value="Log in" name="login" style="margin-left: auto;margin-right: auto;">
                </center>
            </td>
                </tr>
            <tr><td>
                <center>
                    <a href="signup.jsp"><p style="color: darkblue;font-size: 120%;">Create an account</p></a>
            </center></td>   
                 <td>
                     <center>
                        <a href=""><p style="color: darkblue;font-size: 120%;">forgot password</p></a>
                    </center> </td>
        </tr>
		</table>
    </form>
</div>
</body>
</html>