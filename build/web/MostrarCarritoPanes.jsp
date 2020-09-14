<%-- 
    Document   : MostrarCarritoPanes
    Created on : 10/09/2020, 07:22:48 PM
    Author     : uriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, Controlador.*"
        session="true"%>

<%
String usuario = "";
//sesion del usuario
HttpSession sesionuser = request.getSession();
//verficar el usuario
if(sesionuser.getAttribute("usuario") == null){
%>

<jsp:forward page="inicio.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
        usuario = (String)sesionuser.getAttribute("usuario");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>PanaderiaGlobito</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <nav class="menu" >
                <a href="#">Principal</a>
                <a href="#">Nosotros</a>
                <a href="mostrarPanes.jsp">Productos</a>
                <a href="#">Contacto</a>
                <a href="miCuenta.jsp" >Perfil</a>
            </nav>
        </header>
        <section class="globito" >
            <h2>Pan artesanal, escoja el que mas le guste uwu</h2>
            <img src="./img/globito.jpg" alt="Globito" >
        </section>
        <h2 class="titutlo-p" >Pan Artesanal</h2>
        <section class="log-in" >
            
            <table width="100%" border="0" >
                <tr>
                    <th>Nombre del Pan</th>
                    <th>Cantidad</th>
                    <th>SubTotal</th>
                    
                </tr>
            
            
            
            <% 
                Vector<DVenta> detalleVentas = 
                        (Vector<DVenta>)sesionuser.getAttribute("detalleVenta");
                Vector<MPan> stockPanes = null;
                
                
                for(DVenta dventa: detalleVentas){
                    
                //necesitamos buscar el id del pan que se esta escogiendo
                MPan pan = new MPan().buscarPan(dventa.getId_pan());
                
            %>
            
                <tr>
                    <td><%=pan.getNom_pan() %></td>
                    <td><%=dventa.getCant_dventa()  %>  </td>
                    <td><%=dventa.getSubtotal_dventa()
                        /*un atributo mas para obtener
                            la url de la imagen correspondiente del pan*/
                        %>  </td>
                    
                </tr>
            <%}%>
            <tr>
                <td></td>
                <td><a href="FinalizarCompra" >Pagar Panes</a></td>
            </tr>
            </table></p>
        </section>
        
        </table>
        <section class="hide" >
            
        </section>
        <section class="menu2" >
            <a href="mostrarPanes.jsp" >Mostrar todos los Panes</a>
            <a href="AgregarPan1.jsp" >Agregar al Carrito de Compras</a>
        </section>
        <footer class="footer" >
            <p>Desarrollado por mi</p>
        </footer>
        <script src="./js/anima.js" ></script>
    </body>
</html>
