<%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 15/06/2023
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Articulo</title>
</head>

<body>

<h1>Registro de Artículos</h1>

<form action="guardarArticulo.html" method="get">
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" required><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" required><br>

    <label for="marca">Marca:</label>
    <input type="number" id="marca" name="marca" required><br>

    <label for="tipo">Tipo:</label>
    <input type="number" id="tipo" name="tipo" required><br>

    <label for="precio">Precio de Venta:</label>
    <input type="number" id="precio" name="precio" required><br>

    <label for="cantidad">cantidad:</label>
    <input type="number" id="cantidad" name="cantidad" required><br>

    <label for="precioCompra">precio de compra:</label>
    <input type="number" id="precioCompra" name="precioCompra" required><br>

    <button type="submit">Guardar</button>
</form>

</body>
</html>
