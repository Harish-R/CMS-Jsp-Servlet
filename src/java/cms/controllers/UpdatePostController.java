package cms.controllers;

import cms.models.NewPostModel;
import cms.models.UpdatePostModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdatePostController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String[] categories = request.getParameterValues("category");
        int cat_id = Integer.parseInt(categories[0]);
        String pidString = request.getParameter("pid");
        
        try {
            UpdatePostModel updatePostModel = new UpdatePostModel(title, content, cat_id, pidString);
            if(updatePostModel.updatePost()) {
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }
    
}
