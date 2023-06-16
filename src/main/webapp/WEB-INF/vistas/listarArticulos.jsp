<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="frgp.utn.edu.ar.entidad.Articulo" %>
<% ArrayList<Articulo> articulos = (ArrayList<Articulo>) request.getAttribute("articulos"); %>    
   
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
<table id="tablaArticulos" class="display">

    <thead>
        <tr>
            <th>Nombre</th>
            <th>Descripci�n</th>
            <th>Precio de Venta</th>
            <th>Estado</th>
            <th>Modificar</th>
        </tr>
    </thead>
    <tbody>
        <% for (Articulo articulo : articulos) { %>
        <tr>
            <td><%= articulo.getNombre() %></td>
            <td><%= articulo.getDescripcion() %></td>
            <td><%= articulo.getPrecioVenta() %></td>
            <td><%= articulo.getEstado() %></td>
            <td>     <form action="articuloParaActualizar.html" method="get">
                <input type="hidden" name="idArticuloActualizar" value="<%= articulo.getId() %>">
                <button type="submit">Modificar</button>
            </form>
            </td>
        </tr>
        <% } %>
    </tbody>

</table>

</body>
<script>
$(document).ready(function() {
    $('#tablaArticulos').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
    });
});
</script>
</html>