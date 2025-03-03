package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

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
//				 r.setAllergyCount(rs.getInt("allergy_count"));
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
	
	
	public ArrayList<Reservation> findReservationbyPhone(String input) {
		ArrayList<Reservation> ar = new ArrayList<>();
		String sql = "select * from Reservation where phone_number = "+input;
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
				 l.setAllergyCount(rs.getInt("allergy_count"));
				 
				 ar.add(l);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<LodgmentInformation> findLodgment(String no) {
		ArrayList<LodgmentInformation> ar = new ArrayList<>();
		String sql = "select * from lodgment_information where reservation_number = "+no;
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 LodgmentInformation l = new LodgmentInformation(); 
				 l.setReservationNo(rs.getString("reservation_number"));
				 l.setLodgmentNo(rs.getString("lodgment_number"));
				 l.setLodgmentCount(rs.getInt("lodgment_count"));
				 l.setRoomNo(rs.getString("room_number"));
				 l.setCheckOutTime(rs.getTimestamp("check_out_time"));
				 l.setAllergyCount(rs.getInt("allergy_count"));
				 
				 ar.add(l);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public Reservation findReservation(String input) {
		Reservation r = new Reservation();
		String sql = "select * from Reservation where reservation_number = "+input;
		
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 
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
//				 r.setAllergyCount(rs.getInt("allergy_count"));
				 r.setPassword(rs.getString("password"));
				 r.setMealTime(rs.getString("meal_time")); 
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}
	public Reservation findReservationbyPass(String input,String pass) {
		Reservation r = new Reservation();
		String sql = "select * from Reservation where reservation_number = "+input+" AND password = "+pass;
		
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 
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
//				 r.setAllergyCount(rs.getInt("allergy_count"));
				 r.setPassword(rs.getString("password"));
				 r.setMealTime(rs.getString("meal_time")); 
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}
	
	public void setMealTime(Reservation r,String time) {
		String sql = "update reservation set meal_time ="+time+" where reservation_number = "+r.getReservationNo();
		
			
		try {
			PreparedStatement state;
			state =con.prepareStatement(sql);
			state.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setCheckinTime(Reservation r) {
		System.out.println(r.getCheckInTime());
		String sql = "update reservation set check_in_time = NOW() where reservation_number = "+r.getReservationNo();
		
		
		try {
			PreparedStatement state;
			state =con.prepareStatement(sql);
			state.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setLodgment(Reservation r,String room,int num) {
		try {
			
			String sql ="UPDATE lodgment_information SET room_number = "+room+" where lodgment_number = "+num+" AND reservation_number ="+r.getReservationNo();
			PreparedStatement state;
			state =con.prepareStatement(sql);
			state.executeUpdate();				
									
				
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String watchTimeAM(Reservation r){
		System.out.println(r.getMealTime()+"timeAM");
		int time = Integer.parseInt(r.getMealTime());
		
		if(Objects.isNull(time)) {
			return "なし";
		}	
		time /= 10; 
		
		if(time==0) {
			return "err1";
		}else if(time==1) {
			return "7:00";
		}else if(time==2) {
			return "7:30";
		}else if(time==3) {
			return "8:00";
		}else {
			return "err2";
		}
	}
	
	public String watchTimePM(Reservation r){
		int time = Integer.parseInt(r.getMealTime());
		
		if(Objects.isNull(time)) {
			return "なし";
		}
		time %= 10;
		
		if(time==0) {
			return "err1";
		}else if(time==1) {
			return "17:30";
		}else if(time==2) {
			return "18:00";
		}else if(time==3) {
			return "18:30";
		}else {
			return "err2";
		}
	}
	
	public ArrayList<Integer> getAllergyCount(Reservation r){
		ArrayList<LodgmentInformation> ary =findLodgment(r.getReservationNo());
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		for(LodgmentInformation l:ary) {
			list.add(l.getAllergyCount());
		}
		return list;
	}
	
//	public boolean setReservationState(String state) {
		

	
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