/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
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
public class VerificarUsuario extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        
        
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //primero tenemos que obtener los parametros del inicio de sesion
            
            String user, pass;
            
            user = request.getParameter("user");
            pass = request.getParameter("pass");
            
            //creo una instancia del usuario
            
            MUsuario u = new MUsuario();
            
            u = u.verificarUsuario(user, pass);
            
            //ahora verificar el tipo de usuario
            
            if(u != null){
                //el usuario existe dentro de la bd
                //obtenemos su sesion
                HttpSession sesion = request.getSession(true);
                //enviamos el atributo de la sesion 
                sesion.setAttribute("usuario", u);
                
                HttpSession sesionUser = request.getSession();
                sesionUser.setAttribute("usuario", user);
                sesionUser.setAttribute("idusuario", u.getId_usu());
                
                
                //ahora verificamos el tipo de usuario si es admin o cliente
                if(u.getPriv_usu()==0){
                    //es un cliente
                    response.sendRedirect("indexU.jsp");
                }else{
                    response.sendRedirect("admin.jsp");
                }
            }else{
                //esta mal escrito o no existe en la bd
                response.sendRedirect("Errores.jsp");
            }
            
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(VerificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
