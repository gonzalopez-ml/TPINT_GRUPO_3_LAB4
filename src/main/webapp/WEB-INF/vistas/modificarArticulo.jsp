<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="frgp.utn.edu.ar.entidad.Marca" %>
<%@ page import="frgp.utn.edu.ar.entidad.TipoArticulo" %>
<%@ page import="frgp.utn.edu.ar.entidad.Stock" %><%--
  Created by IntelliJ IDEA.
  User: gonlopez
  Date: 16/06/2023
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<% String estadoString = "Activo"; %>
<% Articulo articulos = (Articulo) request.getAttribute("articulo"); %>
<% Boolean estado = ((Articulo) request.getAttribute("articulo")).getEstado(); %>
<% ArrayList<Marca> marcas = (ArrayList<Marca>) request.getAttribute("marcas"); %>
<% ArrayList<TipoArticulo> tipoArticulos = (ArrayList<TipoArticulo>) request.getAttribute("tipoArticulos"); %>
<% Stock stock = (Stock) request.getAttribute("stock"); %>

<% if (!estado) {
    estadoString = "Inactivo";
} %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>

<form action="logout.html" method="post">
    <button type="submit">Desloguear</button>
</form>


<form action="actualizarArticulo.html" method="get" style="text-align: center;">
    <input type="number" id="Id" name="Id" value="<%= articulos.getId() %>" hidden><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= articulos.getNombre() %>"><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" value="<%= articulos.getDescripcion() %>"><br>

<%--    <label for="marca">Marca:</label>
    <select name="marca" id="marca">
        <c:forEach var="opcion" items="<%= marcas %>">
            <option value="${opcion.id}">${opcion.marca}</option>
        </c:forEach>
    </select> <br>

    <label for="tipo">Tipo de articulo:</label>
    <select name="tipo" id="tipo">
        <c:forEach var="opcion" items="<%= tipoArticulos %>">
            <option value="${opcion.id}">${opcion.nombreTipo}</option>
        </c:forEach>
    </select> <br>--%>

    <label for="precio">Precio de Venta:</label>
    <input type="number" id="precio" name="precio" value="<%= articulos.getPrecioVenta() %>"><br>

    <label for="cantidad">cantidad:</label>
    <input type="number" id="cantidad" name="cantidad" value="<%= stock.getCantidad() %>"><br>

    <label for="precioCompra">precio de compra:</label>
    <input type="number" id="precioCompra" name="precioCompra" value="<%= stock.getPrecioCompra() %>"><br>

    <label >Estado del articulo:  <%= estadoString %> </label> <br>

    <input type="submit" value="Modificar" name="btnRedirigir">
</form>


<form action="listaUsuarios.html" method="get" style="text-align: center">
    <input type="hidden" name="volver" >
    <button type="submit">Volver</button>
</form>


</body>
</html>

<script>
    function mostrarMensaje() {
        var dropdown = document.getElementById("estado");
        var mensaje = document.getElementById("mensaje");

        if (dropdown.value === "Inactivo") {
            mensaje.style.display = "block";
        } else {
            mensaje.style.display = "none";
        }
    }
</script>