     <!-- YouTube Tutorial https://youtu.be/ROfQah8CV6k -->
<%@page import="p1.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String oid = request.getParameter("oid");
 
    try {
        Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from result where oid=?");
        ps.setString(1, oid);
   
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob("image");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } else {
            System.out.println("No Results found with this order id.");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
