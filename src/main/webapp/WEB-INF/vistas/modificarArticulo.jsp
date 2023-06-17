<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 16/06/2023
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<% Articulo articulos = (Articulo) request.getAttribute("articulo"); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>


<form action="actualizarArticulo.html" method="get">
    <label for="Id">Id:</label>
    <input type="number" id="Id" name="Id" value="<%= articulos.getId() %>"><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= articulos.getNombre() %>"><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" value="<%= articulos.getDescripcion() %>"><br>

    <label for="marca">Marca:</label>
    <input type="text" id="marca" name="marca" value="<%= articulos.getMarca().getMarca() %>"><br>

    <label for="tipo">Tipo:</label>
    <input type="text" id="tipo" name="tipo" value="<%= articulos.getTipoArticulo().getNombreTipo() %>" ><br>

    <label for="precio">Precio de Venta:</label>
    <input type="number" id="precio" name="precio" value="<%= articulos.getPrecioVenta() %>"><br>

    <label for="estado">estado:</label>
    <input type="text" id="estado" name="estado" value="<%= articulos.getEstado() %>"><br>

    <input type="submit" value="Modificar" name="btnRedirigir">
</form>


</body>
</html>
