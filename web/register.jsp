
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Success</title>
    </head>
    <body>
       
        <%
    
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String address = request.getParameter("address");
        String mobile = request.getParameter("contact");
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
            
         
          Statement stmt = con.createStatement();
          stmt.execute("insert into register(name,email,address,pass,contact)values('"+name+"','"+email+"','"+address+"','"+pass+"','"+mobile+"')");
          out.println("registration success");
          response.sendRedirect("login.jsp");
        }catch(Exception e){
            
        }
        
      
        %>
    </body>
</html>