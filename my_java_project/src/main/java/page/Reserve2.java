package page;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Reserve2")
public class Reserve2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String lastKana = request.getParameter("lastKana");
        String firstKana = request.getParameter("firstKana");
        String email = request.getParameter("email");
        String postalCode = request.getParameter("postalCode");
        String prefecture = request.getParameter("prefecture");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String building = request.getParameter("building");
        String allergy = request.getParameter("allergy");
		/*        String reserverLastName = request.getParameter("reserverLastName");
		String reserverFirstName = request.getParameter("reserverFirstName");
		String reserverLastKana = request.getParameter("reserverLastKana");
		String reserverFirstKana = request.getParameter("reserverFirstKana");
		String reserverEmail = request.getParameter("reserverEmail");
		String reserverPhone = request.getParameter("reserverPhone");*/
        ArrayList<String> info = new ArrayList<>();
        info.add(lastName);
        info.add(firstName);
        info.add(lastKana);
        info.add(firstKana);
        info.add(email);
        info.add(postalCode);
        info.add(prefecture);
        info.add(phone);
        info.add(address);
        info.add(building);
        info.add(allergy);
		/*        info.add(reserverLastName);
		info.add(reserverFirstName);
		info.add(reserverLastKana);
		info.add(reserverFirstKana);
		info.add(reserverEmail);
		info.add(reserverPhone);*/
		HttpSession session = request.getSession();
		session.setAttribute("info",info);
        RequestDispatcher rd = request.getRequestDispatcher("reserve2.jsp");
        rd.forward(request, response);
    }
}
