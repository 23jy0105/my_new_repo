package page;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomDao;
import model.LodgmentRoom;

@WebServlet("/GetCleaning")
public class GetCleaning extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 最新のデータを取得
    	response.setCharacterEncoding("UTF-8");
    	RoomDao dao = new RoomDao();
        ArrayList<LodgmentRoom> room = dao.getLodgmentRoom();
    	
//    	ArrayList<LodgmentRoom> room = new ArrayList<LodgmentRoom>();
//    	
//    	room.add(new LodgmentRoom("101","1","202502210001","0",2));
//    	room.add(new LodgmentRoom("102","2","202502210001","1",3));
//    	room.add(new LodgmentRoom("103","0","","0",0));
//    	room.add(new LodgmentRoom("105","3","","0",0));
//    	room.add(new LodgmentRoom("106","0","","0",0));
//    	room.add(new LodgmentRoom("107","0","","0",0));
//    	room.add(new LodgmentRoom("108","0","","0",0));
//    	room.add(new LodgmentRoom("110","0","","0",0));
//    	room.add(new LodgmentRoom("111","0","","0",0));
//    	room.add(new LodgmentRoom("112","0","","0",0));
//    	
//    	room.add(new LodgmentRoom("201","0","","0",0));
//    	room.add(new LodgmentRoom("102","0","","0",0));
//    	room.add(new LodgmentRoom("103","0","","0",0));
//    	room.add(new LodgmentRoom("105","0","","0",0));
//    	room.add(new LodgmentRoom("106","0","","0",0));
//    	room.add(new LodgmentRoom("107","0","","0",0));
//    	room.add(new LodgmentRoom("108","0","","0",0));
//    	room.add(new LodgmentRoom("110","0","","0",0));
//    	room.add(new LodgmentRoom("111","0","","0",0));
//    	room.add(new LodgmentRoom("112","0","","0",0));
    	
        
    	HttpSession session = request.getSession();
		
		session.setAttribute("cleaningList", room);

        // クライアントにJSONを返す
		response.sendRedirect("./system/jsp/cleaning.jsp");
//    	RequestDispatcher dispatcher = request.getRequestDispatcher("./system/jsp/lodgment.jsp");
//        dispatcher.forward(request, response);
    }
}