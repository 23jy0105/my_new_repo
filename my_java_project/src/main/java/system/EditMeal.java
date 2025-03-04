package system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;
import model.Meal;

/**
 * Servlet implementation class EditPlan
 */
@WebServlet("/EditMeal")
public class EditMeal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PlanDao pdao = new PlanDao();
		Meal meal = pdao.findMeal(request.getParameter("no"));
		
		HttpSession session = request.getSession();
		
		session.setAttribute("meal", meal);
		response.sendRedirect("./system/jsp/editmeal.jsp");
	}
}
