package page;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;
import dao.ReservationDao;
import model.Meal;
import model.Plan;
import model.Reservation;

/**
 * Servlet implementation class ReserveInquiry
 */
@WebServlet("/ReserveInquiry")
public class ReserveInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charaset=UTF-8");
		
		String zero = "000";
		ReservationDao rd = new ReservationDao();
		PlanDao pd = new PlanDao();
		Reservation r = rd.findReservation(request.getParameter("reserveid"));
		Plan plan = new Plan();
		Meal meal = new Meal();
		
		System.out.println(r.getReservationNo()+"<<<");
		System.out.println(rd.findLodgment(r.getReservationNo())+"testooooooooooooo");
		plan = pd.findPlan(r.getPlanNo());
		if(Objects.nonNull(plan.getPlanNo())) {
			System.out.println(r.getPlanNo()+"planNO");
			meal = pd.findMeal(plan.getMealNo());
			System.out.println("mealNoIS"+meal);
		}
		HttpSession session = request.getSession();
		
		
		
		session.setAttribute("lodgment", rd.findLodgment(r.getReservationNo()));
		session.setAttribute("allergy", rd.getAllergyCount(r));
		session.setAttribute("reserve", r);
		session.setAttribute("plan", plan);
		session.setAttribute("meal", meal);
		session.setAttribute("breakfast","0");
		session.setAttribute("dinner","0");
//		RequestDispatcher d = request.getRequestDispatcher();
//		d.forward(request, response);
		System.out.println(meal.getMealNo()+zero);
		if(zero.equals(meal.getMealNo())) {
			
			response.sendRedirect("./CheckIn");
		}else {
			response.sendRedirect("./system/jsp/checked.jsp");
		}
	}

}