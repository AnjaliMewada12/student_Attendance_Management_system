import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class facultySign
 */
@WebServlet("/facultySign")
public class facultySign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facultySign() {
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
			String id =request.getParameter("id");
			String first =request.getParameter("firstname");
			String last =request.getParameter("lastname");
			String password =request.getParameter("password");
			String retype=request.getParameter("retype");
			String email =request.getParameter("email");
			String reg="^[A-Z0-9.%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$";
			Pattern emailPat=Pattern.compile(reg,Pattern.CASE_INSENSITIVE);
			Matcher matcher=emailPat.matcher(email);
			if(matcher.find()==false) {
				request.setAttribute("error","invalid email");
				RequestDispatcher rd=request.getRequestDispatcher("signMain.jsp");
				rd.forward(request,response);
			}
			else {
			// TODO Auto-generated method stub
			if(id.equals("") || first.equals("") || last.equals("") || password.equals("") || retype.equals("")||email.equals("")) {
				request.setAttribute("error","fill all the required information");
				RequestDispatcher rd=request.getRequestDispatcher("signMain.jsp");
				rd.forward(request,response);
			}
			else if(password.length()<8){
				request.setAttribute("error","password must contain at least 8 characters");
				RequestDispatcher rd=request.getRequestDispatcher("signMain.jsp");
				rd.forward(request,response);
			}
			else {
				if(password.equals(retype)) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
				Statement stmt = con.createStatement();
				String sql=
						  "insert into faculty values (?,?,?,?,?)";
						  PreparedStatement pst = 
						  con.prepareStatement(sql);
						  pst.setString(1, id);
						  pst.setString(2, first);
						  pst.setString(3, last);
						  pst.setString(4, password);
					      pst.setString(5,email);
						  int i = pst.executeUpdate();
		        stmt.close();
		        con.close();
		        response.sendRedirect("firstpage.jsp");
				}
				catch (Exception e2) {System.out.println(e2);}
				}//end of first if
			else {
				//password mismatched
				request.setAttribute("error","password did not match");
				RequestDispatcher rd=request.getRequestDispatcher("signMain.jsp");
				rd.forward(request,response);
			}
		}
	  }
	}
	}

}
