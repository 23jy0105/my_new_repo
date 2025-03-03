package system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		// TODO Auto-generated method stub
		ReservationDao dao = new ReservationDao();
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		if("reserve".equals(request.getParameter("type"))) {
			if(Objects.nonNull(dao.findReservation(request.getParameter("reservation-number")))) {
				list.add(dao.findReservation(request.getParameter("reservation-number")));
			}
			
			session.setAttribute("sarched", list);
		}else if("phone".equals(request.getParameter("type"))) {
			session.setAttribute("sarched",dao.findReservationbyPhone(request.getParameter("phone-number")));
		}
		session.setAttribute("flag","1");
		response.sendRedirect("./system/jsp/sarchreservation.jsp");
	}
	
}
