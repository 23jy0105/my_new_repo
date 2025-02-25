package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://10.42.129.142:3306/23jya06?serverTimezone=UTC&characterEncoding=UTF-8"; // データベースURL
    private static final String USER = "23jya06";  // データベースのユーザー名
    private static final String PASSWORD = "23jya06"; // データベースのパスワード

    // データベース接続を取得
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}