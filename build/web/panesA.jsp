<%-- 
    Document   : panesA
    Created on : 13/09/2020, 05:17:45 PM
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
                <a href="usuariosA.jsp">Usuarios</a>
                <a href="panesA.jsp">Panes</a>
                <a href="ventas.jasp">Ventas</a>
                <a href="CerrarSesion.jsp">Cerrar Sesion</a>
            </nav>
        </header>
        <section class="log-in">
            <table width="100%" border="0">
                <tr>
                    <th>Nombre del Pan</th>
                    <th>Stock</th>
                    <th>Precio</th>
                    <th colspan="2">Proceso</th>
                </tr>
            
            
            <%//Obtener la lista de los productos, panes
                Vector<MPan> vecpan=new MPan().listaPanes();
                //recorrer toda la lista de panes
                //estamos instanciando un objeto de mpan y vamos a reccorer el tama;o del vetor de los panes que estan adentro
                for(MPan pan : vecpan){
                
                //l usuario selecciona que pan desea
                String direccion="editarPan.jsp?idpan="+pan.getId_pan();
                String direccion2="eliminarPan.jsp?idpan="+pan.getId_pan();
            %>
            
            <form method="post" accion="eliminarPan?idpan=<%=pan.getId_pan()%>">
                <tr>
                    <td><%=pan.getNom_pan( )%></td>
                    <td><%=pan.getStock_pan()%></td>
                    <td>$<%=pan.getPre_pan() %></td>
                    <td><input type="button" value="No" onclick="window.location='editarPan.jsp?idpan=<%=pan.getId_pan()%>';"></td>
                    <td><input type="submit" value="Si"></td>
                </tr>
            </form>
            
            <%}%>
            <tr>
                <td colspan="5" align="center"><button class="bttn-APan"onclick="window.location='agregarPan.jsp';">Agregar nuevo pan ♥</button></td>
            </tr>
            </table>
            <br><br>
            
        </section>
    </body>
</html>
<%}%>