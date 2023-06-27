<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.enums.TipoUsuarioEnum" %>
<% ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios"); %>
<% String mensaje = (String) request.getAttribute("mensaje"); %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado Usuarios</title>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
</head>
<body>



<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuario.getTipoUsuario() == TipoUsuarioEnum.vendedor)  { %>

<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
<form action="logout.html" method="post" style="text-align: right">
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
</form>

<table id="tablaUsuariosVendedor" class="display" style="text-align: center">

    <thead>
        <tr>
            <th>Tipo Usuario</th>
            <th>Nombre</th>
            <th>Eliminar</th>
            <th>Modificar</th>
        </tr>
    </thead>
    <tbody>
    <% for (Usuario usuario1 : usuarios) { %>
        <tr style="text-align: center">
            <td><%= usuario1.getTipoUsuario().toString() %></td>
            <td><%= usuario1.getNombreUsuario() %></td>

            <td> <form action="eliminarUsuarioVendedor.html" method="get">
                <input type="hidden" name="idUsuario" value="<%= usuario1.getId() %>">
                <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Eliminar</button>
            </form>
            </td>

            <% if (usuario1.getTipoUsuario() != TipoUsuarioEnum.admin) { %>

            <td> <form action="modificarUsuarioVendedor.html" method="get">
                <input type="hidden" name="idUsuario" value="<%= usuario1.getId() %>">
                <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Modificar</button>
            </form>
            </td>
            <% } %>

        </tr>
        <% } %>
    </tbody>

</table>

<form action="agregarUsuarioVendedor.html" method="post" style="text-align: center">
    <input type="hidden" name="" value="">
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Agregar usuario</button>
</form>

<form action="recuperarArticulos.html" method="get" style="text-align: center">
<input type="hidden" name="volver" >
<button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Volver a articulos</button>
</form>

<% } else { %>

<h1>Ocurrio un error inesperado</h1>
<a href="irLogin.html">Volver al Login</a>

<% } %>


</body>

<% if (mensaje != null) { %>
<script>
    alert("<%= mensaje %>");
</script>
<% } %>


<script>
    $(document).ready(function() {
        $('#tablaUsuariosVendedor').DataTable({
            "paging": true,
            "lengthMenu": [10, 25, 50],
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "columns": [
                { "searchable": true },
                { "searchable": true }
            ]
        });
    });
</script>


</html>
