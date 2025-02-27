package page;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlanDao;
import model.Plan;

/**
 * Servlet implementation class SearchResult
 */
@WebServlet("/SearchResult")
public class SearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 	
							try {
								   int day = Integer.parseInt(request.getParameter("stay-days"));
								   int people = Integer.parseInt(request.getParameter("people-count"));
								} catch (NumberFormatException e) {
								    System.out.println("日付と人数にエラーが発生しました。");
								}
							
							Date date = null;
							String dateStr = request.getParameter("date-picker");
				
							if (dateStr != null && !dateStr.isEmpty()) {
							    try {
							        date = Date.valueOf(dateStr);
							    } catch (IllegalArgumentException e) {
							        System.out.println("エラー２: 日付変換に失敗");
							    }
							}
		PlanDao dao = new PlanDao();
		ArrayList<Plan> plans = dao.searchPlan();
				Set<String> seenKeys = new HashSet<>();    
				ArrayList<Plan> uniquePlans = new ArrayList<>();
				if (plans != null) {
			for (Plan plan : plans) {
				       if (!seenKeys.contains(plan.getPlanNo())) {  // 重複しない場合
				           seenKeys.add(plan.getPlanNo());  // 重複を防ぐ
				           uniquePlans.add(plan);  // uniqueなplanを追加
					   }
					}
				}
		request.setAttribute("plans", plans);
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
		rd.forward(request, response);

	}
}
