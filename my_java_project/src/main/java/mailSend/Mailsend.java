package mailSend;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import model.Reservation;

public class Mailsend {
	private final String from = "23jy0129@jec.ac.jp";
	private final String host = "10.64.144.9";

//		String combinedString = reserveNo + currentTime;
//		MessageDigest digest = MessageDigest.getInstance("SHA-256");
//		byte[] hashBytes = digest.digest(combinedString.getBytes());
//		StringBuilder hexString = new StringBuilder();
//		for (byte b : hashBytes) {
//			 hexString.append(String.format("%02x", b));
//		}
//		String hex = hexString.toString();
//		reserve.setPassword(hex);
//		String body = "ご予約完了致しました。詳細はWebサイトからご確認ください。\r\n";
//		body += "予約番号："+reserveNo+"\r\n";
//		body += "パスワード："+reserve.getPassword()+"\r\n";
//		body += "料金："+fee+"\r\n";
//		body += "\r\n問い合わせ先";
//		body += "日電旅館　株式会社　千景\n";
//		body += "TEL：03-3363-7761\n";
//		body += "FAX：03-3363-7761\n";
//		body += "mail：info@tikage.jp\n";
//		this.send(to, subject, body);
	
	public void  reservesend(String mailaddress,String pnum) {
		String to = mailaddress;
		String subject = "ご予約完了";
		String planNo = pnum;
		Plan plan = new Plan();
		PlanDao d = new PlanDao();
		plan = d.findPlanByPlanNo(pnum);
		ArrayList<LodgmentInformation> info = new ArrayList<>(); 
		ReservationDao dao2 = new ReservationDao();
		Reservation r = dao2.findReservation(pnum);
		int people = 0;
		for(LodgmentInformation i:info) {
			people+=i.getLodgmentCount();
		}
		String reserveNo = r.getReservationNo();
		int fee = people*plan.getFee()*r.getLodgmentDays();
		String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		String combinedString = reserveNo + currentTime;
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		byte[] hashBytes = digest.digest(combinedString.getBytes());
		StringBuilder hexString = new StringBuilder();
		for(byte b : hashBytes) {
			hexString.append(String.format("%02x", b));
		}
		String hex = hexString.toString();
		String body ="ご予約完了致しました。詳細はWebサイトからご確認ください。\r\n";
		body +="予約番号："+reserveNo+"\r\n";
		body +="パスワード："+r.getPassword()+"\r\n";
		body +="料金："+fee+"\r\n";
		body +="\r\n問い合わせ先";
		body +="日電旅館　株式会社　千景\n";
		body += "TEL:03-3363-7761\n";
		body += "FAX：03-3363-7761\n";
		body += "mail：info@tikage.jp\n";
		this.send(to, subject, body);
	}

	


	private void send(String to, String subject, String body) {
	
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