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
<% String mensaje = (String) request.getAttribute("mensaje"); %>

<html>
<head>
    <title>Usuario</title>
</head>

<body>


<% if (mensaje != null) { %>
<script>
    alert("<%= mensaje %>");
</script>
<% } %>

<h1>Registro de Usuario</h1>

<form action="guardarUsuario.html" method="post">
    <label for="nombre">Nombre Usuario:</label>
    <input type="text" id="nombre" name="nombre" required><br>

    <label for="password">Contraseña:</label>
    <input type="text" id="password" name="password" required><br>

    <label for="tipo">Tipo de usuario:</label>
    <select name="tipo" id="tipo">
            <option value="admin">Admin</option>
            <option value="vendedor">Vendedor</option>
            <option value="contador">Contador</option>
    </select> <br>

    <button type="submit">Guardar</button>
</form>

</body>
</html>
