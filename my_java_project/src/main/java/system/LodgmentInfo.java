package system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import model.LodgmentRoom;
import model.Reservation;

@WebServlet("/LodgmentInfo")
public class LodgmentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		ReservationDao dao = new ReservationDao();
		HttpSession session = request.getSession();

		ArrayList<LodgmentRoom> list = (ArrayList<LodgmentRoom>) session.getAttribute("roomList");
		System.out.println(request.getParameter("no") + "<<no");
		LodgmentRoom room = list.get(Integer.parseInt(request.getParameter("no")));
		Reservation r = dao.findReservation(room.getReservationNo());
		if(Objects.isNull(room.getLodgmentNo())){
			response.sendRedirect("./system/jsp/lodgmentinfoemp.jsp");
		}else {
			request.setAttribute("reserve", r);
			request.setAttribute("allergy", dao.getAllergyCount(r).get(Integer.parseInt(room.getLodgmentNo())));
			request.setAttribute("lodgroom", room);
			request.setAttribute("am", dao.watchTimeAM(r));
			request.setAttribute("pm", dao.watchTimePM(r));
			RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/lodgmentinfo.jsp");
			rd.forward(request, response);
		}
		
	}
};