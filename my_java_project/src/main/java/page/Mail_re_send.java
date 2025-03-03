package page;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import model.Reservation;

/**
 * Servlet implementation class Mail_re_send
 */
@WebServlet("/Mail_re_send")
public class Mail_re_send extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationDao dao1 = new ReservationDao();
		Reservation reserve = new Reservation();
	    
	    String mail = request.getParameter("mail");
	    String resDay = request.getParameter("reservationstartdays");
	    reserve = dao1.findReservationbyMail(mail,resDay);
	    
	    HttpSession session = request.getSession();
    	session.setAttribute("reserve", reserve);
    	if(mail.equals(reserve.getEmailAddress())) {
    		
    	}
	}

}
