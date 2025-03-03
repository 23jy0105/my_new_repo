package system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlanDao;
import model.Meal;

/**
 * Servlet implementation class SubmitPlan
 */
@WebServlet("/AddMeal")
public class AddMeal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlanDao pdao = new PlanDao();
		Meal meal = new Meal();
		
		meal.setMealNo(pdao.getemptynumberMeal());
		meal.setMealName(request.getParameter("name"));
		meal.setAllergen(request.getParameter("allergen"));
		
		pdao.setMeal(meal);
		
		request.setAttribute("flag", 2);
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submit.jsp");
		rd.forward(request, response);
	}
}