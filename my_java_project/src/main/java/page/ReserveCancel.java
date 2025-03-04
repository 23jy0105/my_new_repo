package page;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
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
import javax.servlet.http.HttpSession;

import dao.PlanDao;
import dao.ReservationDao;
import dao.RoomDao;
import model.LodgmentInformation;
import model.Plan;
import model.Reservation;
@WebServlet("/ReserveCancel")
public class ReserveCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String from = "23jy0129@jec.ac.jp";
	private final String host = "10.64.144.9";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Reservation reserve = (Reservation)session.getAttribute("reserve");
		RoomDao roomDao = new RoomDao();
		PlanDao planDao = new PlanDao();
		ReservationDao reserveDao = new ReservationDao();
		reserveDao.setCancelDate(reserve);
		roomDao.setRoomCountNumber(false,reserve);
		session.removeAttribute(null);
		String to = reserve.getEmailAddress();
		String subject = request.getParameter("キャンセルお手続きが完了しました");
		String planNo=reserve.getPlanNo();
		Plan plan = new Plan();
		plan=planDao.findPlanByPlanNo(planNo);
		ArrayList<LodgmentInformation> list = new ArrayList<>();
		list=reserveDao.findLodgment(planNo);
		int i = 0;
		for(LodgmentInformation l: list) {
			i+=l.getLodgmentCount();
		}
		LocalDate now=LocalDate.now();
		Date date=reserve.getLodgmentStartDate();
		LocalDate reserveDay = date.toInstant().atZone(ZoneId.of("Asia/Tokyo")).toLocalDate();
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
		String body = reserve.getCustomerName() + "様、以下のご予約をキャンセルいたしました\n";
		body += "宿泊日："+reserve.getLodgmentStartDate()+"("+reserve.getLodgmentDays()+"拍)\n";
		body += "人数："+i+"\n";
		body += "部屋数："+reserve.getTotalReservationRoom()+"\n";
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
		
		// HTML出力
		RequestDispatcher dispatcher=request.getRequestDispatcher("cancelCheck.jsp");
		dispatcher.forward(request,response);
		
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
			msg.setSentDate(new Date());
			msg.setText(body);
			
			Transport.send(msg);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}

