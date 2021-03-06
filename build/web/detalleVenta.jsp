<%-- 
    Document   : detalleVenta
    Created on : 14/09/2020, 11:08:06 PM
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
                <a href="admin.jsp">Principal</a>
                <a href="usuariosA.jsp">Usuarios</a>
                <a href="panesA.jsp">Panes</a>
                <a href="ventas.jsp">Ventas</a>
                <a href="CerrarSesion.jsp">Cerrar Sesion</a>
            </nav>
        </header>
        <section class="sec-com">
            <br><br><br>
            <h3>Mostrar registros por: </h3><br>
            <p>
                <button onclick="window.location='ventas.jsp'">Todos</button>
                <button onclick="window.location='ventasD.jsp'">Dia</button>
                <button onclick="window.location='ventasS.jsp'">Semana</button>
                <button onclick="window.location='ventasM.jsp'">Mes</button>
            </p>
            <br><br>
            <h1>Detalle de la venta</h1>
            <br><br>
            <table width="100%" border="0" align="center">
                <tr>
                    <th>Id del detalle</th>
                    <th>Id del pan</th>
                    <th>Cantidad de panes</th>
                    <th>Subtotal</th>
                    <th colspan="2"></th>
                </tr>
            <%
                Vector<DVenta> vecven=new DVenta().consultarDetalleVenta(Integer.parseInt(request.getParameter("idven")));
                for(DVenta mv : vecven){
                    String direccion="detalleUsuario.jsp?idusu="+mv.getId_eusu();
                    String direccion2="detallePan.jsp?idpan="+mv.getId_pan();
            %>
                <tr>
                    <td align="center"><%=mv.getId_dventa()%></td>
                    <td align="center"><%=mv.getId_pan()%></td>
                    <td align="center"><%=mv.getCant_dventa()%></td>
                    <td align="center">$<%=mv.getSubtotal_dventa()%></td>
                    <td align="center"><a href="<%=direccion%>">Detalle del usuario</a></td>
                    <td align="center"><a href="<%=direccion2%>">Detalle del pan</a></td>
                </tr>
            <%}%>
            </table>
            <br><br><br>
            <center><input type="button" onclick="history.back()" name="volver atrás" value="Volver"></center>
        </section>
        
    </body>
</html>
<%}%>
