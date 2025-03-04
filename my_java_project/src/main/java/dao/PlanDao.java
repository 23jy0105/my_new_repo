package dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;

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
	public Plan findPlanByPlanNo(String No) {
		Plan p = new Plan();
		String sql = "select * from Plan where plan_number = "+No;
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
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
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return p;
	}
	
	public ArrayList<Plan> searchPlan(String planNo){
		ArrayList<Plan> ar = new ArrayList<>();
		String sql ="select plan_name,plan_fee from plan";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) {
				Plan p = new Plan();
				p.setPlanName(rs.getString("plan_name"));
				p.setFee(rs.getInt("plan_fee"));
				ar.add(p);
				
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<Plan> searchPlan(int day, int people, int room, String nowDate) {
	    ArrayList<Plan> ar = new ArrayList<>();

	    // `day` 日分の `LEFT JOIN` を動的に作成
	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT ")
	       .append("    p.plan_number, ")
	       .append("    p.plan_name, ")
	       .append("    p.plan_fee, ")
	       .append("    p.plan_image, ")
	       .append("    p.plan_overview, ")
	       .append("    p.plan_description, ")
	       .append("    p.room_type_number ")
	       .append("FROM plan AS p ")
	       .append("INNER JOIN room_type AS r ON p.room_type_number = r.room_type_number ");

	    // `day` 日分の予約状況を `LEFT JOIN` で取得
	    for (int i = 0; i < day; i++) {
	        sql.append("LEFT JOIN ( ")
	           .append("    SELECT room_type_number, DATE, SUM(reserved_room_number) AS total_booked ")
	           .append("    FROM room_remaining_count ")
	           .append("    WHERE DATE = ? ")
	           .append("    GROUP BY room_type_number, DATE ")
	           .append(") AS res").append(i)
	           .append(" ON p.room_type_number = res").append(i).append(".room_type_number ");
	    }

	    sql.append("WHERE ")
	       .append("    ? >= p.plan_start_date ") // プランの開始日
	       .append("    AND ? <= p.plan_end_date ") // プランの終了日
	       .append("    AND ? <= r.max_accommodation_count ") // 人数制限
	       .append("    AND (r.total_room_count - COALESCE(res0.total_booked, 0)) >= ? "); // 1日目の空室チェック

	    // `day` 日分の空室チェックを追加
	    for (int i = 1; i < day; i++) {
	        sql.append("AND (r.total_room_count - COALESCE(res").append(i).append(".total_booked, 0)) >= ? ");
	    }

	    try (PreparedStatement state = con.prepareStatement(sql.toString())) {
	        Calendar calendar = Calendar.getInstance();
	        // `day` 日分の `date` をセット
	        for (int i = 0; i < day; i++) {
	            state.setDate(i + 1, new Date(calendar.getTimeInMillis()));
	            calendar.add(Calendar.DATE, 1);
	        }

	        // WHERE 句のパラメータをセット
	        int paramIndex = day + 1;
	        // `nowDate` をDate型に変換して設定する
	        state.setDate(paramIndex++, Date.valueOf(nowDate)); // `nowDate` がString型の日付なら `Date.valueOf(nowDate)` を使用
	        state.setDate(paramIndex++, Date.valueOf(nowDate));
	        state.setInt(paramIndex++, people);

	        // `day` 日分の空室数チェックをセット
	        for (int i = 0; i < day; i++) {
	            state.setInt(paramIndex++, room);
	        }

	        ResultSet rs = state.executeQuery();
			       while (rs.next()) {
			    Plan p = new Plan();
			    p.setPlanNo(rs.getString("plan_number"));
			    p.setPlanName(rs.getString("plan_name"));
			    p.setFee(rs.getInt("plan_fee"));
			    p.setPlanImage(rs.getString("plan_image"));
			    p.setPlanOverview(rs.getString("plan_overview"));
			    p.setPlanDescription(rs.getString("plan_description"));
			    ar.add(p);
			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ar;
	}
	public ArrayList<Plan> searchPlan(int day,int people,int room,String date,String nowDate) {
		ArrayList<Plan> ar = new ArrayList<>();
		String sql = "SELECT \r\n"
				+ "    p.plan_number, \r\n"
				+ "    p.plan_name, \r\n"
				+ "    p.plan_fee, \r\n"
				+ "    p.plan_image, \r\n"
				+ "    p.plan_overview, \r\n"
				+ "    p.plan_description, \r\n"
				+ "    p.room_type_number\r\n"
				+ "FROM plan AS p\r\n"
				+ "INNER JOIN room_type AS r ON p.room_type_number = r.room_type_number\r\n"
				+ "LEFT JOIN (\r\n"
				+ "    -- 2/25 の予約済み部屋数を集計\r\n"
				+ "    SELECT room_type_number, DATE, SUM(reserved_room_number) AS total_booked\r\n"
				+ "    FROM room_remaining_count\r\n"
				+ "    WHERE DATE BETWEEN ? AND ?\r\n"
				+ "    GROUP BY room_type_number, DATE\r\n"
				+ ") AS res1 ON p.room_type_number = res1.room_type_number AND res1.DATE = ?\r\n"
				+ "LEFT JOIN (\r\n"
				+ "    -- 2/26 の予約済み部屋数を集計\r\n"
				+ "    SELECT room_type_number, DATE, SUM(reserved_room_number) AS total_booked\r\n"
				+ "    FROM room_remaining_count\r\n"
				+ "    WHERE DATE BETWEEN ? AND ?\r\n"
				+ "    GROUP BY room_type_number, DATE\r\n"
				+ ") AS res2 ON p.room_type_number = res2.room_type_number AND res2.DATE = ?\r\n"
				+ "WHERE \r\n"
				+ "    -- プランの有効期限チェック\r\n"
				+ "    ? >= p.plan_start_date \r\n"
				+ "    AND ? <= p.plan_end_date \r\n"
				+ "    AND ? <= r.max_accommodation_count  \r\n"
				+ "    AND (r.total_room_count - COALESCE(res1.total_booked, 0)) >= ?\r\n"
				+ "    AND (r.total_room_count - COALESCE(res2.total_booked, 0)) >= ?";
		
		PreparedStatement state;
		try {
			state = con.prepareStatement(sql);
			LocalDate sqlLocalDate = LocalDate.parse(date); // String → LocalDate
			LocalDate nextLocalDate = sqlLocalDate.plusDays(day - 1);
			Date sqlDate = Date.valueOf(sqlLocalDate);
			Date nextdate = Date.valueOf(nextLocalDate);
				state.setDate(1,sqlDate);
				state.setDate(2,nextdate);
				state.setDate(3,sqlDate);
				state.setDate(4, sqlDate);
				state.setDate(5,nextdate);
				state.setDate(6, nextdate);
				state.setString(7, nowDate);
				state.setString(8,nowDate);
				state.setInt(9, people);
				state.setInt(10, room);
				state.setInt(11, room);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Plan p = new Plan(); 
				 p.setPlanNo(rs.getString("plan_number")); 
				 p.setPlanName(rs.getString("plan_name")); 
				 p.setFee(rs.getInt("plan_fee"));
				 p.setPlanImage(rs.getString("plan_image"));
				 p.setPlanOverview(rs.getString("plan_overview"));
				 p.setPlanDescription(rs.getString("plan_description"));

				 ar.add(p);
			}
		
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
		
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