package page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;
import dao.ReservationDao;
import dao.RoomDao;
import model.Meal;
import model.Plan;
import model.Reservation;
import model.Room;

/**
 * Servlet implementation class ReserveInquiry
 */
@WebServlet("/CheckIn")
public class CheckIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charaset=UTF-8");
		HttpSession session = request.getSession();
		RoomDao roomdao = new RoomDao();
		ReservationDao rd = new ReservationDao();
		PlanDao pd = new PlanDao();
		Reservation r = rd.findReservation(request.getParameter("reserveid"));
		Plan plan = (Plan)session.getAttribute("plan");
		Meal meal = new Meal();
		
		ArrayList<Room> room = roomdao.findEmptyRoom(plan.getRoomTypeNo());
		
		ArrayList<String> roomno;
		
		roomno = pd.findPlan(r.getPlanNo());
		if(Objects.nonNull(plan.getPlanNo())) {
			meal = pd.findMeal(plan.getMealNo());
		}
		
		
		session.setAttribute("room", room);
		
//		RequestDispatcher d = request.getRequestDispatcher();
//		d.forward(request, response);
		
		response.sendRedirect("./system/jsp/checked.jsp");
		
	}

}