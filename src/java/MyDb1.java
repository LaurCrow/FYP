
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

//https://www.youtube.com/watch?v=akW6bzoRcZo
public class MyDb1 {

    static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    Connection con;
    //https://stackoverflow.com/questions/10915375/create-a-class-to-connect-to-any-database-using-jdbc
    public Connection getCon()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MyDb1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyDb1.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return con;
    }
    
}
    

