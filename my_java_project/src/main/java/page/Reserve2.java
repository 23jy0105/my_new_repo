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

import dao.PlanDao;
import model.Plan;
import model.ReservationInfo;

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
        String people = request.getParameter("people");
        String room = request.getParameter("room");
        String planNum = request.getParameter("planNum");
        String date = request.getParameter("date");
        ReservationInfo ri = new ReservationInfo();
		HttpSession session = request.getSession();
		ri.setLastName(lastName);
		ri.setFirstName(firstName);
		ri.setLastKana(lastKana);
		ri.setFirstKana(firstKana);
		ri.setEmail(email);
		ri.setPostalCode(postalCode);
		ri.setPrefecture(prefecture);
		ri.setPhone(phone);
		ri.setAddress(address);
		ri.setBuilding(building);
		ri.setAllergy(allergy);
		ri.setPeople()
		
		session.setAttribute("info",ri);
		PlanDao dao = new PlanDao();
		ArrayList<Plan> plan = null;
		plan = dao.searchPlan(planNum);
		session.setAttribute("plan",plan);
        RequestDispatcher rd = request.getRequestDispatcher("reserve2.jsp");
        rd.forward(request, response);
    }
}
