<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="frgp.utn.edu.ar.entidad.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="org.springframework.cglib.core.Local" %>
<% ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("clientes"); %>
<% ArrayList<Articulo> articulos = (ArrayList<Articulo>) request.getAttribute("articulos"); %>
<% LocalDate fecha = (LocalDate) request.getAttribute("fecha"); %>
<% Long ultFact = (Long) request.getAttribute("nroFactura"); %>
<%--<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>--%>
<html>
<head>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <title>Venta</title>
    <style>
        .detalle-container {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%--<div>
    <h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %>
    </h1>
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit"
                style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">
            Desloguear
        </button>
    </form>
</div>--%>
<form action="guardarVenta.html" method="post" style="text-align: center" onsubmit="validarFormulario();">
    <h1>Registro de Ventas</h1>
    <div>
        <div style="float:left;">
            <label for="idCliente" id="idCliente">Cliente:</label>
            <select name="idCliente" required>
                <option value="-1">Seleccionar Cliente</option>
                <% for (Cliente cliente : clientes) { %>
                <option value="<%= cliente.getId() %>"><%= cliente.getNombre() %> <%= cliente.getApellido() %>
                </option>
                <% } %>
            </select>
        </div>
        <div id="datos" style="float: right;">
            <label for="fecha" id="fecha">Fecha: <%= fecha %>
            </label>
            <input hidden name="fecha" value="<%=fecha%>" />
            <br>
            <label for="nroFac" id="nroFac">Factura N°: <%= ultFact %>
            </label>
        </div>
    </div>
    <br><br>
    <table>
        <thead>
        <tr>
            <th>Articulo</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Subtotal</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody id="detalles-container">
        <tr>
            <td>
                <select name="detalle[].idArticulo" required onchange="obtenerPrecioVenta(this)">
                    <option value="-1">Seleccionar articulo</option>
                    <% for (Articulo articulo : articulos) { %>
                    <option data-precioventa="<%= articulo.getPrecioVenta() %>" value="<%= articulo.getId() %>"><%= articulo.getNombre() %>
                    </option>
                    <% } %>
                </select>
            </td>
            <td>
                <input type="number" name="detalle[].cantidad" required>
            </td>
            <td>
                <input id="precioventa" type="text" name="detalle[].PrecioVenta" disabled>
            </td>
            <td>
                <input type="text" name="detalle[].MontoTotal" disabled>
            </td>
            <td>
                <button type="button" onclick="agregarDetalle()">Nuevo</button>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
    <br><br>
    <input type="submit"
           style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;"
           value="Registrar venta">
    <input name="MontoTotal" type="text" disabled />
</form>


</body>
<script>
    function agregarDetalle() {
        var container = document.getElementById('detalles-container');
        var detalleContainer = document.createElement('tr');
        detalleContainer.classList.add('detalle-container');

        var html = '<td><select name="detalle[].idArticulo" required onchange="obtenerPrecioVenta(this)">';
        html += '<option value="-1">Seleccionar artículo</option>';
        html += '<% for (Articulo articulo : articulos) { %>';
        html += '<option data-precioventa="<%= articulo.getPrecioVenta() %>" value="<%= articulo.getId() %>"><%= articulo.getNombre()%></option>';
        html += '<% } %>';
        html += '</select></td>';
        html += '<input type="number" name="detalle[].cantidad" required></td>';
        html += '<td><input id="precioventa" type="number" name="detalle[].PrecioVenta" disabled></td>';
        html += '<td><input type="number" name="detalle[].MontoTotal" disabled></td>';
        html += '<td><button type="button" onclick="agregarDetalle()">Nuevo</button></td>';

        detalleContainer.innerHTML = html;
        container.appendChild(detalleContainer);
    }

    function validarFormulario() {
        var idCliente = document.getElementById('idCliente').value;
        var detalles = document.getElementsByName('detalle[]');

        // Validar campos de la venta
        if (fechaVenta === '') {
            alert('Por favor, ingrese la fecha de venta.');
            return false;
        }
        if (idCliente === '') {
            alert('Por favor, ingrese el ID del cliente.');
            return false;
        }

        // Validar campos de los detalles de venta
        for (var i = 0; i < detalles.length; i++) {
            if (detalles[i].value === '') {
                alert('Por favor, complete todos los campos de los detalles de venta.');
                return false;
            }
        }

        // El formulario es válido, se puede enviar
        return true;
    }

    function obtenerPrecioVenta(el) {
        debugger
        var precioVentaElement = el.parentNode.parentNode.querySelector('input[name="detalle[].PrecioVenta"]');
        var precioVenta = el.options[el.selectedIndex].getAttribute('data-precioventa');
        precioVentaElement.value = precioVenta;
    }
/*
    function obtenerMontoTotal(){
        var cantidadElement = this;
        var fila = cantidadElement.closest('tr');
        var precioVentaElement = fila.querySelector('select[name="detalle[].idArticulo"]');
        var montoTotalElement = fila.querySelector('input[name="detalle[].MontoTotal"]');

        var cantidad = cantidadElement.value;
        var selectedIndex = precioVentaElement.selectedIndex;

        if (selectedIndex !== -1) {
            var precioVenta = precioVentaElement.options[selectedIndex].getAttribute('data-precioventa');

            var montoTotal = cantidad * precioVenta;
            montoTotalElement.value = montoTotal;
        }
    }*/
</script>
</html>
