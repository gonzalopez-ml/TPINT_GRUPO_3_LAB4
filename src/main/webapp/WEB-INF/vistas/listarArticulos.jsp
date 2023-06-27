<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.enums.TipoUsuarioEnum" %>
<% ArrayList<Articulo> articulos = (ArrayList<Articulo>) request.getAttribute("articulos"); %>
<% String mensaje = (String) request.getAttribute("mensajeGuardado"); %>
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

<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuario.getTipoUsuario() == TipoUsuarioEnum.vendedor)  { %>

<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>

<div style="text-align: center;">
<form action="logout.html" method="post">
    <button type="submit">Desloguear</button>
</form>

<form action="listaUsuariosVendedor.html" method="post">
    <input type="hidden" name="idUsuario" value="<%= usuario.getId() %>">
    <button type="submit">Usuarios</button>
</form>
</div>
<table id="tablaArticulos" class="display">


    <thead>
        <tr>
            <th>Nombre</th>
            <th>Descripci�n</th>
            <th>Precio de Venta</th>
            <th>Estado</th>
            <th>Modificar</th>
            <th>Eliminar</th>
        </tr>
    </thead>
    <tbody>
    <% for (Articulo articulo : articulos) { %>
        <tr>
            <td><%= articulo.getNombre() %></td>
            <td><%= articulo.getDescripcion() %></td>
            <td><%= articulo.getPrecioVenta() %></td>
            <td><%= articulo.getEstado() %></td>
            <td> <form action="articuloParaActualizar.html" method="get">
                <input type="hidden" name="idArticuloAActualizar" value="<%= articulo.getId() %>">
                <button type="submit">Modificar</button>
            </form>
            </td>
            <td> <form action="eliminarArticulo.html" method="get">
                <input type="hidden" name="idArticuloAeliminar" value="<%= articulo.getId() %>">
                <button type="submit">Eliminar</button>
            </form>
            </td>
        </tr>
        <% } %>
    </tbody>

</table>

<form action="guardar_archivo.html" method="get">
    <input type="hidden" name="" value="">
    <button type="submit">Crear articulo</button>
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
    $('#tablaArticulos').DataTable({
        "paging": true,
        "lengthChange": true,
        "lengthMenu": [10, 25, 50],
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "columns": [
            { "searchable": true },
            { "searchable": true },
            { "searchable": true },
            { "searchable": true },
            { "searchable": true },
            { "searchable": true },
        ]
    });
});
</script>
</html>