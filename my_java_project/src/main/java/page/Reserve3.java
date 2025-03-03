package page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reserve3
 */
@WebServlet("/Reserve3")
public class Reserve3 extends HttpServlet {
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
        String people = request.getParameter("people");
        String room = request.getParameter("room");
        String allergy = request.getParameter("allergy");
        String planNumber = request.getParameter("planNumber");
		
        
		RequestDispatcher rd = request.getRequestDispatcher("reserve3.jsp");
		rd.forward(request, response);
}

}
