<%@ page import="frgp.utn.edu.ar.entidad.Marca" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="frgp.utn.edu.ar.entidad.TipoArticulo" %>
<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %><%--
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
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<html>
<head>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <title>Articulo</title>
</head>

<body>

<div>
    <h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
    </form>
</div>



<form action="guardarArticulo.html" method="get" onsubmit="return validarFormulario()" style="text-align: center">
    <h1>Registro de Artículos</h1>
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

    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Guardar</button>
</form>

</body>
</html>

<script>
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value;
        var descripcion = document.getElementById("descripcion").value;

        var precio = document.getElementById("precio").value;

        var regex = /^[a-zA-Z\s]+$/; // Expresión regular para validar solo letras

        if (!regex.test(nombre) || !regex.test(descripcion)) {
            alert("Hay campos con errores.");
            return false; // Detener el envío del formulario
        }

        if (isNaN(precio) || precio <= 0) {
            alert("El precio debe ser un valor positivo.");
            return false; // Detener el envío del formulario
        }

        return true; // Enviar el formulario si pasa la validación
    }
</script>