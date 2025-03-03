package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Announcement;


public class AnnouncementDao {
	private Connection con = null;

	public AnnouncementDao() {
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

	public ArrayList<Announcement> findAllAnnouncement() {
		ArrayList<Announcement> ar = new ArrayList<>();
		String sql = "select * from announcement";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 Announcement a = new Announcement(); 
				 a.setAnnouncementNo(rs.getString("announcement_number"));
				 a.setTitle(rs.getString("title"));
				 a.setBody(rs.getString("body"));
				 a.setAnnouncementImage(rs.getString("announcement_image"));
				 a.setDate(rs.getDate("date"));

				 ar.add(a);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public Announcement findAnnouncement(String no) {
		Announcement a = new Announcement();
		String sql = "select * from announcement where announcement_number = " + no;
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {

				a.setAnnouncementNo(rs.getString("announcement_number"));
				a.setBody(rs.getString("body"));
				a.setTitle(rs.getString("title"));
				a.setAnnouncementImage(rs.getString("announcement_image"));
				a.setDate(rs.getDate("date"));

			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return a;
	}
	
//	public Room findRoomById(int id) { 
//		 Room ml = new Room(); 
//		 String sql = "select * from Room where NO = ?"; 
//		 try { 
//		 PreparedStatement state = con.prepareStatement(sql); 
//		 state.setInt(1, id); //メソッドの引数で受け取った id を?にセット
//		 ResultSet rs = state.executeQuery(); 
//		 rs.next(); //1 件のみの結果なので 1 つだけカーソルを進める
//		 ml.setNo(rs.getInt("NO")); //取り出したデータを Room オブジェクトにセット 
//		 ml.setName(rs.getString("name")); 
//		 ml.setDescription(rs.getString("description")); 
//		 ml.setPrice(rs.getInt("price")); 
//		 ml.setImage(rs.getString("image")); 
//		 } catch (SQLException e) { 
//		 e.printStackTrace();
//		 } 
//		 return ml; 
//		 } 
//	public void addRoom(Room ml){
//		String sql = "insert into Room values(?,?,?,?,?)";
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
//		String sql = "select max(NO) from Room";
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