<%-- 
    Document   : ventasD
    Created on : 14/09/2020, 10:21:26 PM
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
            <br><br><br>
            <table width="100%" border="0" align="center">
                <tr>
                    <th>ID</th>
                    <th>Fecha de venta(Año/Mes/Dia)</th>
                    <th>Total de la venta</th>
                    <th colspan="2">Acciones</th>
                </tr>
            <%//Obtener la lista de usuarios
                Vector<MVenta> vecven=new MVenta().consultarVentasDia();
                //recorrer toda la lista de panes
                //estamos instanciando un objeto de mpan y vamos a reccorer el tama;o del vetor de los panes que estan adentro
                for(MVenta mv : vecven){
                    String direccion="eliminarU.jsp?ideli="+mv.getId_venta();
                    String direccion2="editarU.jsp?ideli="+mv.getId_venta();
                
            %>
                <tr>
                    <td><%=mv.getId_venta()%></td>
                    <td align="center"><%=mv.getFecha_venta()%></td>
                    <td>$<%=mv.getTotal_venta()%></td>
                    <td><a><a href="<%=direccion2%>">Editar</a></a></td>
                    <td><a><a href="<%=direccion%>">Eliminar</a></a></td>
                </tr>
            <%}%>
        </section>
        
    </body>
</html>
<%}%>

