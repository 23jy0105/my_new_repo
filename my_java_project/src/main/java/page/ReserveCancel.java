package page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import dao.RoomDao;
import model.Reservation;
@WebServlet("/ReserveCancel")
public class ReserveCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Reservation reserve = (Reservation)session.getAttribute("reserve");
		RoomDao roomDao = new RoomDao();
		ReservationDao reserveDao = new ReservationDao();
		reserveDao.setCancelDate(reserve);
		roomDao.setRoomCountNumber(false,reserve);
		session.removeAttribute(null);
		RequestDispatcher dispatcher=request.getRequestDispatcher("cancelCheck.jsp");
		dispatcher.forward(request,response);
		
	}
}
