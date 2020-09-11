<%-- 
    Document   : CerrarSesion
    Created on : 10/09/2020, 08:05:43 PM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    
    HttpSession sesionuser = request.getSession();
    sesionuser.invalidate();
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
                <a href="nosotros.html">Nosotros</a>
                <a href="productos.html">Productos</a>
                <a href="contacto.html">Contacto</a>
                <a href="registro.jsp">Registrarse</a>
            </nav>
        </header>
        <section class="log-in">
            <br><br><br><br><br>
            
            <br><br><br><br><br>
        </section>
        <section class="hide">
            
        </section>
        <footer class="footer">
            <p>Desarrollado por mi :D</p>
        </footer>
        <script src="./js/anima.js" ></script>
    </body>
</html>
