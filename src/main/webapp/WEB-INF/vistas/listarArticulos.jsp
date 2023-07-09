<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
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
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
</head>
<body>

<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuario.getTipoUsuario() == TipoUsuarioEnum.vendedor)  { %>

<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>

<div>
<div style="text-align: center;">
<form action="logout.html" method="post" style="text-align: right">
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
</form>
</div>

    <div style="text-align: center">
        <form action="recuperarClientes.html" method="post" style="display: inline-block;" >
            <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Clientes</button>
        </form>
        <form action="listarStock.html" method="post" style="display: inline-block;" >
            <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Stock</button>
        </form>
        <form action="listaUsuariosVendedor.html" method="post" style="display: inline-block;">
            <input type="hidden" name="idUsuario" value="<%= usuario.getId() %>">
            <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Usuarios</button>
        </form>

    </div>



<table id="tablaArticulos" class="display" style="text-align: center">


    <thead>
        <tr>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio de Venta</th>
            <th>Estado</th>
            <th>Marca</th>
            <th>Modificar</th>
            <th>Eliminar</th>
        </tr>
    </thead>
    <tbody>
    <% for (Articulo articulo : articulos) { %>
        <tr style="text-align: center">
            <td><%= articulo.getNombre() %></td>
            <td><%= articulo.getDescripcion() %></td>
            <td><%= articulo.getPrecioVenta() %></td>
            <td>Activo</td>
            <td><%= articulo.getMarca().getMarca() %></td>
            <td> <form action="articuloParaActualizar.html" method="get">
                <input type="hidden" name="idArticuloAActualizar" value="<%= articulo.getId() %>">
                <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Modificar</button>
            </form>
            </td>
            <td> <form action="eliminarArticulo.html" onclick="return confirm('¿Estás seguro de continuar, se eliminará el artículo?')" method="get">
                <input type="hidden" name="idArticuloAeliminar" value="<%= articulo.getId() %>">
                <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Eliminar</button>
            </form>
            </td>
        </tr>
        <% } %>
    </tbody>

</table>

<form action="guardar_archivo.html" method="get" style="text-align: center;">
    <input type="hidden" name="" value="">
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Crear articulo</button>
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
    $(document).ready(function () {
        $('#tablaArticulos').DataTable({
            "paging": true,
            "lengthChange": true,
            "lengthMenu": [10, 25, 50],
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "columns": [
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
            ]
        });
    });
</script>
</html>