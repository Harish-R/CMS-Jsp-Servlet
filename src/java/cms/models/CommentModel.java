package cms.models;

import cms.util.DBConnection;
import java.sql.*;

/**
 *
 * @author Harish
 */
public class CommentModel {
    
    String content, pid;
    int uid;
    Timestamp time;
    
    public CommentModel(String pid, int uid, String content) {
        this.content = content;
        this.pid = pid;
        this.uid = uid;
    } 
    
    public boolean addComment() throws SQLException {
        
        Connection con = DBConnection.connect();
        java.util.Date date= new java.util.Date();
	time = new Timestamp(date.getTime());
        String query = "INSERT INTO comments (pid, uid, content, time) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pid);
            ps.setInt(2, uid);
            ps.setString(3, content);
            ps.setTimestamp(4, time);
            int result = ps.executeUpdate();
            if(result > 0) {
                return true; 
            }
            return false;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            return false;
        }   
    }
}
