package page;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

		 int day = Integer.parseInt(request.getParameter("stay-days"));
   	     int people = Integer.parseInt(request.getParameter("people-count"));
   	     int room = Integer.parseInt(request.getParameter("room-count"));
	     String date = request.getParameter("date-picker");
	     Calendar calendar = Calendar.getInstance();
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	     String nowDate = sdf.format(calendar.getTime());
		 PlanDao dao = new PlanDao();
		 ArrayList<Plan> plans = null;

			// 日付が指定されている場合と指定されていない場合の処理
			if (date != null) {
				plans = dao.searchPlan(day, people, room, date, nowDate);
			} else {
				plans = dao.searchPlan(day, people, room, nowDate);
			}

			// 重複を取り除くための処理
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

			// リクエストにユニークなプランを設定
			request.setAttribute("plans", uniquePlans);

			// JSPにフォワード
			RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
			rd.forward(request, response);
		}
	}
