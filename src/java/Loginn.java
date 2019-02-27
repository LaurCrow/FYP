
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Laura
 */
public class Loginn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   // https://www.youtube.com/watch?v=akW6bzoRcZo
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* https://stackoverflow.com/questions/10915375/create-a-class-to-connect-to-any-database-using-jdbc. */
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            MyDb1 db = new MyDb1();
          Connection con = db.getCon();
          Statement stmt = con.createStatement();
         ResultSet rs = stmt.executeQuery("select uid,name,pass from register where email = '"+name+"' and  pass = '"+pass+"'");
       //I googled how to create session and found this on stackover flow https://stackoverflow.com/questions/26479217/how-to-create-session-for-login-and-logout-in-java. I kept getting errors with the if statement in the next part of code https://stackoverflow.com/questions/53378978/error-java-lang-illegalstateexception-cannot-create-a-session-after-the-respon
         while ((rs.next())) {
        
            String uid = rs.getString("uid");

             //out.println("User id"+uid);
              HttpSession session=request.getSession();  
              session.setAttribute("name",uid);
              response.sendRedirect("http://localhost:8080/Final_Year_Projec/userprofile.jsp");  
              
} 
        

} catch (SQLException ex) {
            Logger.getLogger(Loginn.class.getName()).log(Level.SEVERE, null, ex);
            
        }
}
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    processRequest(request, response);
} 

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    processRequest(request, response);
}
}
        
    

  
  

