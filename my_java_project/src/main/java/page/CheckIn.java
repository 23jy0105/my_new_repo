package page;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import dao.RoomDao;
import model.LodgmentInformation;
import model.Meal;
import model.Plan;
import model.Reservation;
import model.Room;

/**
 * Servlet implementation class ReserveInquiry
 */
@WebServlet("/CheckIn")
public class CheckIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charaset=UTF-8");
		HttpSession session = request.getSession();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		time.setNanos(0); // ナノ秒を切り捨て

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formatted = sdf.format(time);
		System.out.println(formatted);
		time = Timestamp.valueOf(formatted);
		RoomDao roomdao = new RoomDao();
		ReservationDao rd = new ReservationDao();
//		LodgmentInformation lodg = new LodgmentInformation();
		Reservation r = (Reservation) session.getAttribute("reserve");
		Plan plan = (Plan) session.getAttribute("plan");
		Meal meal = (Meal) session.getAttribute("meal");

		//		System.out.println((String)session.getAttribute("dinner")+session.getAttribute("breakfast"));
		System.out.println("breakfastIS" + (String) request.getParameter("breakfast"));
		int sum = 0;

		if (Integer.parseInt(meal.getMealNo()) == 000) {
			sum = 0;
		} else if (Integer.parseInt(meal.getMealNo()) == 100) {
			sum = Integer.parseInt((String) request.getParameter("breakfast"));
		} else if (Integer.parseInt(meal.getMealNo()) > 100) {
			sum = Integer.parseInt((String) request.getParameter("dinner"))
					+ Integer.parseInt((String) request.getParameter("breakfast"));
		} else {
			sum = Integer.parseInt((String) request.getParameter("dinner"));
		}

		String mealno = String.valueOf(sum);

		System.out.println("sumIS" + sum);

		System.out.println("breakfastIS" + (String) session.getAttribute("breakfast"));
		System.out.println("mealIS" + meal.getMealNo());
		if (Objects.isNull(mealno)) {
			System.out.println("mealISNULL");
			mealno = "00";
		}

		ArrayList<Room> room = roomdao.findEmptyRoom(plan.getRoomTypeNo());
		ArrayList<String> inroom = new ArrayList<String>();
		//planからroom_typeが一致するroomを全件昇順取得

		System.out.println(r.getTotalReservationRoom());
		
		System.out.println(mealno+"mealno<<");
		for (int i = 0; i < r.getTotalReservationRoom(); i++) {
			String roomno = room.get(i).getRoomNo();
			roomdao.setRoomState(room.get(i).getRoomNo());
			r.setCheckInTime(time);
			rd.setCheckinTime(r);
			rd.setMealTime(r, mealno);

			rd.setLodgment(r, roomno,i);

			inroom.add(roomno);
			System.out.println(roomno + "!!");
			System.out.println(room.get(i).getRoomNo() + "?");

		}
		//取得したroomの中の手前からreservationのtotal_lodgment_room数分選択、room_numberをsetRoomStateに送信
		//trueが返ってこなかった場合例外処理trueが返ってきたらreservationにcheck_in_time、あればmeal_timeをセット
		//予約番号からlodgmentinformetionを検索、room_numberをinsert
		
		
		r.setMealTime(mealno);
		
		System.out.println(inroom);
		session.setAttribute("reserve", r);
		session.setAttribute("inroom", inroom);
		session.setAttribute("lodgment", rd.findLodgment(r.getReservationNo()));

		//		RequestDispatcher d = request.getRequestDispatcher();
		//		d.forward(request, response);

		response.sendRedirect("./system/jsp/checkinEnd.jsp");

	}

}