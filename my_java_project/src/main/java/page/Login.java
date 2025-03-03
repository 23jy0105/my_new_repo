package page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;
import dao.ReservationDao;
import model.Plan;
import model.Reservation;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
		public void doGet (HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
			{
		    request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationDao dao1 = new ReservationDao();
		PlanDao dao2 = new PlanDao();
		Reservation reserve = new Reservation();
		Plan plan = new Plan();
		
	    String userId = request.getParameter("reservation-number");
	    String password = request.getParameter("password");
	    
	    
	    String path = "";
	    reserve = dao1.findReservationbyPass(userId,password);
	    String planNo=reserve.getPlanNo();
	    plan = dao2.findPlanByPlanNo(planNo);
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
	            	session.setAttribute("plan", plan);
	            	System.out.println(planNo);
	            	System.out.println(userId);
	            	System.out.println(reserve.getReservationNo());
	            	if(userId.equals(reserve.getReservationNo())) {
	            		path = "cus_info.jsp";
	            	}else {
	            		 path = "Login.jsp";
	            	}

	                // ログイン失敗の文言を追加する
	                request.setAttribute("loginFailure", "ログインに失敗しました");

	                // ログインに失敗したときはもう一度ログイン画面を表示する
	                


	    RequestDispatcher rd = request.getRequestDispatcher(path);
	    rd.forward(request, response);
	}

}
