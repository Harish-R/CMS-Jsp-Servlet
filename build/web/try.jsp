<%-- 
    Document   : try
    Created on : Apr 4, 2015, 4:57:44 PM
    Author     : Harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2>Upload Image: </h2>
        
        <form action="ImageServlet" method="POST" enctype="multipart/form-data">
            Image Name: <input type="text" name="name" /> <br>
            File : <input type="file" name="imageFile" /><br>
            <input type="submit" name="submit" /> 
        </form>

    </body>
</html>
