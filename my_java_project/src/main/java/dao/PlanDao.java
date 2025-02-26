package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Meal;
import model.Plan;

public class PlanDao {
	private Connection con = null;

	public PlanDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://10.64.144.5:3306/23jya06?characterEncoding=UTF-8",
					"23jya06", "23jya06");
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}

	}

	public void connectionClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Meal> findAllMeal() {
		ArrayList<Meal> ar = new ArrayList<>();
		String sql = "select * from Meal";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Meal ml = new Meal(); 
				 ml.setMealNo(rs.getString("meal_number")); 
				 ml.setMealName(rs.getString("meal_name")); 
				 ml.setAllergen(rs.getString("allergen")); 
				 ml.setMealImage(rs.getString("meal_image")); 

				 ar.add(ml);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<Plan> findAllPlan() {
		ArrayList<Plan> ar = new ArrayList<>();
		String sql = "select * from Plan";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Plan p = new Plan(); 
				 p.setPlanNo(rs.getString("plan_number")); 
				 p.setPlanName(rs.getString("plan_name")); 
				 p.setRoomTypeNo(rs.getString("room_type_number")); 
				 p.setMealNo(rs.getString("meal_number"));
				 p.setFee(rs.getInt("plan_fee"));
				 p.setPlanImage(rs.getString("plan_image"));
				 p.setPlanOverview(rs.getString("plan_overview"));
				 p.setPlanDescription(rs.getString("plan_description"));
				 p.setStartTime(rs.getTimestamp("plan_start_date"));
				 p.setEndTime(rs.getTimestamp("plan_end_date"));

				 ar.add(p);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	public ArrayList<Plan> searchPlan() {
		ArrayList<Plan> ar = new ArrayList<>();
		String sql = "SELECT plan_number,plan_name,plan_fee,plan_image,plan_overview,plan_description,date\r\n"
				+ "FROM plan inner join room_type ON plan.room_type_number=room_type.room_type_number \r\n"
				+ "INNER JOIN room_remaining_count ON plan.room_type_number=room_remaining_count.room_type_number\r\n"
				+ "WHERE'2025-02-25 00:00:00' >= plan_start_date AND '2025-02-25 00:00:00' <= plan_end_date #プラン有効期限\r\n"
				+ "AND DATE between'2025-02-25 00:00:00' AND '2025-02-26 00:00:00' #日付確認\r\n"
				+ "AND 2 <= max_accommodation_count #人数\r\n"
				+ "GROUP BY date, plan_number, plan_name, plan_fee, plan_image, \r\n"
				+ "         plan_overview, plan_description\r\n"
				+ "HAVING SUM(total_room_count - reserved_room_number) >= 1#残数";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Plan p = new Plan(); 
				 p.setPlanNo(rs.getString("plan_number")); 
				 p.setPlanName(rs.getString("plan_name")); 
				 p.setFee(rs.getInt("plan_fee"));
				 p.setPlanImage(rs.getString("plan_image"));
				 p.setPlanOverview(rs.getString("plan_overview"));
				 p.setPlanDescription(rs.getString("plan_description"));
				 p.setDate(rs.getDate("date"));

				 ar.add(p);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
//	public Meal findMealById(int id) { 
//		 Meal ml = new Meal(); 
//		 String sql = "select * from Meal where NO = ?"; 
//		 try { 
//		 PreparedStatement state = con.prepareStatement(sql); 
//		 state.setInt(1, id); //メソッドの引数で受け取った id を?にセット
//		 ResultSet rs = state.executeQuery(); 
//		 rs.next(); //1 件のみの結果なので 1 つだけカーソルを進める
//		 ml.setNo(rs.getInt("NO")); //取り出したデータを Meal オブジェクトにセット 
//		 ml.setName(rs.getString("name")); 
//		 ml.setDescription(rs.getString("description")); 
//		 ml.setPrice(rs.getInt("price")); 
//		 ml.setImage(rs.getString("image")); 
//		 } catch (SQLException e) { 
//		 e.printStackTrace();
//		 } 
//		 return ml; 
//		 } 
//	public void addMeal(Meal ml){
//		String sql = "insert into Meal values(?,?,?,?,?)";
//		int no  = nextNo();
//		
//		try {
//			PreparedStatement state = con.prepareStatement(sql);
//			
//			state.setInt(1,no);
//			state.setString(2, ml.getName());
//			state.setString(3,ml.getDescription());
//			state.setInt(4, ml.getPrice());
//			state.setString(5,ml.getImage());
//			
//			state.executeUpdate();
//		} catch (SQLException e) {
//			// TODO 自動生成された catch ブロック
//			e.printStackTrace();
//		}
//		
//		
//	}
//	
//	public int nextNo() {
//		String sql = "select max(NO) from Meal";
//		int no = 0;
//		try {
//			 PreparedStatement state = con.prepareStatement(sql);
//			 ResultSet rs = state.executeQuery(); 
//			 rs.next();
//			 no = rs.getInt(1)+1;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return no;
//	}
}