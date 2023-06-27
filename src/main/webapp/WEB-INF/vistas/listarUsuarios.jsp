<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.enums.TipoUsuarioEnum" %>
<% ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios"); %>
<% String mensaje = (String) request.getAttribute("mensaje"); %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado Articulos</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
</head>
<body>


<% if (mensaje != null) { %>
<script>
    alert("<%= mensaje %>");
</script>
<% } %>


<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuario.getTipoUsuario() == TipoUsuarioEnum.admin)  { %>


<table id="tablaArticulos" class="display">
<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
    <thead>
        <tr>
            <th>Tipo Usuario</th>
            <th>Nombre</th>

            <th>Eliminar</th>
        </tr>
    </thead>
    <tbody>
    <% for (Usuario usuario1 : usuarios) { %>
        <tr>
            <td><%= usuario1.getTipoUsuario().toString() %></td>
            <td><%= usuario1.getNombreUsuario() %></td>

            <td> <form action="eliminarUsuario.html" method="get">
                <input type="hidden" name="idUsuario" value="<%= usuario1.getId() %>">
                <button type="submit">Eliminar</button>
            </form>
            </td>
        </tr>
        <% } %>
    </tbody>

</table>

<form action="agregarUsuario.html" method="post">
    <input type="hidden" name="" value="">
    <button type="submit">Agregar usuario</button>
</form>

<% } else { %>

<h1>Ocurrio un error inesperado</h1>
<a href="irLogin.html">Volver al Login</a>

<% } %>

</body>


<script>
$(document).ready(function() {
    $('#tablaArticulos').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "columns": [
            { "searchable": true },
            { "searchable": true },
        ]
    });
});
</script>
</html>