import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.RoomDao;
import model.Room;

@WebServlet("/GetLodgment")
public class GetLodgment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 最新のデータを取得
    	RoomDao dao = new RoomDao();
        Room room = dao.findAllRoom();
        
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString();

        // クライアントにJSONを返す
        response.setContentType("application/json");
        response.getWriter().write(currentTime);
    }
}