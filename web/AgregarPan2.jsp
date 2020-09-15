<%-- 
    Document   : AgregarPan2
    Created on : 10/09/2020, 06:39:05 PM
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
                MPan pan = new MPan().buscarPan(Integer.parseInt(request.getParameter("cod")));
                
                
            %>
            <table width="100%" border="0">
                <form name="agregarpan" method="post" action="AgregarPanCarrito">
                    <table width="100%" border="0">
                        <tr>
                            <td>Codigo</td>
                            <td><input type="text" name="id" id="id" readonly="readonly" value="<%=pan.getId_pan()%>"></td>
                        </tr>
                        <tr>
                            <td>Nombre del Pan:</td>
                            <td><input type="text" name="pan" id="pan" readonly="readonly" value="<%=pan.getNom_pan()%>"></td>
                        </tr>
                        <tr>
                            <td>Precio del Pan:</td>
                            <td><input type="text" name="precio" id="precio" readonly="readonly" value="<%=pan.getPre_pan()%>"></td>
                        </tr>
                        <tr>
                            <td>Stock del Pan:</td>
                            <td><input type="text" name="stock" id="stock" readonly="readonly" value="<%=pan.getStock_pan()%>"></td>
                        </tr>
                        <tr>
                            <td>Cantidad:</td>
                            <td><input type="text" name="cantidad" id="cantidad" value="1"></td>
                        </tr>
                        <tr>
                            <td><input type="button" value="Volver" onclick="window.location='AgregarPan1.jsp';"></td>
                            <td><input type="submit" name="comprar" value="Registrar Compra"></td>
                        </tr>
                    </table>
                </form>
            </table>
            <br><br><br><br>
        </section>
        <section class="hide">
            
        </section>
        
        <footer class="footer">
            <p>Desarrollado por mi :D</p>
        </footer>
        <script src="./js/anima.js" ></script>
    </body>
</html>

