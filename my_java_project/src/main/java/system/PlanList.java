package system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;

/**
 * Servlet implementation class PlanList
 */
@WebServlet("/PlanList")
public class PlanList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PlanDao pdao = new PlanDao();
		HttpSession session = request.getSession();
		
		session.setAttribute("planlist", pdao.findAllPlan());
		
		response.sendRedirect("./system/jsp/planlist.jsp");
		
	}
}