<%-- 
    Document   : usuariosA
    Created on : 13/09/2020, 01:14:08 PM
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
                <a href="index.html">Principal</a>
                <a href="usuariosA.jsp">Usuarios</a>
                <a href="productos.html">Panes</a>
                <a href="contacto.html">Ventas</a>
                <a href="CerrarSesion.jsp">Cerrar Sesion</a>
            </nav>
        </header>
        <section class="log-in">
            <table width="100%" border="0" align="center">
                <tr>
                    <th>ID</th>
                    <th>Nombre(s)</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>Contraseña</th>
                    <th colspan="2">Acciones</th>
                </tr>
            <%//Obtener la lista de usuarios
                Vector<MUsuario> vecusu=new MUsuario().consultarUsuarios();
                //recorrer toda la lista de panes
                //estamos instanciando un objeto de mpan y vamos a reccorer el tama;o del vetor de los panes que estan adentro
                for(MUsuario usu : vecusu){
                    String direccion="eliminarU.jsp?ideli="+usu.getId_usu();
                    String direccion2="editarU.jsp?ideli="+usu.getId_usu();
                
            %>
                <tr>
                    <td><%=usu.getId_usu()%></td>
                    <td><%=usu.getNom_usu()%></td>
                    <td><%=usu.getAppat_usu()%></td>
                    <td><%=usu.getUser_usu()%></td>
                    <td><%=usu.getPass_usu()%></td>
                    <td><a><a href="<%=direccion2%>">Editar</a></a></td>
                    <td><a><a href="<%=direccion%>">Eliminar</a></a></td>
                </tr>
            <%}%>
        </section>
        
    </body>
</html>
<%}%>