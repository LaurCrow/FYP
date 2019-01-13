<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JPage</title>
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
             //using the jdbc driver
             Class.forName("com.mysql.jdbc.Driver");
             //Create the connection with fyp database
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
          Statement stmt = con.createStatement();
          //Select the data from the database where the user id is equal to the session id
          ResultSet rs = stmt.executeQuery("select * from register where uid='"+session_id+"'");
          rs.next();
          //Retrieve the detaails from the results set for the applicable variable 
          String uid = rs.getString("uid");

          %>
              
          <form action="register_1.jsp" method="post">

								
	<input style="height:30px" size="25" type="text" name ="TestType" value ="Chemical"/>
							
	<input style="height:30px" size="25" type="text" name ="uid" value ="<%out.print(uid);%>" />
							
	<input align="middle" type="submit" value ="Place Order" />

       
                       </form>
                         <%
         }catch(Exception e){
          out.println(e);
         }
     
          
       
        %>

    </body>
</html>
