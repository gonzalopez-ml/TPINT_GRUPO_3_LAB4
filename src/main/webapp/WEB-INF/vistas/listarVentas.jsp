<%@ page import="frgp.utn.edu.ar.entidad.Venta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="frgp.utn.edu.ar.enums.TipoUsuarioEnum" %>
<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.entidad.DetalleVenta" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% ArrayList<Venta> ventas = (ArrayList<Venta>) request.getAttribute("ventas"); %>
<% String mensaje = (String) request.getAttribute("mensajeGuardado"); %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Ventas</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.2/datatables.min.css">
    <script src="https://cdn.datatables.net/v/bs5/dt-1.11.2/datatables.min.js"></script>
</head>
<body>
<%--<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuario.getTipoUsuario() == TipoUsuarioEnum.vendedor)  { %> --%>
<h1>Listado de Ventas</h1>
<table id="tablaVentas" class="display responsive">
    <thead>
    <tr>
        <th data-priority="1">Número de Venta</th>
        <th data-priority="1">Fecha</th>
        <th data-priority="1">Cliente</th>
        <th data-priority="1">Monto Total</th>
        <th data-priority="2"></th>
    </tr>
    </thead>
    <tbody>
    <% for (Venta venta : ventas) { %>
    <tr>
        <td><%= venta.getId() %>
        </td>
        <td><%= venta.getFechaVenta() %>
        </td>
        <td><%= venta.getIdCliente().getNombre() %> <%= venta.getIdCliente().getApellido() %>
        </td>
        <td><%= venta.getMontoTotal() %>
        </td>
        <td class="detalle">
            <table>
                <thead>
                <tr>
                    <th>Producto</th>
                    <th>Precio de Venta</th>
                    <th>Cantidad</th>
                    <th>Importe</th>
                </tr>
                </thead>
                <tbody>
                <% for (DetalleVenta detalle : venta.getDetalles()) { %>
                <tr>
                    <td><%= detalle.getIdArticulo().getNombre() %>
                    </td>
                    <td><%= detalle.getPrecioVenta() %>
                    </td>
                    <td><%= detalle.getCantidad() %>
                    </td>
                    <td><%= detalle.getImporte() %>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<%--        <% } else { %>

    <h1>Ocurrio un error inesperado</h1>
    <a href="irLogin.html">Volver al Login</a>

        <% } %>--%>

</body>
</html>
<% if (mensaje != null) { %>
<script>
    alert("<%= mensaje %>");
</script>
<% } %>
<script>
    $(document).ready(function () {
        $('#tablaVentas').DataTable({
            "responsive": {
                "details": {
                    "type": 'column',
                    "target": -1
                }
            },
            "columnDefs": [
                {
                    "targets": -1,
                    "className": 'detalle',
                    "orderable": false
                }
            ],
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });


    });

</script>
