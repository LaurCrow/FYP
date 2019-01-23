/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

/**
 *
 * @author Laura
 */
public class Ret extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
}
     @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    processRequest(request, response);
    String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "test";
    String userName = "root";
    String password = "Laura6531*";
    Connection con = null;
    try{
        Class.forName(driverName);
        con = DriverManager.getConnection(url+dbName,userName,password);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select image from test_image");
        int i = 0;
        while (rs.next()) {
            InputStream in = rs.getBinaryStream(1);
            OutputStream f = new FileOutputStream(new File("lab"+i+".jpg"));
            i++;
            int c = 0;
            while ((c = in.read()) > -1) {
                f.write(c);
            }
            f.close();
            in.close();
        }
    }catch(Exception ex){
        System.out.println(ex.getMessage());
    }
} 

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    processRequest(request, response);
    
}
        }
    
