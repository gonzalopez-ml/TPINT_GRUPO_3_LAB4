<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="frgp.utn.edu.ar.entidad.Marca" %>
<%@ page import="frgp.utn.edu.ar.entidad.TipoArticulo" %>
<%@ page import="frgp.utn.edu.ar.entidad.Stock" %>
<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %><%--
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
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<% if (!estado) {
    estadoString = "Inactivo";
} %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <title>Title</title>
</head>


<body>

<div>
    <h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
    </form>
</div>



<form action="actualizarArticulo.html" method="get" style="text-align: center;">
    <input type="number" id="Id" name="Id" value="<%= articulos.getId() %>" hidden><br>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= articulos.getNombre() %>"><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" value="<%= articulos.getDescripcion() %>"><br>

    <label for="marca">Marca:</label>
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
    </select> <br>


    <label for="precio">Precio de Venta:</label>
    <input type="number" id="precio" name="precio" value="<%= articulos.getPrecioVenta() %>"><br>

    <label for="cantidad">cantidad:</label>
    <input type="number" id="cantidad" name="cantidad" value="<%= stock.getCantidad() %>"><br>

    <label for="precioCompra">precio de compra:</label>
    <input type="number" id="precioCompra" name="precioCompra" value="<%= stock.getPrecioCompra() %>"><br>

    <label >Estado del articulo:  <%= estadoString %> </label> <br>

    <input type="submit" value="Modificar" name="btnRedirigir" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">
</form>


<form action="listaUsuarios.html" method="get" style="text-align: center">
    <input type="hidden" name="volver" >
    <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Volver</button>
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