

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class facultyjSecond
 */
@WebServlet("/facultyjSecond")
public class facultyjSecond extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facultyjSecond() {
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
		if(request.getParameter("logout")!=null) {
			response.sendRedirect("firstpage.jsp");
		}
		else if(request.getParameter("attendance")!=null) {
			response.sendRedirect("takeAtt.jsp");
		}
		else if(request.getParameter("schedule")!=null) {
			response.sendRedirect("schedule.jsp");
		}
		else if(request.getParameter("edit")!=null) {
			response.sendRedirect("editAttendance.jsp");
		}
	}

}
