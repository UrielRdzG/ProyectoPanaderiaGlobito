<%-- 
    Document   : miCuenta
    Created on : 9/09/2020, 10:45:54 AM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, Controlador.*" session="true"%>

<%
    String usuario="";
    Integer idusuario;
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
        idusuario=(Integer)session.getAttribute("idusuario");
        System.out.println(idusuario);
    
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
        <section class="globito">
            <h2>Pan artesanal, escoga el que mas le guste uwu</h2>
            <img src="./img/globito.jpg" alt="Globito">
        </section>
        <h2 class="titulo-p">Pan artesanal</h2>
        <section class="log-in">
            
            <%//Crear la instancia, para poder buscar la pieza que se queire comprar
                MUsuario usu = new MUsuario().buscarUsuario(idusuario);
                String direccion="editarCuenta.jsp?idusu="+usu.getId_usu();
                
            %>
            <table width="100%" border="0">
                    <table width="100%" border="0">
                        <tr>
                            <td>Nombre:</td>
                            <td><input type="text" name="nombre" id="nombre" readonly="readonly" value="<%=usu.getNom_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Apellido:</td>
                            <td><input type="text" name="appat" id="appat" readonly="readonly" value="<%=usu.getAppat_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Usuario:</td>
                            <td><input type="text" name="user" id="user" readonly="readonly" value="<%=usu.getUser_usu()%>"></td>
                        </tr>
                        <tr>
                            <td>Contraseña:</td>
                            <td><input type="text" name="pass" id="pass" readonly="readonly" value="<%=usu.getPass_usu()%>"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="<%=direccion%>">Editar Perfil</a></td>
                        </tr>
                    </table>
            </table>
        </section>
        <section class="hide">
            
        </section>
        <footer class="footer">
            <p>Desarrollado por mi :D</p>
        </footer>
        <script src="./js/anima.js" ></script>
    </body>
</html>
<%}%>
