package system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlanDao;

/**
 * Servlet implementation class SubmitPlan
 */
@WebServlet("/DeleteMeal")
public class DeleteMeal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlanDao pdao = new PlanDao();
		HttpSession session = request.getSession();
		String mno =request.getParameter("state");
		
		int result =  pdao.deleteMeal(mno);
		
		if(result==0) {
		request.setAttribute("flag", "3");
		}else {
			request.setAttribute("flag", "1");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("./system/jsp/submitmeal.jsp");
		rd.forward(request, response);
	}
}