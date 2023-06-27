<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 16/06/2023
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<% String estadoString = "Activo"; %>
<% Articulo articulos = (Articulo) request.getAttribute("articulo"); %>
<% Boolean estado = ((Articulo) request.getAttribute("articulo")).getEstado(); %>
<% if (!estado) {
    estadoString = "Inactivo";
} %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>


<form action="actualizarArticulo.html" method="get">
    <input type="number" id="Id" name="Id" value="<%= articulos.getId() %>" hidden><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= articulos.getNombre() %>"><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" value="<%= articulos.getDescripcion() %>"><br>

    <label for="precio">Precio de Venta:</label>
    <input type="number" id="precio" name="precio" value="<%= articulos.getPrecioVenta() %>"><br>

    <label >Estado del articulo:  <%= estadoString %> </label> <br>

    <input type="submit" value="Modificar" name="btnRedirigir">
</form>


</body>
</html>

<script>
    function mostrarMensaje() {
        var dropdown = document.getElementById("estado");
        var mensaje = document.getElementById("mensaje");

        if (dropdown.value === "Inactivo") {
            mensaje.style.display = "block";
        } else {
            mensaje.style.display = "none";
        }
    }
</script>