<%-- 
    Document   : Errores2
    Created on : 14/09/2020, 07:53:40 PM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    String usuario="";
    HttpSession sesionUser=request.getSession();
    if(sesionUser.getAttribute("usuario")==null){
%>
<jsp:forward page="inicio.jsp">
    <jsp:param name="error" value="Es obligatorio Autentificarte"/>
</jsp:forward>
<%}else{
    usuario=(String)sesionUser.getAttribute("usuario");
}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" 
              rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/x-icon"/>
    </head>
    <body>
        <header class="header" >
            <div class="logo" >
                <h1>Panederia el Globito</h1>
                <img src="./img/logo.jpg" alt="logo">       
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
        <section class="globito" >
            <h2>La panadería el globito, hace pan artesanal desde 1842, y ahora esta en la nube
            compre su panecito aqui *w* nwn (*w*)</h2>
            <img src="./img/globito.jpg" alt="Globito" >
        </section>
        <h2 class="titutlo-p" >Pan Artesanal</h2>
        
        <section class="hide" >
            
        </section>
        <section class="log-in" >
            <h2>Error al momento de ingresar sus credenciales favor de intentarlo de nuevo</h2>
        </section>
        <footer class="footer" >
            <p>Desarrollado por mi </p>
        </footer>
        
        
    </body>
</html>
