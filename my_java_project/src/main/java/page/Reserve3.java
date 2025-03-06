package page;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String planNumber = info.getPlanNum();
		int staydays = info.getStayDays();        
        LocalDateTime now = LocalDateTime.now();
        Timestamp reservetime = Timestamp.valueOf(now);
        System.out.println("d"+reservetime);
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
        String reservenum = pdao.generateReservationNumber();
		System.out.println(planNumber);
        String password = pdao.generatePassword();
        r.setReservationNo(reservenum);
        r.setPassword(password);
        r.setLodgmentDays(staydays);
        ReservationInfo rr = (ReservationInfo) session.getAttribute("searchInfo");
        String start = rr.getStartDate();
        
        r.setLodgmentStartDate(start);
        ReservationDao dao = new ReservationDao();
        try {
			dao.addReservation(r);
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			RequestDispatcher rd = request.getRequestDispatcher("reservefalse.jsp");
			rd.forward(request, response);
			
		}
        ArrayList<String> strp = (ArrayList<String>) session.getAttribute("roomCount");
        ArrayList<String> stra = (ArrayList<String>) session.getAttribute("allergyCount");   
        	System.out.println(strp);
        	System.out.println(stra);
        	System.out.println("aa");
        for (int i = 0; i < room; i++) {
            String people = strp.get(i);
            int p =Integer.parseInt(people);
            String allergy = stra.get(i);
            int a = Integer.parseInt(allergy);
            String rstr = String.format("%02d", i);
            try {
				dao.addLodgmentInfo(r.getReservationNo(),rstr,p,a);
			} catch (Exception e) {
				// TODO 自動生成された catch ブロック
				System.out.println("エラー２");
			}
        }
//        Mailsend mail = new Mailsend();
//        mail.reservesend(r.getEmailAddress(),r.getPlanNo());
        
		RequestDispatcher rd = request.getRequestDispatcher("reserve3.jsp");
		rd.forward(request, response);
		
	}


}