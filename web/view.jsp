     <!-- YouTube Tutorial https://youtu.be/ROfQah8CV6k -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Image Uploaded Successfully...!</h1>
 

        <form action="viewImage.jsp" method="post">
            <input type="text" name="oid" required="required" placeholder="enter order id.."/><br/><br/>
            <input type="submit"/>
        </form>
    </body>
</html>
