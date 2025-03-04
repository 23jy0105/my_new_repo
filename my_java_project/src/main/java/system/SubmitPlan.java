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
@WebServlet("/SubmitPlan")
public class SubmitPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Plan plan = new Plan();
		HttpSession session = request.getSession();
		Plan p =(Plan)session.getAttribute("plan");
		
		plan.setPlanNo(p.getPlanNo());
		plan.setPlanName(request.getParameter("plan-name"));
		plan.setPlanDescription(request.getParameter("details"));
		plan.setPlanOverview(request.getParameter("summary"));
		plan.setFee(Integer.parseInt(request.getParameter("price")));
		plan.setRoomTypeNo(request.getParameter("room-type"));
		plan.setMealNo(request.getParameter("meal-type"));
		PlanDao pdao = new PlanDao();
		
		pdao.setPlan(plan);
		
		request.setAttribute("flag", 0);
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submit.jsp");
		rd.forward(request, response);
	}
}