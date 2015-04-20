package cms.controllers;

import cms.models.*;
import java.io.IOException;
import java.sql.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {
	String username;
	String password;
	
	public LoginController() {
	}
	
    /**
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		username = request.getParameter("username");
		password = request.getParameter("password");
		
                System.out.println("HEllo Success or Failure!"); // For testing
                
		LoginModel loginmodel = new LoginModel(username, password);
		//loginbean.setUsername(username);
		//loginbean.setPassword(password);
		try {
                    System.out.println("Lgin model created, Inside try block");    // For testing
                    boolean loginstats = loginmodel.authenticateUser();
                    HttpSession session = request.getSession();
                    if(loginstats == true) {
                            session.setAttribute("username", username);
                            //session.setAttribute("", uid);
                            System.out.println("Forewarding to index:");    // For testing
                            request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                    else {  
                        session.setAttribute("username", null);
                        session.setAttribute("errorMessage", "Wrong Username or Password!");
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
		}
		catch(Exception e) {
                    e.printStackTrace();
		}
	}
}
