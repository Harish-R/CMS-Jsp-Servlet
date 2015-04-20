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
public class UpdatePostModel {
    
    String title, content;
    int cat_id;
    String username;
    int uid;
    String pid;
    
    public UpdatePostModel(String title, String content, int cat_id, String pid) {
        this.title = title;
        this.content = content;
        this.cat_id = cat_id;
        this.pid = pid;
    } 
    
    public boolean updatePost() {
        
        try {
            Connection con = DBConnection.connect();
            
            String query1 = "UPDATE posts SET title = ? WHERE pid = ?";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setString(1, title);
            ps1.setString(2, pid);
            int result = ps1.executeUpdate();
            
            System.out.println(result);
            
            query1 = "UPDATE posts SET content = ? WHERE pid = ?";
            ps1 = con.prepareStatement(query1);
            ps1.setString(1, content);
            ps1.setString(2, pid);
            result = ps1.executeUpdate();
            
            System.out.println(result);
            
            query1 = "UPDATE posts SET cat_id = ? WHERE pid = ?";
            ps1 = con.prepareStatement(query1);
            ps1.setInt(1, cat_id);
            ps1.setString(2, pid);
            result = ps1.executeUpdate();
            
            System.out.println(result);
            
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
