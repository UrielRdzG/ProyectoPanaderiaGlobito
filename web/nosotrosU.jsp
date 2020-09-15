<%-- 
    Document   : nosotrosU
    Created on : 15/09/2020, 12:17:40 AM
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
        <section class="sec-con">
            <h2 align="center">Nuestra mision</h2>

            <p><img src="./img/nosotros.jpg" alt="Nosotros"><br>
            Somos una empresa dedicada a la elaboración de productos de panadería y pastelería comprometidos 
            con nuestros clientes en brindarles productos de gran calidad y sabor con un servicio amable y oportuno.</p>

            <br><br><h2>Nuestra vision</h2><br>

            <p><img src="./img/nosotros2.jpg" alt="Nosotros" class="sec-con-der"><br><br>Ser una empresa altamente competitiva, innovadora y sobresaliente en el mercado nacional de panaderías, 
                alcanzando un alto nivel de desarrollo humano y tecnológico.</p>
            
            <br><br><br>
            
            <h2 align="center">Nuestros valores</h2><br>
            
            <p align="center">Responsabilidad<br><br>

                Puntualidad<br><br>

                Respeto<br><br>

                Honradez<br><br>

                Honestidad<br><br>

                Trabajo en equipo</p>
            <br><br>
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
