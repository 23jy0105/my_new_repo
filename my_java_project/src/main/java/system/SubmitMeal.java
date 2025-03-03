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
import model.Meal;

/**
 * Servlet implementation class SubmitPlan
 */
@WebServlet("/SubmitMeal")
public class SubmitMeal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Meal m =(Meal)session.getAttribute("meal");
		Meal meal = new Meal();
		
		meal.setMealNo(m.getMealNo());
		meal.setMealName(request.getParameter("name"));
		meal.setAllergen(request.getParameter("allergen"));
		
		PlanDao pdao = new PlanDao();
		
		pdao.setMeal(meal);
		
		request.setAttribute("flag", 0);
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submit.jsp");
		rd.forward(request, response);
	}
}