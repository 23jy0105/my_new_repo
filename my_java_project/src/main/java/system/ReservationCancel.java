package system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import model.Reservation;

/**
 * Servlet implementation class ReservationCancel
 */
@WebServlet("/ReservationCancel")
public class ReservationCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationDao dao = new ReservationDao();
		Reservation r = dao.findReservation((String)request.getAttribute("num"));
		boolean flag = dao.setReservationState((String)request.getAttribute("state"),r );
		
		if(flag) {
			request.setAttribute("flag", "0");
		}else {
			request.setAttribute("flag", "1");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/endcancel.jsp");
		rd.forward(request, response);
	}

}
