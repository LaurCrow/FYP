
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletion Success</title>
    </head>
    <body>
       
        <%
            //Same idea as register page and userprofile page
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
            
         //I asked a question regarding the concat bit on stackoverflow https://stackoverflow.com/questions/54328838/i-am-trying-to-update-my-mysql-database-however-when-i-try-update-more-than-one/54329056#54329056
          Statement stmt = con.createStatement();
          stmt.execute(" Delete from register where pass = ('"+pass+"') and address =('"+address+"') and name =('"+name+"') and email= ('"+email+"') and uid='"+session_id+"'");
          out.println("Edit success");
          response.sendRedirect("Login.html");
           
        }catch(Exception e){
            
        }
        
      
        %>
    </body>
</html>
