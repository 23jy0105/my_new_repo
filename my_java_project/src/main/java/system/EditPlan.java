package system;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;
import model.Meal;
import model.Plan;

/**
 * Servlet implementation class EditPlan
 */
@WebServlet("/EditPlan")
public class EditPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PlanDao pdao = new PlanDao();
		Plan plan = pdao.findPlan(request.getParameter("no"));
		ArrayList<Meal> meal = pdao.findAllMeal();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("plan", plan);
		session.setAttribute("meallist", meal);
		response.sendRedirect("./system/jsp/editplan.jsp");
	}
}
