package page;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AnnouncementDao;
import model.Announcement;

@WebServlet("/Information")
public class Information extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // DAOを使ってデータ取得
        AnnouncementDao dao = new AnnouncementDao();
        ArrayList<Announcement> announcements = dao.findAllAnnouncement();
        dao.connectionClose();
        
        // JSP にデータを送る
        request.setAttribute("announcements", announcements);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("information.jsp");
        dispatcher.forward(request, response);
    }
}
