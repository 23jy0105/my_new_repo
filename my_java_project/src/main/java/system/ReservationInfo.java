package system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlanDao;
import dao.ReservationDao;
import model.Reservation;

/**
 * Servlet implementation class ReservationInfo
 */
@WebServlet("/ReservationInfo")
public class ReservationInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReservationDao dao = new ReservationDao();
		PlanDao pdao = new PlanDao();
		Reservation r = dao.findReservation(request.getParameter("no"));
		request.setAttribute("result",r);
		
		request.setAttribute("planname", pdao.findPlan(r.getPlanNo()).getPlanName());
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/reservationinfo.jsp");
		rd.forward(request, response);
		
	}
}
