package dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class PlanidAndPasswordGenerateDao {
	private Connection con = null;
	private static final  String CHARSET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?";

	public PlanidAndPasswordGenerateDao() {
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

	public String generateReservationNumber(){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDD");
		String formattedDate = sdf.format(calendar.getTime());
		String reserveNum = formattedDate+countReservation();
		return reserveNum;
	}
	
	public String generatePassword() {
		SecureRandom random = new SecureRandom();
		StringBuilder password = new StringBuilder(8);
		for(int i=0;i<8;i++) {
			int index = random.nextInt(CHARSET.length());
			password.append(CHARSET.charAt(index));
		}
		return password.toString();
		
	}
	public String countReservation() {
		String sql ="SELECT COUNT(reservation_number)\n"
				+ "FROM reservation\n"
				+ "WHERE reservation_date >= ?";
		int count = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDD");
			String formattedDate = sdf.format(calendar.getTime());
			pstmt.setString(1,formattedDate);
			pstmt.setString(1, formattedDate);

            ResultSet rs = pstmt.executeQuery() ;
                if (rs.next()) {
                     count = rs.getInt(1); // 結果の1列目を取得
                }
                
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		String formatcount = String.format("%05d", count);
        return formatcount;
		}
}
