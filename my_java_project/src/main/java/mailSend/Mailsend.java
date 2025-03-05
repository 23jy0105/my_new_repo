package mailSend;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dao.PlanDao;
import dao.ReservationDao;
import model.LodgmentInformation;
import model.Plan;

public class Mailsend {
	
	public Mailsend() {
	    String to = r.getEmailAddress();
		String subject = request.getParameter("予約完了メール");
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
		body += "部屋数："+r.getTotalReservationRoom()+"\r\n";
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
