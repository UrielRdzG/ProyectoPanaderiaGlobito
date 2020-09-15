<%-- 
    Document   : editarPan
    Created on : 13/09/2020, 06:57:18 PM
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
        <section class="log-in">
            <%
                MPan pan=new MPan().buscarPan(Integer.parseInt(request.getParameter("idpan")));
            
            %>
            <br><br><br>
            <form method="post" action="editarPan">
                Id del Pan: <input type="text" name="id" readonly="readonly" value="<%=pan.getId_pan()%>">
                <br><br>
                Nombre del pan: <input type="text" name="nombre" value="<%=pan.getNom_pan()%>">
                <br><br>
                Precio: <input type="" name="precio" value="<%=pan.getPre_pan()%>">
                <br><br>
                Stock: <input type="text" name="stock" value="<%=pan.getStock_pan()%>">
                <br><br>
                Tipo de pan:<select name="tipo" required>
                                <option value="1" selected>Dona</option>
                                <option value="2">Concha</option>
                                <option value="3">Mantecada</option>
                                <option value="4">Cuernito</option>
                                <option value="5">Oreja</option>
                            </select>
                <br><br>
                Sabor del pan:<select name="sabor" required>
                                <option value="1" selected>Chocolate</option>
                                <option value="2">Vainalla</option>
                                <option value="3">Fresa</option>
                                <option value="4">Chocolate con vainilla</option>
                                <option value="5">Caramelo</option>
                            </select>
                <br><br>
                <input type="submit" value="Editar Pancito">
            </form>
            <br><br><br>
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
