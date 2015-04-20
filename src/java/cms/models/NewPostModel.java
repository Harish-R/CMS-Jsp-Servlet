/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cms.models;


import cms.util.DBConnection;
import java.sql.*;
/**
 *
 * @author Harish
 */
public class NewPostModel {
    
    String title, content;
    int cat_id;
    String username;
    int uid;
    
    public NewPostModel(String title, String content, String username, int cat_id) {
        this.title = title;
        this.content = content;
        this.cat_id = cat_id;
        this.username = username;
    } 
    
    public boolean addPost() {
        
        try {
            Connection con = DBConnection.connect();
            String query1 = "SELECT * FROM users WHERE username = ?";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setString(1, username);
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()) {
                uid = rs1.getInt("uid");
            }
            
            
            String query = "INSERT INTO posts (title, content, cat_id, uid, time) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, cat_id);
            ps.setInt(4, uid);
            java.util.Date date = new java.util.Date();
            Timestamp time = new Timestamp(date.getTime());
            ps.setTimestamp(5, time);
            int result = ps.executeUpdate();
            if(result > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
        
    }
    
}
