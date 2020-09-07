/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.*;

/**
 *
 * @author uriel
 */
public class MUsuario {
    
    private int id_usu;
    private String nom_usu, appat_usu, apmat_usu, user_usu, pass_usu;
    
    public MUsuario(){
        
    }
    
    //metodos getter and setter
    
    public MUsuario verificarUsuario(String user, String pass) throws ClassNotFoundException{
        MUsuario u= null;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            con=Conexion.getConnection();
            String q="select * from MUsuario where user_usu = ? adn pass_usu = ?";
            ps=con.prepareStatement(q);
            //enviar los parametros user y pass
            ps.setString(1, user);
            ps.setString(2, pass);
            //ejecutamos al query
            rs=ps.executeQuery();
            //buscar dentro de la tabla
            while (rs.next()) {                
                u=new MUsuario();
                u.setId_usu(rs.getInt("id_usu"));
                u.setNom_usu(rs.getString("nom_usu"));
                u.setAppat_usu(rs.getString("appat_usu"));
                u.setUser_usu(rs.getString("user_usu"));
                u.setPass_usu(rs.getString("pass_usu"));
                u.set
            }
        }catch(SQLException e){
            
        }
    }
    
    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public String getNom_usu() {
        return nom_usu;
    }

    public void setNom_usu(String nom_usu) {
        this.nom_usu = nom_usu;
    }

    public String getAppat_usu() {
        return appat_usu;
    }

    public void setAppat_usu(String appat_usu) {
        this.appat_usu = appat_usu;
    }

    public String getApmat_usu() {
        return apmat_usu;
    }

    public void setApmat_usu(String apmat_usu) {
        this.apmat_usu = apmat_usu;
    }

    public String getUser_usu() {
        return user_usu;
    }

    public void setUser_usu(String user_usu) {
        this.user_usu = user_usu;
    }

    public String getPass_usu() {
        return pass_usu;
    }

    public void setPass_usu(String pass_usu) {
        this.pass_usu = pass_usu;
    }
    
    
    
    
}
