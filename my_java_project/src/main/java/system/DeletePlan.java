package system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlanDao;

/**
 * Servlet implementation class SubmitPlan
 */
@WebServlet("/DeletePlan")
public class DeletePlan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlanDao pdao = new PlanDao();
		String pno =request.getParameter("state");
		
		int result = pdao.deletePlan(pno);
		
		if(result==0) {
			request.setAttribute("flag", "3");
		}else {
			request.setAttribute("flag", "1");
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submitplan.jsp");
		rd.forward(request, response);
	}
}