package page;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanidAndPasswordGenerateDao;
import dao.ReservationDao;
import model.Reservation;
import model.ReservationInfo;

/**
 * Servlet implementation class Reserve3
 */
@WebServlet("/Reserve3")
public class Reserve3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ReservationInfo info = (ReservationInfo) session.getAttribute("info");
		String lastName =info.getLastName();
		String firstName = info.getFirstName();
        String name = lastName+" "+firstName;
        String lastKana = info.getLastKana();
        String firstKana = info.getFirstKana();
        String nameKana =lastKana+" "+firstKana;
        String email = info.getEmail();
        String postalCode = info.getPostalCode();
        String prefecture = info.getPrefecture();
        String address = info.getAddress();
        String building = info.getBuilding();
        String cAddress =prefecture+address+building;
        String phone = info.getPhone();
        int room = info.getRoom();
        System.out.println();
        String planNumber = request.getParameter("planNumber");
		int staydays = info.getStayDays();
        List<String> peopleList = new ArrayList<>();
        List<String> allergyList = new ArrayList<>();
        for (int i = 1; i <= room; i++) {
            String people = request.getParameter("roomCount" + i);  // "people1", "people2", ...
            String allergy = request.getParameter("allergyCount"+i);  // "allergy1", "allergy2", ...
            peopleList.add(people);
            allergyList.add(allergy);
        }
        LocalDateTime now = LocalDateTime.now();
        Timestamp reservetime = Timestamp.valueOf(now);
        Reservation r = new Reservation();
        r.setCustomerName(name);
        r.setCustomerNameKana(nameKana);
        r.setEmailAddress(email);
        r.setPostalCode(postalCode);
        r.setAddress(cAddress);
        r.setPhoneNumber(phone);
        r.setTotalReservationRoom(room);
        r.setPlanNo(planNumber);
        r.setReservationDate(reservetime);
        PlanidAndPasswordGenerateDao pdao = new PlanidAndPasswordGenerateDao();
        String planNum = pdao.generateReservationNumber();
		System.out.println(planNum);
        String password = pdao.generatePassword();
        r.setPlanNo(planNum);
        r.setPassword(password);
        r.setLodgmentDays(staydays);
        String start = (String)session.getAttribute("startDate");
        System.out.println(start);
//        r.setLodgmentStartDate(start);
        ReservationDao dao = new ReservationDao();
        try {
			dao.addReservation(r);
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			System.out.println("エラー１");
		}
        for (int i = 0; i < room; i++) {
            String people = peopleList.get(i);
            String allergy = allergyList.get(i);
            String rstr = String.format("%02d", i);
            try {
				dao.addLodgmentInfo(rstr, people, allergy);
			} catch (Exception e) {
				// TODO 自動生成された catch ブロック
				System.out.println("エラー２");
			}
        }
        
		RequestDispatcher rd = request.getRequestDispatcher("reserve3.jsp");
		rd.forward(request, response);
		
	}


}