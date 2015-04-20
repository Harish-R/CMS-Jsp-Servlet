package cms.controllers;

import cms.models.DeletePostModel;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePostController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pidString = request.getParameter("pid");
        System.out.println(pidString);
        try {
            int pid = Integer.parseInt(pidString);
            System.out.println(pid);
            DeletePostModel deletePostModel = new DeletePostModel(pid);
            if(deletePostModel.delete()) {
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}
