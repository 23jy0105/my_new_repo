package system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomDao;
import model.LodgmentRoom;

/**
 * Servlet implementation class EndCleaning
 */
@WebServlet("/EndCleaning")
public class EndCleaning extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String state = request.getParameter("state");
		RoomDao dao = new RoomDao();
		HttpSession session = request.getSession();
		LodgmentRoom room = (LodgmentRoom)session.getAttribute("room");
		
		if("1".equals(state)) {
			dao.setRoomState(room.getRoomNo(),"0");
			response.sendRedirect("./system/jsp/endcleaning.jsp");
		}else {
			dao.setRoomState(room.getRoomNo(),"2");
			response.sendRedirect("./system/jsp/cleaning.jsp");
		}
		
	}

}
