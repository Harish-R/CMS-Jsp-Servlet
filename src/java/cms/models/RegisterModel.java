package cms.models;

import cms.util.DBConnection;
import java.sql.*;

public class RegisterModel {
        
	String name, username, emailid, password, cpassword;
	public RegisterModel(String name, String username, String emailid, String password, String cpassword) {
		this.name = name;
		this.username = username;
		this.emailid = emailid;
		this.password = password;
		this.cpassword = cpassword; 
	}
	
	public boolean register() {
		Connection con = DBConnection.connect();
		try {
			PreparedStatement stmt = con.prepareStatement("INSERT INTO users (fullname, username, email, password) VALUES (?, ?, ?, ?)");
			stmt.setString(1, name);
			stmt.setString(2, username);
			stmt.setString(3, emailid);
			stmt.setString(4, password);
			int result = stmt.executeUpdate();
                        System.out.println("Result = " + result);
			if(result > 0) {
				return true;
			}
			return false;
		}
		catch (Exception e) {
                    e.printStackTrace();
		}
		return false;
	}
}
