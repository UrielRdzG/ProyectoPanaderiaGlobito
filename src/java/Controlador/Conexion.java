/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author uriel
 */

import java.sql.*;

public class Conexion {
    public static Connection getConnection() throws ClassNotFoundException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String user, pass, url;
            url = "jdbc:mysql://localhost:3306/globito";
            user= "root";
            pass= "n0m3l0";
            
            return DriverManager.getConnection(url, user, pass);
        }catch(SQLException e){
            System.out.println("No se conecto a la BD");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return null;
    } 
}
