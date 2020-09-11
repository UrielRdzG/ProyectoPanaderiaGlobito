/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Controlador.*;
import java.util.Vector;

/**
 *
 * @author uriel
 */
public class AgregarPanCarrito extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //obtener la sesion del usuario que realizara la compra
            
            HttpSession sesion = request.getSession();
            //obtener el vector de los panes y del detalle de compra de los panes
            
            Vector<DVenta> vectorDetalle = null;
            Vector<MPan> stockPanes = null;
            
            //si la sesion es valida debemos obtener sus atributos para saber que panes han escogido o los que han agregado al carrito
            
            if(sesion.getAttribute("detalleVenta")!=null){
                //que si hay panes en el carrito
                vectorDetalle = (Vector<DVenta>)sesion.getAttribute("detalleVenta");
                stockPanes = (Vector<MPan>)sesion.getAttribute("stockPanes");
                
            }else{
                //hay que crear esos detalle de venta y del stock
                vectorDetalle = new Vector<DVenta>();
                stockPanes = new Vector<MPan>();
            }
            
            //obtenemos los parametros del formulario de la venta
            
            int codigo, cantidad;
            
            codigo=Integer.parseInt(request.getParameter("id"));
            cantidad=Integer.parseInt(request.getParameter("cantidad"));
            
            MPan pan=new MPan();
            pan=pan.buscarPan(codigo);
            
            float subtotal = 0;
            subtotal=cantidad*pan.getPre_pan();
            
            //obtener el detalle de la venta del pan
            
            DVenta detalleVentas = new DVenta();
            detalleVentas.setId_dventa(vectorDetalle.size());
            
            detalleVentas.setId_pan(codigo);
            detalleVentas.setSubtotal_venta(subtotal);
            detalleVentas.setCant_dventa(cantidad);
            
            //se agrega al vector
            vectorDetalle.add(detalleVentas);
            sesion.setAttribute("detalleVenta", vectorDetalle);
            //actualizar el stock
            
            pan.setStock_pan(pan.getStock_pan()-cantidad);
            stockPanes.add(pan);
            
            sesion.setAttribute("stockPanes", stockPanes);
            
            response.sendRedirect("MostrarCarritoPanes");

        }
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
        processRequest(request, response);
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
