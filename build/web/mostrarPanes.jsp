<%-- 
    Document   : mostrarPanes
    Created on : 9/09/2020, 07:04:05 AM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a href="mostrarPanes.jsp">Productos</a>
                <a href="contacto.html">Contacto</a>
                <a href="miCuenta.html">miCuenta</a>
                <a href="#">Cerrar sesion</a>
            </nav>
        </header>
        <section class="globito">
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
