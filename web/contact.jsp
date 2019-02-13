<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Success</title>
    </head>
    <body>
       
        <%
            //Same idea as the register page
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String sub = request.getParameter("sub");
        String message = request.getParameter("message");

        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
            
         
          Statement stmt = con.createStatement();
          stmt.execute("insert into contact(fname,lname,email,sub,message)values('"+fname+"','"+lname+"','"+email+"','"+sub+"','"+message+"')");
          out.println("Message success");
          response.sendRedirect("indexx.html");
        }catch(Exception e){
            
        }
        
      
        %>
    </body>
</html>

