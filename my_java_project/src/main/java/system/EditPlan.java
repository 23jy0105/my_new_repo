package system;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Meal;
import model.Plan;

/**
 * Servlet implementation class EditPlan
 */
@WebServlet("/EditPlan")
public class EditPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		PlanDao pdao = new PlanDao();
//		Plan plan = pdao.findPlan(request.getParameter("no"));
//		ArrayList<Meal> meal = pdao.findAllMeal();
//		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

	    // アップロード先ディレクトリが存在しない場合は作成する
//	    File uploadDir = new File(",/image");
//	    if (!uploadDir.exists()) {
//	      uploadDir.mkdir();
//	    }
//
//	    // ファイルアップロードの準備
//	    if (ServletFileUpload.isMultipartContent(request)) {
//	      DiskFileItemFactory factory = new DiskFileItemFactory();
//	      ServletFileUpload upload = new ServletFileUpload(factory);
//
//	      try {
//	        // フォームから送られたファイルを取得
//	        List<FileItem> formItems = upload.parseRequest(request);
//
//	        for (FileItem item : formItems) {
//	          if (!item.isFormField()) {
//	            // ファイルのアップロード処理
//	            String fileName = new File(item.getName()).getName();
//	            String filePath = uploadPath + File.separator + fileName;
//
//	            // アップロードされたファイルを保存
//	            File storeFile = new File(filePath);
//	            item.write(storeFile);
//	          }
//	        }
//	      }catch(Exception e) {
//	    	  
//	      }
//	    }
		
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Plan plan = new Plan("01","name","1","aa","overiew","desc",2000,time,time,"101");
		
		Meal m = new Meal("101","meal","","aa");
		
		ArrayList<Meal> meal = new ArrayList<Meal>();
		meal.add(m);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("plan", plan);
		session.setAttribute("meallist", meal);
		
		response.sendRedirect("system/jsp/editplan");
	}
}
