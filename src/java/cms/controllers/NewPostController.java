package cms.controllers;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cms.models.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Harish
 */
public class NewPostController extends HttpServlet {

    //protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    //        throws ServletException, IOException {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String[] categories = request.getParameterValues("category");
        int cat_id = Integer.parseInt(categories[0]);
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();
        
        try {
            NewPostModel newPostModel = new NewPostModel(title, content, username, cat_id);
            if(newPostModel.addPost()) {
                session.setAttribute("done", true);
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
            else {
                session.setAttribute("error", true);
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }
}

