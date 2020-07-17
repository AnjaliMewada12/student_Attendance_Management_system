

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class take
 */
@WebServlet("/take")
public class take extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public take() {
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
		if(request.getParameter("submit")!=null) {
			String date=request.getParameter("date");
			if(date.equals("")) {
				request.setAttribute("error","enter date");
				RequestDispatcher rd=request.getRequestDispatcher("nowTake.jsp");
				rd.forward(request,response);
			}
			else {
			 try {
				    HttpSession session=request.getSession();
					String semester=(String)session.getAttribute("semester");
					String subject=(String)session.getAttribute("subject");
					String branch=(String)session.getAttribute("branch");
					System.out.println(subject);
				    Class.forName("com.mysql.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
					Statement stmt = con.createStatement();
					String cht="select dmy from "+subject+semester+branch;
					ResultSet r = stmt.executeQuery(cht);
					int flag=0;
					while(r.next()) {
						if(r.getString("dmy").equals(date)) {
							flag=1;
							break;
						}
					}
					if(flag==0) {
					String s="insert into "+subject+semester+branch+"(dmy) values(?)";
					PreparedStatement pst = 
							  con.prepareStatement(s);
							  pst.setString(1, date);
							  pst.executeUpdate();
							  
					String sq="select rollNo,firstName,lastName from student where semester='"+semester+"' and branch='"+branch+"'";
					ResultSet rs = stmt.executeQuery(sq);
					while(rs.next()) {
						String roll=rs.getString("rollNo");
						String value=request.getParameter(roll);
						String ch="update "+subject+semester+branch+" set "+rs.getString("firstName")+roll+rs.getString("lastName")+"='"+value+"' where dmy='"+date+"'";
						PreparedStatement p = 
								  con.prepareStatement(ch);
								  p.executeUpdate();
						response.sendRedirect("facultyFirst.jsp");
					}
					
			 }
					else {
						request.setAttribute("error","data has been filled for this date");
						RequestDispatcher rd=request.getRequestDispatcher("nowTake.jsp");
						rd.forward(request,response);
					}
			 }
			 catch(Exception e) {System.out.println(e);}
			}
		}
	}
}
