<%-- 
    Document   : mostrarPanes
    Created on : 10/09/2020, 06:07:00 PM
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
                <a href="index.html">Principal</a>
                <a href="nosotros.html">Nosotros</a>
                <a href="productos.html">Productos</a>
                <a href="contacto.html">Contacto</a>
                <a href="miCuenta.jsp">perfil</a>
            </nav>
        </header>
        <section class="globito">
            <h2>Pan artesanal, escoga el que mas le guste uwu</h2>
            <img src="./img/globito.jpg" alt="Globito">
        </section>
        <h2 class="titulo-p">Pan artesanal</h2>
        <section class="pan">
            
            <%//Obtener la lista de los productos, panes
                Vector<MPan> vecpan=new MPan().listaPanes();
                //recorrer toda la lista de panes
                //estamos instanciando un objeto de mpan y vamos a reccorer el tama;o del vetor de los panes que estan adentro
                for(MPan pan : vecpan){
            %>
            <p class="img">
            <table>
                <tr>
                    <td><%=pan.getNom_pan()%></td>
                    <td><%=pan.getStock_pan()%></td>
                    <td><%=pan.getPre_pan() %></td>
                </tr>
            </table>
            </p>
            <%}%>
        </section>
        <section class="hide">
            
        </section>
        <section class="menu">
            <a href="mostrarPanes.jsp">Mostrar todos los Panes</a>
            <a href="AgregarPan1.jsp">Agregar al carrito de compras</a>
            <a href="CerrarSesion">Cerrar Sesion</a>
        </section>
        <footer class="footer">
            <p>Desarrollado por mi :D</p>
        </footer>
        <script src="./js/anima.js" ></script>
    </body>
</html>
