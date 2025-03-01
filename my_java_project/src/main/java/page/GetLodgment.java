package page;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LodgmentRoom;

@WebServlet("/GetLodgment")
public class GetLodgment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 最新のデータを取得
    	response.setCharacterEncoding("UTF-8");
//    	RoomDao dao = new RoomDao();
//        ArrayList<LodgmentRoom> room = dao.getLodgmentRoom();
    	
    	ArrayList<LodgmentRoom> room = new ArrayList<LodgmentRoom>();
    	
    	room.add(new LodgmentRoom("101","1","202502210001","0",2));
    	room.add(new LodgmentRoom("102","2","202502210001","1",3));
    	room.add(new LodgmentRoom("103","0","","0",0));
        
    	HttpSession session = request.getSession();
		
		session.setAttribute("roomList", room);

        // クライアントにJSONを返す
		response.sendRedirect("./system/jsp/lodgment.jsp");
//    	RequestDispatcher dispatcher = request.getRequestDispatcher("./system/jsp/lodgment.jsp");
//        dispatcher.forward(request, response);
    }
}