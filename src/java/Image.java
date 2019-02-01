
 import java.sql.*;
import java.io.*;
public class Image {
   

public static void main(String[] args){
    System.out.println("Insert Image Example!");
    String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "bookstore";
    String userName = "root";
    String password = "Laura6531*";
    Connection con = null;
    try{
       Class.forName(driverName);
       con = DriverManager.getConnection(url+dbName,userName,password);
       Statement st = con.createStatement();
       File imgfile = new File("C:\\Users\\Laura\\OneDrive\\Documents\\NetBeansProjects\\Final Year Projec\\web\\images\\lab.png");

      FileInputStream fin = new FileInputStream(imgfile);

       PreparedStatement pre =
   // con.prepareStatement("insert into register values(?,?)");
       con.prepareStatement("update register set image = concat(image, ?) where uid = 1;");
       
       pre.setBinaryStream(1,(InputStream)fin,(int)imgfile.length());
       pre.executeUpdate();
       System.out.println("Successfully inserted the file into the database!");

       pre.close();
       con.close(); 
    }catch (Exception e1){
        System.out.println(e1.getMessage());
    }
}
    }
    

