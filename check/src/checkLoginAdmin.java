import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class checkLoginAdmin
 */
@WebServlet("/checkLoginAdmin")
public class checkLoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkLoginAdmin() {
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
			if (request.getParameter("login")!=null) {
				String id=request.getParameter("id");
				String pass=request.getParameter("password");
				try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","aayushi@12");
				Statement stmt = con.createStatement();
				String checkSql="select id,pwd from admin";
				ResultSet rs = stmt.executeQuery(checkSql);
				int flag=0;
				while(rs.next()) {
					String idS=rs.getString("id");
					String pwd=rs.getString("pwd");
					System.out.println(idS+","+id);
					System.out.println(pwd+","+pass);
					if(pass.equals(pwd) && idS.equals(id)) {
						flag=1;
						break;
					}
				}
				if(flag==1) {
					response.sendRedirect("adminFirst.jsp");
				}
				else {
					request.setAttribute("error","invalid roll no or password");
					RequestDispatcher rd=request.getRequestDispatcher("adminLogin.jsp");
					rd.forward(request,response);
				}
				}
				catch (Exception e2) {System.out.println(e2);}
			}
			//sql queries to check login details
		}
}
}