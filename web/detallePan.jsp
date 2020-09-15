<%-- 
    Document   : detallePan
    Created on : 14/09/2020, 11:44:26 PM
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
                <a href="admin.jsp">Principal</a>
                <a href="usuariosA.jsp">Usuarios</a>
                <a href="panesA.jsp">Panes</a>
                <a href="ventas.jsp">Ventas</a>
                <a href="CerrarSesion.jsp">Cerrar Sesion</a>
            </nav>
        </header>
        
        <section class="sec-com">
            
            <h1>Detalle del pan</h1>
            
            <%
                MPan pan = new MPan().buscarPan(Integer.parseInt(request.getParameter("idpan")));
                
                
            %>
            <table width="100%" border="0">
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="idusu" id="id" readonly="readonly" value="<%=pan.getId_pan()%>"></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" id="nombre" readonly="readonly" value="<%=pan.getNom_pan()%>" onkeypress="return validarL(event)" maxlength="50" required></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="apellido" id="apellido" readonly="readonly" value="<%=pan.getPre_pan()%>" onkeypress="return validarL(event)" maxlength="50" required></td>
                </tr>
                <tr>
                    <td>Stock Actual</td>
                    <td><input type="text" name="user" id="user" readonly="readonly" value="<%=pan.getStock_pan()%>" onkeypress="return validarLN(event)" maxlength="20" required></td>
                </tr>
            </table>
                
            <input type="button" onclick="history.back()" name="volver atrás" value="Volver">
        </section>
        
    </body>
</html>
