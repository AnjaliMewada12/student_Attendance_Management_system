import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
/**
 * Servlet implementation class checkLoginStudent
 */
@WebServlet("/checkLoginStudent")
public class checkLoginStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkLoginStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("login")!=null) {
			String roll=request.getParameter("roll");
			String pass=request.getParameter("password");
			try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
			Statement stmt = con.createStatement();
			String checkSql="select rollNo,pwd from student";
			ResultSet rs = stmt.executeQuery(checkSql);
			int flag=0;
			while(rs.next()) {
				String rollNo=rs.getString("rollNo");
				String pwd=rs.getString("pwd");
				if(pass.equals(pwd) && rollNo.equals(roll)) {
					flag=1;
					break;
				}
			}
			if(flag==1) {
				HttpSession session=request.getSession();
				session.setAttribute("name",roll);
				response.sendRedirect("studentFirst.jsp");
			}
			else {
				request.setAttribute("error","invalid roll no or password");
				RequestDispatcher rd=request.getRequestDispatcher("studentLogin.jsp");
				rd.forward(request,response);
			}
			}
			catch (Exception e2) {System.out.println(e2);}
		}
	}
}