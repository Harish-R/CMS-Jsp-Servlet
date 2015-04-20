package cms.controllers;

import java.io.FileInputStream;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.validator.constraints.SafeHtml.List;

/*@WebServlet("/FileUploadServlet")
@MultipartConfig( 
            fileSizeThreshold=1024*1024*2, // 2MB
             maxFileSize=1024*1024*10,      // 10MB
             maxRequestSize=1024*1024*50)
*/
public class ImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload();
        
        PrintWriter out = response.getWriter();
        String firstName = request.getParameter("name");
        out.println("<h2> First Name: " + firstName + "</h2>");
        
        try {
            
            Part imageFile = request.getPart("imageFile");
            String path = "images";
            String filename = "1.jpg";
            
            System.out.println("Before Image File");
            if(imageFile != null) {
                System.out.println("After image FIle");
                InputStream fileContent = imageFile.getInputStream();
                OutputStream fileOutput = new FileOutputStream(new File(path + "\\" + filename)); 
                int read = 0;
                byte[] b = new byte[5000000];
                while ((read = fileContent.read(b)) != -1) {
                    fileOutput.write(b, 0, read);
                }
                out.println("<h4>Image Uploaded<h4>");
            }
            
        } catch (Exception e) {
            //Logger.getLogger(ImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            out.println("Over!");
        }
    }

}
