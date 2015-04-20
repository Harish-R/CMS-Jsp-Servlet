package cms.models;

import java.sql.*;
import cms.util.*;

public class LoginModel {
	
	Connection con = null;
	Statement stmt = null;
	
	String username, password;
	
	public LoginModel(String username, String password) {
		this.username = username;
		this.password = password;
	}
        
	public boolean authenticateUser() throws SQLException {
		con = DBConnection.connect();
		String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                        return true;
                } else {
                        return false;
                }
        }
}
