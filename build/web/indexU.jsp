<%-- 
    Document   : indexU
    Created on : 15/09/2020, 12:11:41 AM
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
        <section class="globito">
            <br><center><h1>Bienvenido <%=usuario%></h1></center><br>
            <h2>La panaderia el globito, hace pan artesanal desde 1842, y ahora esta en la nube, compre su panecito aqui (*w*)</h2>
            <img src="./img/globito.jpg" alt="Globito">
        </section>
        <h2 class="titulo-p">Pan artesanal</h2>
        <section class="pan">
            <img class="img" src="./img/pan01.jpg" alt="photo1">
            <img class="img" src="./img/pan02.jpg" alt="photo2">
            <img class="img" src="./img/pan03.jpg" alt="photo3">
            <img class="img" src="./img/pan04.jpg" alt="photo4">
            <img class="img" src="./img/pan05.jpg" alt="photo5">
            <img class="img" src="./img/pan06.jpg" alt="photo6">
            <img class="img" src="./img/pan07.jpg" alt="photo7">
            <img class="img" src="./img/pan08.jpg" alt="photo8">
            <img class="img" src="./img/pan09.jpg" alt="photo9">
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
