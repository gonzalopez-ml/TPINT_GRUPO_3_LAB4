<%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 16/06/2023
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form action="/actualizarArticulo" method="post">
    <label for="id">Id:</label>
    <input type="text" id="id" name="nombre" value="${articulo.id}"><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="${articulo.nombre}"><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" value="${articulo.descripcion}"><br>

    <label for="marca">Marca:</label>
    <input type="number" id="marca" name="marca" value=""${articulo.marcaId}"><br>

    <label for="tipo">Tipo:</label>
    <input type="number" id="tipo" name="tipo" value=""${articulo.tipoId}"><br>

    <label for="precio">Precio de Venta:</label>
    <input type="number" id="precio" name="precio" value=""${articulo.precio}"><br>

    <label for="estado">estado:</label>
    <input type="text" id="estado" name="fecha" value=""${articulo.estado}"><br>

    <input type="submit" value="Modificar" name="btnRedirigir">
</form>


</body>
</html>
