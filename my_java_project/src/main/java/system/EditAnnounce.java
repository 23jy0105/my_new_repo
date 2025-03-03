package system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnnouncementDao;
import model.Announcement;

/**
 * Servlet implementation class EditPlan
 */
@WebServlet("/EditAnnounce")
public class EditAnnounce extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AnnouncementDao dao = new AnnouncementDao();
		Announcement a = dao.findAnnouncement(request.getParameter("no"));
		
		HttpSession session = request.getSession();
		
		session.setAttribute("announce", a);
		response.sendRedirect("./system/jsp/editannounce.jsp");
	}
}
