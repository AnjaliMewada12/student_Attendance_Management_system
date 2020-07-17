import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addSub
 */
@WebServlet("/addSub")
public class addSub extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String[] std;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSub() {
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
		
		if(request.getParameter("add")!=null) {
			try {
				String subject=request.getParameter("search");
				String semester=request.getParameter("semester");
				String branch=request.getParameter("branch");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
				Statement stmt = con.createStatement();
				//first query
				String cht="select id from subject";
				ResultSet rst = stmt.executeQuery(cht);
				int flag=0;
				while(rst.next()) {
					if(rst.getString("id").equals(subject+semester+branch)) {
						flag=1;
					}
				}
				if(flag==1) {
					request.setAttribute("error","subject already exists");
					RequestDispatcher rd=request.getRequestDispatcher("addSub.jsp");
					rd.forward(request,response);
				}
				else {
					
				//second query	
				String name="create table "+subject+semester+branch+"(dmy varchar(50) not null primary key)";
				PreparedStatement ps=con.prepareStatement(name);
				ps.executeUpdate();
					
				//third query
				String ch="select rollNo,firstName,lastName,semester,branch from student";
				ResultSet r = stmt.executeQuery(ch);
				while(r.next()) {
					String col =r.getString("firstName")+r.getString("rollNo")+r.getString("lastName");
					//fourth query
					if(r.getString("semester").equals(semester) && r.getString("branch").equals(branch)) {
					String add="alter table "+subject+semester+branch+" add column "+col+" varchar(50)";
					PreparedStatement p = con.prepareStatement(add);
					p.executeUpdate();
					}
				}
				
				//five 
						String sql=
								  "insert into subject values(?,?,?,?)";
								  PreparedStatement pst = 
								  con.prepareStatement(sql);
								  pst.setString(1,subject+semester+branch);
								  pst.setString(2,subject);
								  pst.setString(3,semester);
								  pst.setString(4,branch);
								  pst.executeUpdate();
								  response.sendRedirect("showSubjects.jsp");
			}
			}
			catch(Exception e) {
				System.out.println(e);
				}
			}
	}
}
