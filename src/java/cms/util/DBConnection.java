package cms.util;

import java.sql.*;

public class DBConnection {
	
	static String url = "jdbc:mysql://localhost:3306/test";
	static String username = "root";
	static String password = "";
	
	DBConnection() {
		url = "jdbc:mysql://localhost:3306";
		username = "root";
		password = "";
	} 
	
	public static Connection connect() { 
		Connection con = null;
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return con;
	}
}