/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.*;
import java.util.Vector;

/**
 *
 * @author uriel
 */
public class MUsuario {
    
    private int id_usu, priv_usu;
    private String nom_usu, appat_usu, user_usu, pass_usu;
    
    public MUsuario(){
        
    }
    
    //metodo para agregar un nuevo usuario
    
    public boolean registrarUsuario(String nombre, String apellido, String usuario, String contrasena) throws ClassNotFoundException{
        boolean registro=false;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet set=null;
        try {
            con=Conexion.getConnection();
            String q="insert into MUsuario(nom_usu, appat_usu,user_usu,pass_usu, priv_usu) values(?, ?, ?, ?, 2)";
            ps=con.prepareStatement(q);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, usuario);
            ps.setString(4, contrasena);
            ps.executeUpdate();
            registro=true;
            
        } catch (SQLException e) {
            System.out.println("No conecto con la tabla, o no registro al usuario");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            registro=false;
        }finally{
            try {
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return registro;
    }
    
    //metodo para eliminar un usuario
    
    public boolean eliminarUsuario(int idusuario) throws ClassNotFoundException{
        boolean elimino=false;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet st=null;
        try {
            con=Conexion.getConnection();
            String q="delete * from MUsuario where id_usu=?";
            ps=con.prepareStatement(q);
            ps.setInt(1, idusuario);
            ps.executeUpdate();
            elimino=true;
            
        } catch (SQLException e) {
            System.out.println("No conecto con la tabla, o no registro al usuario");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            elimino=false;
        }finally{
            try {
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return elimino;
    }
    
    //metodo para actualizar un usuario
    
    public boolean modificarUsuario(String nombre, String apellido, String usuario, String contrasena, int idusuario) throws ClassNotFoundException{
        boolean modifico=false;
        Connection con=null;
        PreparedStatement ps=null;
        try {
            con=Conexion.getConnection();
            String q="Update MUsuario set nom_usu=?, appat_usu=?,user_usu=?,pass_usu=? where id_usu=?";
            ps=con.prepareStatement(q);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, usuario);
            ps.setString(4, contrasena);
            ps.setInt(1, idusuario);
            if(ps.executeUpdate()==1){
                modifico = true;
            }else{
                modifico = false;
            }
        } catch (SQLException e) {
            System.out.println("No encontro la tabla MUsuario o no modifico el usuario");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            modifico = false;
        }finally{
            try {
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return modifico;
    }
    
    //metodo para consultar todos los usuarios
    
    public Vector<MUsuario> consultarUsuarios() throws ClassNotFoundException{
        Vector<MUsuario> cu=new Vector<MUsuario>();
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        try {
            con=Conexion.getConnection();
            String q="select * from MUsuario";
            ps=con.prepareStatement(q);
            rs=ps.executeQuery();
            //buscar todos los panes de la tabla
            while (rs.next()) {                
                MUsuario usu=new MUsuario();
                usu.setId_usu(rs.getInt("id_usu"));
                usu.setNom_usu(rs.getString("nom_usu"));
                usu.setAppat_usu(rs.getString("appat_usu"));
                usu.setUser_usu(rs.getString("user_usu"));
                usu.setPass_usu(rs.getString("pass_usu"));
                cu.add(usu);
                
            }
            
        } catch (SQLException e) {
            System.out.println("No encontro la tabla MUsuario, no se puede mostrar la lista");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            cu=null;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }return cu;
    
    }
    
    //metodo para buscar un usuario por id
    
    public MUsuario buscarUsuario(int idusuario) throws ClassNotFoundException{
        MUsuario usu = null;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        try {
            con=Conexion.getConnection();
            String q="select * from MUsuario where id_usu = ?";
            ps=con.prepareStatement(q);
            ps.setInt(1, idusuario);
            while (rs.next()) {                
                usu=new MUsuario();
                usu.setId_usu(rs.getInt("id_usu"));
                usu.setNom_usu(rs.getString("nom_usu"));
                usu.setAppat_usu(rs.getString("appat_usu"));
                usu.setUser_usu(rs.getString("user_usu"));
                usu.setPass_usu(rs.getString("pass_usu"));
            }
        } catch (SQLException e) {
            System.out.println("No encontro la tabla MUsuario, no se pudo buscar al usuario solicitado");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            usu=null;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return usu;
    }
    
    //metodo para verificar usuario
    
    public MUsuario verificarUsuario(String user, String pass) throws ClassNotFoundException{
        MUsuario u= null;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            con=Conexion.getConnection();
            String q="select * from MUsuario where user_usu = ? and pass_usu = ?";
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
                u.setPriv_usu(rs.getInt("priv_usu"));
                break;
            }
        }catch(SQLException e){
            System.out.println("No conecto con la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            u = null;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return u;
    }
    
    //metodos get and set
    
    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public int getPriv_usu() {
        return priv_usu;
    }

    public void setPriv_usu(int priv_usu) {
        this.priv_usu = priv_usu;
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
