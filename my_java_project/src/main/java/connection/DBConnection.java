package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/mydatabase"; // データベースURL
    private static final String USER = "root";  // データベースのユーザー名
    private static final String PASSWORD = "password"; // データベースのパスワード

    // データベース接続を取得
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}