package system;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import model.Reservation;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReservationDao dao = new ReservationDao();
		
		Reservation r = dao.findReservation(request.getParameter("reserve"));
		
		if(Objects.nonNull(r.getReservationNo())) {
			RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/checkoutdetail.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/checkoutfaile.jsp");
			rd.forward(request, response);
		}
		
		
	}
}
