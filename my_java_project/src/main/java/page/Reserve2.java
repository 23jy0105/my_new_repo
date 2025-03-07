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
        HttpSession session = request.getSession();
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
        String people = request.getParameter("people");
        String stayDays =request.getParameter("stayDays");
        int room = Integer.parseInt(request.getParameter("room"));
        ArrayList<String> roomCount = new ArrayList<>();
        ArrayList<String> allergyCount = new ArrayList<>();      
        if(room==1) {
        	roomCount.add(people);
        	allergyCount.add(request.getParameter("roomAllergy1"));
        	
        }else {

        	for(int i=1;i<=room;i++) {
        		roomCount.add(request.getParameter("roomPeople"+String.valueOf(i)));
        		allergyCount.add(request.getParameter("roomAllergy"+String.valueOf(i)));
        	}
        }
        String planNum = request.getParameter("planNum");
        ReservationInfo ri = (ReservationInfo)session.getAttribute("searchInfo");
        String startdate = ri.getStartDate();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        String strstart = sdf.format(startdate);
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
		ri.setPeople(Integer.parseInt(people));
		ri.setRoom(room);
		ri.setStartDate(startdate);
		ri.setStayDays(Integer.parseInt(stayDays));
		ri.setPlanNum(planNum);
		session.setAttribute("info",ri);
		PlanDao dao = new PlanDao();
		ArrayList<Plan> plan = null;
		plan = dao.searchPlan(planNum);
		session.setAttribute("plan",plan);
		session.setAttribute("roomCount", roomCount);
		session.setAttribute("allergyCount",allergyCount);
		session.setAttribute("startDate", startdate);
        RequestDispatcher rd = request.getRequestDispatcher("reserve2.jsp");
        rd.forward(request, response);
    }
}