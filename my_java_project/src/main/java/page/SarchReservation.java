package page;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import model.Reservation;

/**
 * Servlet implementation class SarchReservation
 */
@WebServlet("/SarchReservation")
public class SarchReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// TODO Auto-generated method stub
		ReservationDao dao = new ReservationDao();
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		if("reserve".equals(request.getParameter("type"))) {
			request.setAttribute("sarched", list.add(dao.findReservation(request.getParameter("reservation-number"))));
		}else if("phone".equals(request.getParameter("type"))) {
			request.setAttribute("sarched",dao.findReservationbyPhone(request.getParameter("phone-number")));
		}
		request.setAttribute("flag","1");
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/sarchreservation.jsp");
		rd.forward(request, response);
	}
	
}
