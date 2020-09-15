/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author uriel
 */
public class DVenta {
    
    private int id_dventa, id_pan, cant_dventa, id_venta, id_eusu;
    private float subtotal_dventa;
    
    public DVenta(){
    
    }

    public Vector<DVenta> consultarDetalleVenta(int id) throws ClassNotFoundException{
        Vector<DVenta> mv=new Vector<DVenta>();
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        try {
            con=Conexion.getConnection();
            String q="select * from DVenta where id_venta=?";
            ps=con.prepareStatement(q);
            ps.setInt(1, id);
            rs=ps.executeQuery();
            
            while (rs.next()) {                
                DVenta ven=new DVenta();
                ven.setId_dventa(rs.getInt("id_dventa"));
                ven.setId_pan(rs.getInt("id_pan"));
                ven.setCant_dventa(rs.getInt("cant_dventa"));
                ven.setSubtotal_dventa(rs.getFloat("subtotal_dventa"));
                ven.setId_venta(id);
                ven.setId_eusu(rs.getInt("id_eusu"));
                mv.add(ven);
                
            }
            
        } catch (SQLException e) {
            System.out.println("No encontro la tabla MVenta, no se puede mostrar la lista de ventas por mes");
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
    
    public int getId_dventa() {
        return id_dventa;
    }

    public void setId_dventa(int id_dventa) {
        this.id_dventa = id_dventa;
    }

    public int getId_pan() {
        return id_pan;
    }

    public void setId_pan(int id_pan) {
        this.id_pan = id_pan;
    }

    public int getCant_dventa() {
        return cant_dventa;
    }

    public void setCant_dventa(int cant_dventa) {
        this.cant_dventa = cant_dventa;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_eusu() {
        return id_eusu;
    }

    public void setId_eusu(int id_eusu) {
        this.id_eusu = id_eusu;
    }

    public float getSubtotal_dventa() {
        return subtotal_dventa;
    }

    public void setSubtotal_dventa(float subtotal_dventa) {
        this.subtotal_dventa = subtotal_dventa;
    }
    
    
    
}
