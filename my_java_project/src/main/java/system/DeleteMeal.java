package system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;

/**
 * Servlet implementation class SubmitPlan
 */
@WebServlet("/DeleteMeal")
public class DeleteMeal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlanDao pdao = new PlanDao();
		HttpSession session = request.getSession();
		String mno =request.getParameter("state");
		
		pdao.deleteMeal(mno);
		
		request.setAttribute("flag", "3");
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submit.jsp");
		rd.forward(request, response);
	}
}