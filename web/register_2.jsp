
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
            try{
            //If the session id is null, do not create session
              String session_id =null;
        HttpSession session1=request.getSession(false); 

  
        //if the session id is not null, the session id is the attriute name
        if(session1!=null){  
        session_id=(String)session1.getAttribute("name");  
       
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String address = request.getParameter("address");
        String mob = request.getParameter("contact");
     
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
            
         
          Statement stmt = con.createStatement();
          stmt.execute(" update register set pass = concat('"+pass+"'),address = concat('"+address+"'),name = concat('"+name+"'),email= concat('"+email+"')where uid='"+session_id+"'");
          out.println("Edit success");
          response.sendRedirect("login.jsp");
           
        }catch(Exception e){
            
        }
        
      
        %>
    </body>
</html>
