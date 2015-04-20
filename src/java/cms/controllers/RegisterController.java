package cms.controllers;

import cms.models.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Harish
 */
public class RegisterController extends HttpServlet {
    
    String name;
    String username;
    String emailid;
    String password;
    String cpassword;
    
    public RegisterController() {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Done");
        name = request.getParameter("name");
        username = request.getParameter("username");
        emailid = request.getParameter("emailid");
        password = request.getParameter("password");
        cpassword = request.getParameter("cpassword");
        System.out.println("Done2");
        RegisterModel registerModel = new RegisterModel(name, username, emailid, password, cpassword);
        System.out.println("Done3");
        if(registerModel.register()) {
            request.getRequestDispatcher("/registered.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("/error_page.jsp").forward(request, response);
        }
        System.out.println("Bye");
        }

}
