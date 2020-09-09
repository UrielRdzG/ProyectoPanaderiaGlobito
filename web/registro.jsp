<%-- 
    Document   : registro
    Created on : 3/09/2020, 05:53:47 PM
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
                <a href="productos.html">Productos</a>
                <a href="contacto.html">Contacto</a>
            </nav>
        </header>
        <section class="log-in">
            <br><br><br><br><br>
            <table width="800" border="0" align="center">
                <tr>
                    <td colspan="2"><h2>Registro</h2></td>
                </tr>
                <tr>
                    <td>
                        <form method="post" name="formulario" action="RegistrarUsuario">
                            <table width="620" border="0">
                                <tr>
                                    <td>Nombre:</td>
                                    <td><input type="text" name="nombre" id="nombre"></td>
                                </tr>
                                <tr>
                                    <td>Apellido:</td>
                                    <td><input type="text" name="apellido" id="apellido"></td>
                                </tr>
                                <tr>
                                    <td>Usuario:</td>
                                    <td><input type="text" name="user" id="user"></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" name="pass" id="pass"></td>
                                </tr>
                                <tr>
                                    <td><a href="Inicio.jsp">Ya tengo una cuenta</a></td>
                                    <td><input type="submit" value="Entrar" name="inicio"></td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
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
