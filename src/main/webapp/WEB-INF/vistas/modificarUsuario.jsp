<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 16/06/2023
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<% String estadoString = "Activo"; %>
<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>

<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
<form action="logout.html" method="post">
    <button type="submit">Desloguear</button>
</form>


<form action="actualizarUsuario.html" method="get" style="text-align: center">
    <input type="number" id="Id" name="Id" value="<%= usuario.getId() %>" hidden><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombreUsuario() %>" readonly><br>

    <label for="pass">contraseña:</label>
    <input type="text" id="pass" name="pass" value="<%= usuario.getContrasenia() %>" required><br>

    <input type="submit" value="Modificar" name="btnRedirigir">

</form>

<form action="listaUsuarios.html" method="get" style="text-align: center">
    <input type="hidden" name="volver" >
    <button type="submit">Volver</button>
</form>


</body>
</html>
