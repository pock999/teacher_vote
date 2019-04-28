package control;

import java.sql.*;

public class DBMgr {
	private Connection connection;
	private Statement statement;
	private ResultSet resultset;

	public DBMgr() {// 連到資料庫
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/yuntehteacher?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=UTC", "test001", "test001");
			statement = connection.createStatement();

		} catch (Exception ex) {
			System.out.println("Error: " + ex);
		}
	}

	public void modify(String query) throws SQLException {
		statement.executeUpdate(query);
		// update database
	}

	public ResultSet queryDB(String query) throws SQLException {// query database
		resultset = statement.executeQuery(query);
		return resultset;

	}

}
