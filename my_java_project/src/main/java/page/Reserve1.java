package page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ReservationInfo;

/**
 * Servlet implementation class Reserve1
 */
@WebServlet("/Reserve1")
public class Reserve1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
					int stayDays=0;
					int people=0;
					int room =0;
					String date ="";
					stayDays = Integer.parseInt(request.getParameter("stayDays"));
					people = Integer.parseInt(request.getParameter("people"));
					room = Integer.parseInt(request.getParameter("room"));
					date = request.getParameter("date");
					ReservationInfo info =new ReservationInfo();
								info.setStayDays(stayDays);
								info.setPeople(people);
								info.setRoom(room);
								info.setStartDate(date);
								HttpSession session = request.getSession();
								session.setAttribute("info",info);
								RequestDispatcher rd = request.getRequestDispatcher("reserve1.jsp");
								rd.forward(request, response);
	}

}