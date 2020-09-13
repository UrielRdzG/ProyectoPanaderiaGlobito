/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import Controlador.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author uriel
 */
public class RegistrarUsuario extends HttpServlet {

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
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //primero tenemos que obtener los parametros del inicio de sesion
            
            String user, pass, nombre, apellido;
            
            nombre=request.getParameter("nombre");
            apellido=request.getParameter("apellido");
            user = request.getParameter("user");
            pass = request.getParameter("pass");
            
            //creo una instancia del usuario
            boolean registro=false;
            MUsuario u = new MUsuario();
            
            registro = u.registrarUsuario(nombre, apellido, user, pass);
            
            //ahora verificar el tipo de usuario
            
            if(registro==true){
                //si registro al usuario
                System.out.println("Se registro al usuario");
                Connection con=null;
                PreparedStatement ps=null;
                ResultSet rs=null;
                try {
                    con=Conexion.getConnection();
                    String q="select * from MUsuario where user_usu = ?";
                    ps=con.prepareStatement(q);
                    ps.setString(1, user);
                    rs=ps.executeQuery();
                    while (rs.next()) {                
                        int idusuario;
                        idusuario = rs.getInt("id_usu");
                        System.out.println("la id es:"+idusuario);
                        String w="insert into EUsuario(id_usu) values(?)";
                        ps=con.prepareStatement(w);
                        ps.setInt(1, idusuario);
                        ps.executeUpdate();
                        System.out.println("Si registro en eusu");
                    }
                } catch (SQLException e) {
                    System.out.println("Algo mal");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                }finally{
                    try {
                        rs.close();
                        ps.close();
                        con.close();
                    } catch (SQLException e) {
                        System.out.println(e.getMessage());
                    }
                }
                response.sendRedirect("inicio.jsp");
                
            }else{
                //si no registro al usuario
                System.out.println("No registro al usuario");
                response.sendRedirect("index.html");
            }
            
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
