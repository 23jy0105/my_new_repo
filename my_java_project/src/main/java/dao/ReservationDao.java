package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.LodgmentInformation;
import model.Reservation;


public class ReservationDao {
	private Connection con = null;

	public ReservationDao() {
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

	public ArrayList<Reservation> findAllReservation() {
		ArrayList<Reservation> ar = new ArrayList<>();
		String sql = "select * from reservation";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 Reservation r = new Reservation(); 
				 
				 r.setReservationNo(rs.getString("reservation_number"));
				 r.setLodgmentStartDate(rs.getDate("lodgment_start_date"));
				 r.setLodgmentDays(rs.getInt("lodgment_days"));
				 r.setPaymentTime(rs.getTimestamp("payment_time"));
				 r.setTotalReservationRoom(rs.getInt("total_reservation_room"));
				 r.setReservationDate(rs.getTimestamp("reservation_date"));
				 r.setPlanNo(rs.getString("plan_number"));
				 r.setCancelDate(rs.getTimestamp("cancel_date"));
				 r.setCheckInTime(rs.getTimestamp("check_in_time"));
				 r.setCustomerName(rs.getString("customer_name"));
				 r.setCustomerNameKana(rs.getString("customer_name_kana"));
				 r.setEmailAddress(rs.getString("email_address"));
				 r.setPhoneNumber(rs.getString("phone_number"));
				 r.setAddress(rs.getString("address"));
				 r.setPostalCode(rs.getString("postal_code"));
				 r.setAllergyCount(rs.getInt("allergy_count"));
				 r.setPassword(rs.getString("password"));
				 r.setMealTime(rs.getString("meal_time")); 

				 ar.add(r);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<LodgmentInformation> findAllLodgment() {
		ArrayList<LodgmentInformation> ar = new ArrayList<>();
		String sql = "select * from lodgment_infomation";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 LodgmentInformation l = new LodgmentInformation(); 
				 l.setReservationNo(rs.getString("reservation_number"));
				 l.setLodgmentNo(rs.getString("lodgment_number"));
				 l.setLodgmentCount(rs.getInt("lodgment_count"));
				 l.setRoomNo(rs.getString("room_number"));
				 l.setCheckOutTime(rs.getTimestamp("check_out_rime"));
				 
				 ar.add(l);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
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