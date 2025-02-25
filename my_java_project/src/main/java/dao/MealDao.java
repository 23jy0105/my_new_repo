package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Meal;

public class MealDao {
	private Connection con = null;

	public MealDao() {
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

	public ArrayList<Meal> findAll() {
		ArrayList<Meal> ar = new ArrayList<>();
		String sql = "select * from Meal";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Meal ml = new Meal(); 
				 ml.setMealNo(rs.getString("NO")); 
				 ml.setMealName(rs.getString("name")); 
				 ml.setAllergen(rs.getString("allergen")); 
				 ml.setMealImage(rs.getString("image")); 

				 ar.add(ml);
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