<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 16/06/2023
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<% String estadoString = "Activo"; %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
</head>


<body>

<div>
    <h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
    </form>
</div>



<form action="actualizarUsuario.html" method="get" style="text-align: center" onsubmit="return validarPass()">
    <input type="number" id="Id" name="Id" value="<%= usuario.getId() %>" hidden><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombreUsuario() %>" readonly><br>

    <label for="pass">contraseña:</label>
    <input type="password" id="pass" name="pass" value="<%= usuario.getContrasenia() %>" required><br>

    <label for="password2">Reeingrese contraseña:</label>
    <input type="password" id="password2" name="password2"  value="<%= usuario.getContrasenia() %>" required><br>

    <input type="submit" value="Modificar" name="btnRedirigir" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">

</form>

<form action="listaUsuarios.html" method="get" style="text-align: center">
    <input type="hidden" name="volver" >
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Volver</button>
</form>


</body>
</html>

<script>
    function validarPass() {
        var pass = document.getElementById("pass").value;
        var password2 = document.getElementById("password2").value;

        if (pass !== password2) {
            alert("Las contraseñas no coinciden. Por favor, inténtalo de nuevo.");
            return false;
        }

        return true;
    }
</script>