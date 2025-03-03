package system;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import dao.RoomDao;
import model.LodgmentRoom;
import model.Reservation;

@WebServlet("/CleaningStart")
public class CleaningStart extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		ReservationDao dao = new ReservationDao();
		HttpSession session = request.getSession();
		
		ArrayList<LodgmentRoom> list = (ArrayList<LodgmentRoom>) session.getAttribute("cleaningList");
		LodgmentRoom room = list.get(Integer.parseInt(request.getParameter("no")));
		Reservation r = dao.findReservation(room.getReservationNo());
		RoomDao rdao = new RoomDao();
		if("2".equals(rdao.getRoomState(room.getRoomNo()))) {
			request.setAttribute("reserve", r);
			request.setAttribute("lodgroom",room);
			request.setAttribute("err", false);
			rdao.setRoomState(room.getRoomNo(),"3");
		}else {
			request.setAttribute("err", true);
			RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/cleaning.jsp");
			rd.forward(request, response);
		}
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/cleaningstart.jsp");
		rd.forward(request, response);
		
	}
};