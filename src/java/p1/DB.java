     //TouTube Tutorial https://youtu.be/ROfQah8CV6k 
package p1;
import java.sql.Connection;
import java.sql.DriverManager;

public class DB {

    static String URL = "localhost:3306/";
    static String DATABASE_NAME = "alt";
    static String USERNAME = "root";
    static String PASSWORD = "Laura6531*";//i have no password.

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return con;
    }
}
