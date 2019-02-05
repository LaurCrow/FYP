<%-- 
    Document   : viewImage
    Created on : Oct 19, 2017, 12:08:11 PM
    Author     : Dharmesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your Results</h1>
 
        
		<%
		String oid = request.getParameter("oid");
		%>
		<img src="getImage.jsp?oid=<%=oid%>" width="400px"/>
    </body>
</html>
