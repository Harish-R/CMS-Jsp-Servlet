<%-- 
    Document   : login
    Created on : Mar 18, 2015, 9:56:29 PM
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
        <% 
            String username = request.getParameter("password");
            String password = request.getParameter("username");
            
            out.println("USername: " + username);
            out.println("USername: " + username);
        %>
    </body>
</html>
