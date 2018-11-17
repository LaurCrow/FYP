import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
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
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Laura6531*");
PreparedStatement pst = conn.prepareStatement("Select name,pass from user where name=? and pass=?");
pst.setString(1, name);
pst.setString(2, pass);
ResultSet rs = pst.executeQuery();
if ((rs.next())) {

            RequestDispatcher rd = request.getRequestDispatcher("/welcome.html");
            rd.forward(request, response);
  
} 
else {
RequestDispatcher rd = request.getRequestDispatcher("/Incorrect.html");
                    rd.forward(request, response);
}
} catch (ClassNotFoundException | SQLException e) {
e.printStackTrace();
}
}
}