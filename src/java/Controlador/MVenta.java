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

import java.util.*;
import java.sql.*;

public class MVenta {
    private int id_venta;
    private String fecha_venta;
    private float total_venta;
    
    public MVenta(){
        
    }
    
    public Vector<MVenta> consultarVentas() throws ClassNotFoundException{
        Vector<MVenta> mv=new Vector<MVenta>();
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        try {
            con=Conexion.getConnection();
            String q="select * from MVenta";
            ps=con.prepareStatement(q);
            rs=ps.executeQuery();
            //buscar todos los panes de la tabla
            while (rs.next()) {                
                MVenta ven=new MVenta();
                ven.setId_venta(rs.getInt("id_venta"));
                ven.setFecha_venta(rs.getString("fecha_venta"));
                ven.setTotal_venta(rs.getFloat("total_venta"));
                mv.add(ven);
                
            }
            
        } catch (SQLException e) {
            System.out.println("No encontro la tabla MVenta, no se puede mostrar la lista de ventas");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            mv=null;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }return mv;
    
    }
    
    public Vector<MVenta> consultarVentasDia() throws ClassNotFoundException{
        Vector<MVenta> mv=new Vector<MVenta>();
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        try {
            con=Conexion.getConnection();
            String q="select * from MVenta where fecha_venta='2020-08-14'";
            ps=con.prepareStatement(q);
            rs=ps.executeQuery();
            //buscar todos los panes de la tabla
            while (rs.next()) {                
                MVenta ven=new MVenta();
                ven.setId_venta(rs.getInt("id_venta"));
                ven.setFecha_venta(rs.getString("fecha_venta"));
                ven.setTotal_venta(rs.getFloat("total_venta"));
                mv.add(ven);
                
            }
            
        } catch (SQLException e) {
            System.out.println("No encontro la tabla MVenta, no se puede mostrar la lista de ventas");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            mv=null;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }return mv;
    
    }
    
    private int ultimoCodigoInsertoVenta(Connection con){
        int codigo = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            String q = "select max(id_venta) as Codigo from MVenta";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            //buscar el registro
            while(rs.next()){
                codigo = rs.getInt("Codigo");
                break;
            }
        
        }catch(SQLException e){
            System.out.println("No conecto con la tabla de la venta");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }finally{
            //vamos a cerrar conexiones
            try{
                rs.close();
                ps.close();
                
            
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        } 
        return codigo;
        
    }
    
    //registrar una venta
    public boolean registrarVenta(MVenta v, Vector<DVenta> ldvp) throws ClassNotFoundException{
        boolean registro = false;
        Connection con = null;
        PreparedStatement ps = null;
        
        try{
            con = Conexion.getConnection();
            String q = "insert into MVenta(fecha_venta, total_venta) values (?, ?)";
            ps = con.prepareStatement(q);
            ps.setString(1, v.fecha_venta);
            ps.setFloat(2, v.total_venta);
            //si se registro en la bd
            if(ps.executeUpdate()==1){
                int codigo = this.ultimoCodigoInsertoVenta(con);
                registro = this.registrarDetalleVenta(codigo, ldvp, con);
            }else{
                registro = false;
            }
        
        }catch(SQLException e){
            System.out.println("No conecto registro la venta");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }finally{
            //vamos a cerrar conexiones
            try{
               
                ps.close();
                con.close();
                
            
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        } 
        return registro;
    }
    
    //registrar el detalle de la venta
    private boolean registrarDetalleVenta(int codigo, Vector<DVenta> ldvp, Connection con){
        boolean registro = false;
        PreparedStatement ps = null;
        try{
            //debo de recorrer todo el vector del detalle de la venta de panes
            for(DVenta dv : ldvp){
                System.out.println("la ideusu es: "+dv.getId_eusu());
                String q = "insert into DVenta (id_pan, cant_dventa, "
                        + "subtotal_dventa, id_venta, id_eusu) "
                        + "values (?, ?, ?, ?, ?)";
                
                ps = con.prepareStatement(q);
                ps.setInt(1, dv.getId_pan());
                ps.setInt(2, dv.getCant_dventa());
                ps.setFloat(3, dv.getSubtotal_dventa());
                ps.setInt(4, codigo);
                ps.setInt(5, dv.getId_eusu());
                ps.executeUpdate();
                registro=true;
            }
        }catch(SQLException e){
            System.out.println("No conecto registro el detalle de la venta");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            registro=false;
        }finally{
            //vamos a cerrar conexiones
            try{
               
                ps.close();
                
                
            
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        } 
        return registro;
        
    }
    
    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public String getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(String fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public float getTotal_venta() {
        return total_venta;
    }

    public void setTotal_venta(float total_venta) {
        this.total_venta = total_venta;
    }
    
    
    
}
