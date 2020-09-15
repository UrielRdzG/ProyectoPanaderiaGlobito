<%-- 
    Document   : editarU
    Created on : 13/09/2020, 02:32:39 PM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, Controlador.*" session="true"%>

<%
    String usuario="";
    //sesion del usuario
    HttpSession sesionuser=request.getSession();
    //verificar usuario
    if(sesionuser.getAttribute("usuario")==null){
%>
<jsp:forward page="inicio.jsp">
    <jsp:param name="error" value="Es obligatorio autentificarse con sesion valida"></jsp:param>
</jsp:forward>
<%
    }else{
        usuario=(String)sesionuser.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panaderia Globito</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="shortcut" href="./img/logo.png" type="image/x/icon"/>
    </head>
    <body>
        <header class="header">
            <div class="logo">
                <h1>Panaderia el Globito</h1>
                <img src="./img/logo.png" alt="logo">
            </div>
            <nav class="menu">
                <a href="indexU.html">Principal</a>
                <a href="nosotrosU.html">Nosotros</a>
                <a href="mostrarPanes.jsp">Productos</a>
                <a href="contactoU.html">Contacto</a>
                <a href="miCuenta.jsp">perfil</a>
                <a href="CerrarSesion.jsp">Cerrar Sesion</a>
            </nav>
        </header>
        
        <section class="log-in">
            
            <%
                MUsuario usu = new MUsuario().buscarUsuario(Integer.parseInt(request.getParameter("ideli")));
                
                
            %>
            <table width="100%" border="0">
                <form name="agregarpan" method="post" action="editarUsuarioA">
                    <table width="100%" border="0">
                        <tr>
                            <td>Id</td>
                            <td><input type="text" name="idusu" id="id" readonly="readonly" value="<%=usu.getId_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre" id="nombre" value="<%=usu.getNom_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Apellidos:</td>
                            <td><input type="text" name="apellido" id="apellido" value="<%=usu.getAppat_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Usuario:</td>
                            <td><input type="text" name="user" id="user" value="<%=usu.getUser_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Contraseña</td>
                            <td><input type="text" name="pass" id="pass" value="<%=usu.getPass_usu()%>"></td>
                        </tr>
                    </table>
                    <br><br>
                    <h3>Editar a este usuario?</h3>
                    <br><br>
                    <input type="button" value="No" onclick="window.location='usuariosA.jsp';">
                    <input type="submit" value="Si">
                </form>
            </table>
        </section>
        
    </body>
</html>

