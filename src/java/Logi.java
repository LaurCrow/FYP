import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class MySQLConnect
 */
public class Logi extends HttpServlet {
private static final long serialVersionUID = 1L;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/* I used this website to help me with login code https://www.lionblogger.com/how-to-create-a-simple-login-form-using-java-servlet-and-mysql-db/*/
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String name = request.getParameter("name");
String pass = request.getParameter("pass");
try {
MyDB db = new MyDB();
          Connection con = db.getCon();
          Statement stmt = con.createStatement();
         ResultSet rs = stmt.executeQuery("select uid,email,pass from register where name = '"+name+"' and  pass = '"+pass+"'");
if ((rs.next())) {

            String uid = rs.getString("uid");
            response.sendRedirect("http://localhost:8080/FinalYearProjec/userprofile.jsp");  
             
             //out.println("User id"+uid);
              HttpSession session=request.getSession();  
              session.setAttribute("name",uid);
   
} 
else {
RequestDispatcher rd = request.getRequestDispatcher("/Incorrect.html");
                    rd.forward(request, response);
}
} catch (SQLException ex) {
            Logger.getLogger(Logi.class.getName()).log(Level.SEVERE, null, ex);
        }
}
}
