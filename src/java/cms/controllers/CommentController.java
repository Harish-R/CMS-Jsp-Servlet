/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cms.controllers;

import cms.models.CommentModel;
import cms.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Harish
 */
@WebServlet(name = "CommentController", urlPatterns = {"/CommentController"})
public class CommentController extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int uid = 0;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        System.out.println("userame = " + username); 
        Connection con = DBConnection.connect();
        String query = "SELECT uid from users WHERE username = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                uid = rs.getInt("uid");
                System.out.println("UID = " + uid);
            }
            con.close();
            String comment = request.getParameter("commentContent");
            System.out.println("Comment = " + comment);
            String pid = request.getParameter("pid");
            System.out.println("PID = " + pid );
            java.util.Date date = new java.util.Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM YYYY");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            
            String currentDate = dateFormat.format(date);
            String currentTime = timeFormat.format(date);
            
            CommentModel commentModel = new CommentModel(pid, uid, comment);
            if(commentModel.addComment()) {
                out.println(username + " " + currentDate + " " + currentTime);
            }
            else {
                out.println("<p>Error</p>");
            }
        } catch (SQLException e) {
           e.printStackTrace();
           System.out.println(e);
        }
    }
}
