<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.enums.TipoUsuarioEnum" %>
<%@ page import="frgp.utn.edu.ar.entidad.Venta" %>
<%@ page import="frgp.utn.edu.ar.entidad.Cliente" %>
<% String mensaje = (String) request.getAttribute("mensajeGuardado"); %>
<% ArrayList<Cliente> clientes = (ArrayList<Cliente>) session.getAttribute("clientes"); %>
<% ArrayList<Venta> ventas = (ArrayList<Venta>) session.getAttribute("ventas"); %>
<% Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario"); %>


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

<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuarioLogueado.getTipoUsuario() == TipoUsuarioEnum.contador)  { %>

<h1 style="text-align: center">Bienvenido usuario <%= usuarioLogueado.getTipoUsuario() %> </h1>

<div>
<div style="text-align: center;">
<form action="logout.html" method="post" style="text-align: right">
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
</form>
</div>

<table id="tablaArticulos" class="display" style="text-align: center">


    <thead>
        <tr>
            <th>Estado Venta</th>
            <th>Fecha Venta</th>
            <th>Monto total</th>
            <th>usuario</th>

        </tr>
    </thead>
    <tbody>
    <% for (Venta venta : ventas) { %>
        <tr style="text-align: center">
            <td><%= venta.getEstadoVenta() %></td>
            <td><%= venta.getFechaVenta() %></td>
            <td><%= clientes.get(venta.getIdCliente().getId().intValue()).getNombre() %></td>

        </tr>
        <% } %>
    </tbody>

</table>

<form action="recuperarReporte.html" method="get" style="text-align: center;">
    <input type="hidden" name="" value="">
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Volver</button>
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