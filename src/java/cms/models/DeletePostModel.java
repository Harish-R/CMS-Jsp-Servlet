/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cms.models;

import cms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Harish
 */
public class DeletePostModel {
    
    int pid;
    
    public DeletePostModel(int pid) {
        this.pid = pid;
        System.out.println(pid);
    }
    
    public boolean delete() {
        Connection con = DBConnection.connect();
        try {
            PreparedStatement ps = con.prepareStatement("DELETE FROM posts WHERE pid = ?");
            ps.setInt(1, pid);
            int result = ps.executeUpdate();
            System.out.println(result);
            if(result > 0) {
                    return true;
            }
            else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
