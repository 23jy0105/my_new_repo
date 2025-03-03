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
import model.Plan;

/**
 * Servlet implementation class SubmitPlan
 */
@WebServlet("/AddPlan")
public class AddPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Plan plan = new Plan();
		PlanDao pdao = new PlanDao();
		HttpSession session = request.getSession();
		Plan p =(Plan)session.getAttribute("plan");
		
		plan.setPlanNo(pdao.getemptynumberPlan());
		plan.setPlanName(request.getParameter("plan-name"));
		plan.setPlanDescription(request.getParameter("details"));
		plan.setPlanOverview(request.getParameter("summary"));
		plan.setFee(Integer.parseInt(request.getParameter("price")));
		plan.setRoomTypeNo(request.getParameter("room-type"));
		plan.setMealNo(request.getParameter("meal-type"));
		
		pdao.setPlan(p);
		
		request.setAttribute("flag", 2);
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submit.jsp");
		rd.forward(request, response);
	}
}