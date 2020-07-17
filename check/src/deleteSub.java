
import java.sql.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteSub
 */
@WebServlet("/deleteSub")
public class deleteSub extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String id="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteSub() {
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
		if(request.getParameter("delete")!=null) {
			try {
				String subject=request.getParameter("search");
				String semester=request.getParameter("semester");
				String branch=request.getParameter("branch");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
				Statement stmt = con.createStatement();
				String cht="select id from subject";
				ResultSet rst = stmt.executeQuery(cht);
				int flag=0;
				while(rst.next()) {
					if(rst.getString("id").equals(subject+semester+branch)) {
						flag=1;
						id=rst.getString("id");
					}
				}
				if(flag==0) {
					request.setAttribute("error","subject not found");
					RequestDispatcher rd=request.getRequestDispatcher("delSub.jsp");
					rd.forward(request,response);
				}
				else {
					String add="delete from subject where id='"+id+"'";
					PreparedStatement p = con.prepareStatement(add);
					p.executeUpdate();
					String ch="drop table "+subject+semester+branch;
					PreparedStatement ps = con.prepareStatement(ch);
					ps.executeUpdate();
					 response.sendRedirect("showSubjects.jsp");
				}
			}
			catch(Exception e) { System.out.println(e);}
		}
	}

}
