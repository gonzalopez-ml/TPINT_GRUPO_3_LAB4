<%@ page import="frgp.utn.edu.ar.entidad.Marca" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="frgp.utn.edu.ar.entidad.TipoArticulo" %><%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 15/06/2023
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ArrayList<Marca> marcas = (ArrayList<Marca>) request.getAttribute("marcas"); %>
<% ArrayList<TipoArticulo> tipoArticulos = (ArrayList<TipoArticulo>) request.getAttribute("tipoArticulos"); %>

<html>
<head>
    <title>Articulo</title>
</head>

<body>

<h1>Registro de Artículos</h1>

<form action="guardarArticulo.html" method="get" onsubmit="return validarFormulario()">
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" pattern="[A-Za-z]+" title="Ingrese solo letras" required><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" pattern="[A-Za-z]+" title="Ingrese solo letras" name="descripcion" required><br>

    <label for="marca">Marca:</label>
    <select name="marca" id="marca">
        <c:forEach var="opcion" items="<%= marcas %>">
            <option value="${opcion.id}">${opcion.marca}</option>
        </c:forEach>
    </select> <br>

    <label for="tipo">Tipo de articulo:</label>
    <select name="tipo" id="tipo">
        <c:forEach var="opcion" items="<%= tipoArticulos %>">
            <option value="${opcion.id}">${opcion.nombreTipo}</option>
        </c:forEach>
    </select> <br>

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

<script>
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value;
        var descripcion = document.getElementById("descripcion").value;

        var precio = document.getElementById("precio").value;
        var cantidad = document.getElementById("cantidad").value;
        var precioCompra = document.getElementById("precioCompra").value;

        var regex = /^[A-Za-z]+$/; // Expresión regular para validar solo letras

        if (!regex.test(nombre) || !regex.test(descripcion)) {
            alert("Hay campos con errores.");
            return false; // Detener el envío del formulario
        }

        if (isNaN(precio) || precio <= 0) {
            alert("El precio debe ser un valor positivo.");
            return false; // Detener el envío del formulario
        }

        if (isNaN(cantidad) || cantidad <= 0) {
            alert("La cantidad debe ser mayor a 0.");
            return false; // Detener el envío del formulario
        }

        if (isNaN(precioCompra) || precioCompra <= 0) {
            alert("El precio de compra debe ser positivo.");
            return false; // Detener el envío del formulario
        }

        return true; // Enviar el formulario si pasa la validación
    }
</script>