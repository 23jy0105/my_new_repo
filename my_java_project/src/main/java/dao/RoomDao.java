package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Room;
import model.RoomRemainingCount;
import model.RoomType;

public class RoomDao {
	private Connection con = null;

	public RoomDao() {
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

	public ArrayList<Room> findAllRoom() {
		ArrayList<Room> ar = new ArrayList<>();
		String sql = "select * from room";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Room r = new Room(); 
				 r.setRoomNo(rs.getString("room_number")); 
				 r.setTypeNo(rs.getString("room_type_number")); 
				 r.setRoomState(rs.getString("room_state")); 
				 r.setRoomKey(rs.getString("entering_room_key")); 
				 r.setKeyUpdateTime(rs.getTimestamp("key_update_time"));
				 r.setEnterRoomTime(rs.getTimestamp("entering_room_time"));
				 r.setSiteManagementKey(rs.getString("site_management_key")); 

				 ar.add(r);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<RoomType> roomType() {
		ArrayList<RoomType> ar = new ArrayList<>();
		String sql = "select * from room_type";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 RoomType rt = new RoomType(); 
				 rt.setRoomType(rs.getString("room_type_number")); 
				 rt.setTypeName(rs.getString("type_name")); 
				 rt.setMaxAccommodation(rs.getInt("max_accommodation_count")); 
				 rt.setTotalRoom(rs.getInt("total_room_count"));
				 
				 ar.add(rt);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<RoomRemainingCount> findRoomRemaining() {
		ArrayList<RoomRemainingCount> ar = new ArrayList<>();
		String sql = "select * from room_remaining_count";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				 RoomRemainingCount rt = new RoomRemainingCount(); 
				 rt.setDate(rs.getDate("date")); 
				 rt.setRoomType(rs.getString("room_type_number")); 
				 rt.setReserved(rs.getInt("reserved_room_number")); 
				 
				 ar.add(rt);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<Room> findEmptyRoom(String type) {
		ArrayList<Room> ar = new ArrayList<>();
		String sql = "select * from room where room_state = 0 AND room_type_number = "+type+" order by room_number";
		try {
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) { 
				Room r = new Room(); 
				 r.setRoomNo(rs.getString("room_number")); 
				 r.setTypeNo(rs.getString("room_type_number")); 
				 r.setRoomState(rs.getString("room_state")); 
				 r.setRoomKey(rs.getString("entering_room_key")); 
				 r.setKeyUpdateTime(rs.getTimestamp("key_update_time"));
				 r.setEnterRoomTime(rs.getTimestamp("entering_room_time"));
				 r.setSiteManagementKey(rs.getString("site_management_key")); 

				 ar.add(r);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ar;
	}
	
	public String setRoomState(String num) {
		System.out.println(num);
		String sql = "select * from room where room_state = 0 AND room_number = "+num;
		
		try {
			System.out.println("ok");
			PreparedStatement state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			if(!rs.next()) {
				System.out.println("ng");
				return "0";
			}else {
				try {
					System.out.println("ok");
					sql ="UPDATE room SET room_state = 1 where room_number ="+num;
					state =con.prepareStatement(sql);
					state.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
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