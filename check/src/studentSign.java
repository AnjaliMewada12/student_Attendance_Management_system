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
 * Servlet implementation class studentSign
 */
@WebServlet("/studentSign")
public class studentSign extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public studentSign() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("submit") != null) {
			String id = request.getParameter("id");
			String first = request.getParameter("firstname");
			String last = request.getParameter("lastname");
			String password = request.getParameter("password");
			String retype = request.getParameter("retype");
			String branch = request.getParameter("branch");
			String semester = request.getParameter("semester");
			String email = request.getParameter("email");
			String reg = "^[A-Z0-9.%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$";
			Pattern emailPat = Pattern.compile(reg, Pattern.CASE_INSENSITIVE);
			Matcher matcher = emailPat.matcher(email);
			if (matcher.find() == false) {
				request.setAttribute("error", "invalid email");
				RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
				rd.forward(request, response);
			} else {
				// TODO Auto-generated method stub
				if (id.equals("") || first.equals("") || last.equals("") || password.equals("") || semester.equals("")
						|| branch.equals("") || retype.equals("") || email.equals("")) {
					request.setAttribute("error", "fill all the required information");
					RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
					rd.forward(request, response);
				} else if (password.length() < 8) {
					request.setAttribute("error", "password must contain at least 8 characters");
					RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
					rd.forward(request, response);
				} else {
					if (password.equals(retype)) {
						try {
							int flag = 0;
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root",
									"aayushi@12");
							Statement stmt = con.createStatement();
							String student = "select rollNo,email from student";
							ResultSet rs = stmt.executeQuery(student);
							while (rs.next()) {
								if (rs.getString("rollNo").equals(id) && rs.getString("email").equals(email)) {
									request.setAttribute("error", "rollNo or email already exist");
									RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
									rd.forward(request, response);
									flag = 1;
								}
							}
							String faculty = "select id from faculty";
							ResultSet rs1 = stmt.executeQuery(faculty);
							while (rs1.next()) {
								if (rs1.getString("id").equals(id)) {
									request.setAttribute("error", "id of the faculty already exists with this id");
									RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
									rd.forward(request, response);
									flag = 1;
								}
							}
							String admin = "select id from admin";
							ResultSet rs2 = stmt.executeQuery(admin);
							while (rs2.next()) {
								if (rs2.getString("id").equals(id)) {
									request.setAttribute("error", "id of the admin already exists with this id");
									RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
									rd.forward(request, response);
									flag = 1;
								}
							}
							if (flag == 0) {
								String sql = "insert into student values (?,?,?,?,?,?,?)";
								PreparedStatement pst = con.prepareStatement(sql);
								pst.setString(1, id);
								pst.setString(2, first);
								pst.setString(3, last);
								pst.setString(4, password);
								pst.setString(5, email);
								pst.setString(6, semester);
								pst.setString(7, branch);
								int i = pst.executeUpdate();
								response.sendRedirect("firstpage.jsp");
							} else {
								//
							}
						} // end of try
						catch (Exception e2) {
							System.out.println(e2);
						}
					} else {
						// password mismatched
						request.setAttribute("error", "password did not match");
						RequestDispatcher rd = request.getRequestDispatcher("signMain.jsp");
						rd.forward(request, response);
					}
				}
			} // end of third else
		} // end of first if
	}
}