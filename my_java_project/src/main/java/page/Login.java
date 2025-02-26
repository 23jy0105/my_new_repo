package page;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
		public void doGet (HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
			{
		    request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    // ユーザーから送信されたユーザーIDとパスワードを取得する。
	    String userId = request.getParameter("reservation-number");
	    String password = request.getParameter("password");

	    // ログイン認証後に遷移する先を格納する
	    String path = "";

	    try {
	        // PostgreSQLに接続するためのURL
	        String url = "jdbc:mysql://10.64.144.5:3306/23jya06";
	        String user = "23jya06";
	        String pass = "23jya06";
	        /*
	         * 実行するSQL
	         * idとpasswordが一致するユーザーのidをとってくる
	         */
	        String sql = "SELECT reservation_number FROM reservation WHERE reservation_number=? AND password=?";
	        Class.forName("com.mysql.jdbc.Driver");
	        try (Connection con = DriverManager.getConnection(url, user, pass);
	                PreparedStatement pstmt = con.prepareStatement(sql)) {

	            // 入力されたユーザーIDとパスワードをSQLの条件にする
	            pstmt.setString(1, userId);
	            pstmt.setString(2, password);

	            // SQLの実行
	            ResultSet res = pstmt.executeQuery();

	            // ユーザーIDとパスワードが一致するユーザーが存在した時
	            if (res.next()) {
	                // user_idをリクエストスコープに設定する
	                request.setAttribute("userid", res.getString("reservation_number"));

	                // ログイン成功画面に遷移する
	                path = "res-check.jsp";
	            } else {
	                // ログイン失敗の文言を追加する
	                request.setAttribute("loginFailure", "ログインに失敗しました");

	                // ログインに失敗したときはもう一度ログイン画面を表示する
	                path = "Login.jsp";
	            }
	        }
	    }catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

	    RequestDispatcher rd = request.getRequestDispatcher(path);
	    rd.forward(request, response);
	}

}

