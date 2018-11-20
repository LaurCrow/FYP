<%-- 
    Document   : userprofile
    Created on : Sep 29, 2016, 1:32:41 AM
    Author     : Oops
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>User Profile</title>
     
    </head>
    <body>
        <div>
        <div style=" float: left; margin-left: 71px;">
        <%
        
         try{
              String session_id =null;
        HttpSession session1=request.getSession(false);  
        if(session1!=null){  
        session_id=(String)session1.getAttribute("name");  
       // out.println(session_id);
        }
             
             Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "Laura6531*");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from register where uid='"+session_id+"'");
          rs.next();
          String name = rs.getString("name");
          String email = rs.getString("email");
          String mob = rs.getString("contact");
          %>
           <h1>Welcome : <%out.print(name);%></h1>
           <h1>Your Mail : <%out.print(email);%></h1>
           <h1>Your Mobile : <%out.print(mob);%></h1>
           <%
         }catch(Exception e){
          out.println(e);
         }
     
          
       
        %>
        </div>
        
       
     </div>
       
 
    </body>
</html>
