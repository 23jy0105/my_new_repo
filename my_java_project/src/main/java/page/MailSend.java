package page;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailSend
 */
@WebServlet("/MailSend")
public class MailSend extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	private final String from = "21jygrxx@jynet.jec.ac.jp";	// システムの送信元メールアドレス
//	private final String host = "10.64.144.xx";				// メールサーバのIPアドレス（@161）
//	private final String from = "21jygrxx@jynet2.jec.ac.jp"; // システムの送信元メールアドレス
//	private final String host = "10.42.129.3";					// メールサーバのIPアドレス（@1252）
//	private final String host = "localhost";

	private final String from = "23jy0129@jec.ac.jp";
	private final String host = "10.64.144.9";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		
		String body = "こんにちわ、" + to + "様\n";
		body += request.getParameter("body");
		body += "\r\n23jy0129より";
		
		// メール送信
		this.send(from, to, subject, body);
		
		// HTML出力
		this.disp(request, response);
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
	
	private void disp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
