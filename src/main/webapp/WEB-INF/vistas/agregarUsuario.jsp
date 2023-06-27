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
<% String mensaje = (String) request.getAttribute("mensaje"); %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<html>
<head>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <title>Usuario</title>
</head>

<body>


<% if (mensaje != null) { %>
<script>
    alert("<%= mensaje %>");
</script>
<% } %>

<div>
    <h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
    </form>
</div>



<form action="guardarUsuario.html" method="post" onsubmit="return validarPass()" style="text-align: center;">
    <h1>Registro de Usuario</h1>

    <label for="nombre">Nombre Usuario:</label>
    <input type="text" id="nombre" name="nombre" required><br>

    <label for="password">Contraseña:</label>
    <input type="password" id="password" name="password" required><br>

    <label for="password2">Reeingrese contraseña:</label>
    <input type="password" id="password2" name="password2" required><br>

    <label for="tipo">Tipo de usuario:</label>
    <select name="tipo" id="tipo">
            <option value="admin">Admin</option>
            <option value="vendedor">Vendedor</option>
            <option value="contador">Contador</option>
    </select> <br>

    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Guardar</button>
</form>

<form action="listaUsuarios.html" method="get" style="text-align: center">
    <input type="hidden" name="volver" >
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Volver</button>
</form>


</body>
</html>


<script>
    function validarPass() {
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;

        if (password !== password2) {
            alert("Las contraseñas no coinciden. Por favor, inténtalo de nuevo.");
            return false;
        }

        return true;
    }
</script>
