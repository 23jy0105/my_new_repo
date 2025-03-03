package page;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import model.Reservation;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
		public void doGet (HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
			{
		    request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationDao dao = new ReservationDao();
		Reservation reserve = new Reservation();
	    // ユーザーから送信されたユーザーIDとパスワードを取得する。
	    String userId = request.getParameter("reservation-number");
	    String password = request.getParameter("password");

	    // ログイン認証後に遷移する先を格納する
	    String path = "";
	    reserve = dao.findReservationbyPass(userId,password);
	   
	    //QRCodeWriter qrCodeWriter = new QRCodeWriter();
        //try {
            //BitMatrix bitMatrix = qrCodeWriter.encode(userId, BarcodeFormat.QR_CODE, 300, 300);
            //response.setContentType("image/png");
            //request.setAttribute("qrcode",bitMatrix);
        //} catch (WriterException e) {
            //e.printStackTrace();
        //}
	            	HttpSession session = request.getSession();
	            	session.setAttribute("reserve", reserve);
	            	
	            	if(Objects.isNull(reserve.getReservationNo())) {
	            		path = "Login.jsp";
	            	}else {
	            		 path = "cus_info.jsp";
	            	}

	                // ログイン失敗の文言を追加する
	                request.setAttribute("loginFailure", "ログインに失敗しました");

	                // ログインに失敗したときはもう一度ログイン画面を表示する
	                


	    RequestDispatcher rd = request.getRequestDispatcher(path);
	    rd.forward(request, response);
	}

}

