
import java.sql.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class assigned
 */
@WebServlet("/assigned")
public class assigned extends HttpServlet {
	private static final long serialVersionUID = 1L;
       static int flag=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public assigned() {
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
		if(request.getParameter("assign")!=null) {
			String id=request.getParameter("id");
			String semester=request.getParameter("semester");
			String branch=request.getParameter("branch");
			String subject=request.getParameter("subject");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
				Statement stmt = con.createStatement();
				String fac="select id from faculty";
				ResultSet rs = stmt.executeQuery(fac);
				while(rs.next()) {
					if(rs.getString("id").equals(id)) {
						flag=1;
					}
				}
				if(flag==1) {
					String st="select sub ,semester,branch from subject";
					ResultSet r = stmt.executeQuery(st);
					while(r.next()) {
						if(r.getString("sub").equals(subject) && r.getString("branch").equals(branch) && r.getString("semester").equals(semester)) {
							flag=0;
						}
					}
					if(flag==0) {
						String ch="insert into classes(id,semester,branch,sub) values(?,?,?,?)";
						 PreparedStatement pst = 
						con.prepareStatement(ch);
						  pst.setString(1, id);
						  pst.setString(2,semester);
						  pst.setString(3, branch);
						  pst.setString(4,subject);
						  pst.executeUpdate();
						  response.sendRedirect("assignClass.jsp");
					}
					else {
						request.setAttribute("error","password did not match");
						RequestDispatcher rd=request.getRequestDispatcher("signMain.jsp");
						rd.forward(request,response);
					}
				}
				else {
					request.setAttribute("error","already assigned");
					RequestDispatcher rd=request.getRequestDispatcher("assignClass.jsp");
					rd.forward(request,response);
				}
			}
			catch(Exception e) {System.out.println(e);}
		}
	}

}
