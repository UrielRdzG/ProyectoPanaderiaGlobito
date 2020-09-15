<%-- 
    Document   : contactoU
    Created on : 15/09/2020, 12:19:19 AM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, Controlador.*" session="true"%>

<%
    String usuario,idusuario="";
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
                <a href="indexU.html">Principal</a>
                <a href="nosotrosU.jsp">Nosotros</a>
                <a href="mostrarPanes.jsp">Productos</a>
                <a href="contactoU.jsp">Contacto</a>
                <a href="miCuenta.jsp">Mi cuenta</a>
                <a href="CerrarSesion.jsp">Cerrar Sesion</a>
            </nav>
        </header>
        
        <section class="sec-nos">
            <h1>Nuestras sucursales</h1>
            <br>
            <br>
            <h2 align="center">Sucursal Miguel Hidalgo</h2><br>
            <p align="center">Euler #29, Col. Polanco V Sección, Miguel Hidalgo, CDMX.<br>

            Horario de atención: Lunes a Viernes de 09:00 a 22:00, Sábado y Domingo de 8:00 a 19:00.<br>

            Teléfono de contacto: 8002266783</p><br><br>
            <h2 align="center">Sucursal Alvaro Obregon</h2><br>
            <p align="center">Álvaro Obregón #75 Loc. 75, 77 Y 79 "A Y B, Roma Nte., Cuauhtémoc, CDMX.<br>

            Horario de atención: Lunes a Viernes de 08:30 a 22:00, Sábado y Domingo cerrado.<br>

            Teléfono de contacto: 5552077970</p><br><br>
            <h2 align="center">Sucursal Cuauhtemoc</h2><br>
            <p align="center">Av. Chapultepec #19, Col. Roma Norte, Cuauhteémoc, CDMX.<br>

            Horario de atención: Lunes a Viernes de 08:30 a 22:00, Sábado y Domingo de 9:00 a 19:00.<br>

            Teléfono de contacto: 5551405640</p>
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
