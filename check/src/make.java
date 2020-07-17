
import java.sql.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class make
 */
@WebServlet("/make")
public class make extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public make() {
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
		String to=request.getParameter("to");
		String from=request.getParameter("from");
		String semester=request.getParameter("semester");
		String branch=request.getParameter("branch");
		String subject=request.getParameter("subject");
		String id=request.getParameter("id");
		if(to.equals("")|| from.equals("")|| semester.equals("") || branch.equals("")|| subject.equals("")||id.equals("")) {
			request.setAttribute("error","fill the required information");
			RequestDispatcher rd=request.getRequestDispatcher("makeSched.jsp");
			rd.forward(request,response);
		}
		else {
			try {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
				Statement stmt = con.createStatement();
				String ch="select id,semester,branch,sub from classes";
				ResultSet rs = stmt.executeQuery(ch);
				int flag=0;
				while(rs.next()) {
					if(rs.getString("id").equals(id) && rs.getString("semester").equals(semester) && rs.getString("sub").equals(subject) && rs.getString("branch").equals(branch)) {
						flag=1;
					}
				}
				if(flag==1) {
				            String s="update classes set t='"+to+"' where id='"+id+"' and semester='"+semester+"' and branch='"+branch+"'";
				            PreparedStatement p = 
									  con.prepareStatement(s);
									  p.executeUpdate();
							String sq="update classes set fro='"+from+"' where id='"+id+"' and semester='"+semester+"' and branch='"+branch+"'";
							 PreparedStatement ps = 
									  con.prepareStatement(sq);
									  ps.executeUpdate();
							response.sendRedirect("facultyFirst.jsp");
				}
				
				else {
					request.setAttribute("error","subject is not assigned to this id");
					RequestDispatcher rd=request.getRequestDispatcher("makeSched.jsp");
					rd.forward(request,response);
				}
		}
			 catch(Exception e) {System.out.println(e);}
		}
	}

}
