package page;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlanDao;
import dao.PlanidAndPasswordGenerateDao;
import dao.ReservationDao;
import model.LodgmentInformation;
import model.Plan;
import model.Reservation;

/**
 * Servlet implementation class Reserve3
 */
@WebServlet("/Reserve3")
public class Reserve3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String host = "10.42.129.3";
    String from = "23jy0107@jec.ac.jp"; 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String name = lastName+firstName;
        String lastKana = request.getParameter("lastKana");
        String firstKana = request.getParameter("firstKana");
        String nameKana =lastKana+firstKana;
        String email = request.getParameter("email");
        String postalCode = request.getParameter("postalCode");
        String prefecture = request.getParameter("prefecture");
        String address = request.getParameter("address");
        String building = request.getParameter("building");
        String cAddress =prefecture+address+building;
        String phone = request.getParameter("phone");
        int room = Integer.parseInt(request.getParameter("room"));
        String planNumber = request.getParameter("planNumber");
		int date = Integer.parseInt(request.getParameter("date"));
        List<String> peopleList = new ArrayList<>();
        List<String> allergyList = new ArrayList<>();
        for (int i = 1; i <= room; i++) {
            String people = request.getParameter("people" + i);  // "people1", "people2", ...
            String allergy = request.getParameter("allergy" + i);  // "allergy1", "allergy2", ...
            peopleList.add(people);
            allergyList.add(allergy);
        }
		Calendar calendar = Calendar.getInstance();
		Timestamp reservetime = (Timestamp)calendar.getTime();
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
        String password = pdao.generatePassword();
        r.setPlanNo(planNum);
        r.setPassword(password);
        r.setLodgmentDays(date);
        Date startDate =null ;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			startDate = (Date) sdf.parse(request.getParameter("startDate"));
		} catch (ParseException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}        
        r.setLodgmentStartDate(startDate);
        ReservationDao dao = new ReservationDao();
        dao.addReservation(r);
        for (int i = 0; i < room; i++) {
            String people = peopleList.get(i);
            String allergy = allergyList.get(i);
            String rstr = String.format("%02d", room);
            dao.addLodgmentInfo(rstr, people, allergy);  // ここで部屋ごとに人数とアレルギーを保存
        }

        String to = r.getEmailAddress();
		String subject = request.getParameter("キャンセルお手続きが完了しました");
		String planNo=r.getPlanNo();
		Plan plan = new Plan();
		PlanDao d = new PlanDao();
		plan = d.findPlanByPlanNo(planNo);
		ArrayList<LodgmentInformation> list = new ArrayList<>();
		ReservationDao dao2 = new ReservationDao();
		list=dao2.findLodgment(planNo);
		int i = 0;
		for(LodgmentInformation l: list) {
			i+=l.getLodgmentCount();
		}
		LocalDate now=LocalDate.now();
		Date date1=r.getLodgmentStartDate();
		LocalDate reserveDay = date1.toInstant().atZone(ZoneId.of("Asia/Tokyo")).toLocalDate();
		LocalDate no = reserveDay.plusDays(8);
		long daysBetween = ChronoUnit.DAYS.between(no, now);
		int day = (int)daysBetween;
		int cancelFee = 0;
		if(day >= 8) {
			cancelFee=0;
		}else if(4 <= day && day <= 7){
			cancelFee = plan.getFee()/5;
		}else if(day == 3) {
			cancelFee = plan.getFee()/2;
		}else if(1 <= day && day <= 2) {
			cancelFee = plan.getFee()/10*8;
		}else if(day == 0) {
			cancelFee=plan.getFee();
		}
		cancelFee *= i;
		String body = r.getCustomerName() + "様、以下の内容でご予約致しました\n";
		body += "宿泊日："+r.getLodgmentStartDate()+"("+r.getLodgmentDays()+"泊)\n";
		body += "人数："+i+"\n";
		body += "部屋数："+r.getTotalReservationRoom()+"\n";
		body += "プラン名："+plan.getPlanName()+"\n";
		body += "料金："+plan.getFee()+"\n";
		body += "支払い口座はこちら\n";
		body += "キャンセル料："+cancelFee+"円";
		body += "ゆうちょ銀行　銀座支店　普通　123456789011\n";
		body += "\r\n問い合わせ先";
		body += "日電旅館　株式会社　千景\n";
		body += "TEL：03-3363-7761\n";
		body += "FAX：03-3363-7761\n";
		body += "mail：info@tikage.jp\n";
		this.send(from, to, subject, body);
		RequestDispatcher rd = request.getRequestDispatcher("reserve3.jsp");
		rd.forward(request, response);
	}

	
	private void send(String from, String to, String subject, String body) {
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		
		Session session = Session.getInstance(props, null);
		session.setDebug(false);
		
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			InternetAddress[] address = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new Date(0));
			msg.setText(body);
			
			Transport.send(msg);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}


}
