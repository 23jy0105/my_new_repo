package page;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlanDao;
import model.Plan;
@WebServlet("/Search")
public class Search extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		/*		int day = 0; 
				int people = 0;
				Date date = null;
				try {
				    day = Integer.parseInt(request.getParameter("day"));
				    people = Integer.parseInt(request.getParameter("people"));
				} catch (NumberFormatException e) {
				    // エラー処理（例: ユーザーにエラーメッセージを表示する）
				}
				String dateStr = request.getParameter("date");
				try {
				    date = Date.valueOf(dateStr);
				} catch (IllegalArgumentException e) {
				    // エラー処理（例: ユーザーにエラーメッセージを表示する）
				}*/
		PlanDao dao = new PlanDao();
		ArrayList<Plan> plans = dao.searchPlan();
		dao.connectionClose();
		request.setAttribute("plans",plans);
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
		rd.forward(request, response);
	}
};