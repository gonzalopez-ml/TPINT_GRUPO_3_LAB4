<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.entidad.Stock" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String mensaje = (String) request.getAttribute("mensaje"); %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    SISTEMA DE GESTIÓN INTEGRAL DE VENTAS - UTN - LAB V
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href=""https://demos.creative-tim.com/argon-dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />
  
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>


  <style>
    //CSS Styles
  </style>
</head>
<body>
<%
    //Java code can go here.
%>

<% if (mensaje != null) { %>
<script>
    alert("<%= mensaje %>");
</script>
<% } %>


<div>
    <h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
  
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
    </form>
</div>


<table style="width:100%">
    <tr>
  	  		<td><h1>Lista de Stock</h1></td>
 			 <td>
  					<div style="text-align:right;">
    					<a href="<c:url value='/guardar_archivo_stock.html' />" class="btn btn-primary">Agregar Nuevo Stock</a>
   					</div>

   			</td>

 		 </tr>
  </table>
  
  
    <!-- Add new Stock Button -->
    
               
            <table id="tablaStock" class="display">
            <thead>
        <tr>
  <th>ID</th>
  <th>FECHA INGRESO</th>
  <th>NOMBRE ARTÍCULO</th>
  <th>CANTIDAD</th>
  <th>PRECIO COMPRA</th>

   
  </tr>
    </thead>
    <tbody>

  <c:forEach var="stock" items="${stock}">
    <tr>
        <td><c:out value="${stock.id}" /></td>
        <td><c:out value="${stock.fechaIngreso}" /></td>
        <td><c:out value="${stock.articulo.nombre}" /></td>
        <td><c:out value="${stock.cantidad}" /></td>
        <td><c:out value="${stock.precioCompra}" /></td>
       
</tr>
</c:forEach>
</tbody>



</table>

<form action="recuperarArticulos.html" method="get" style="text-align: center" >
    <button class="custom-btn" type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Volver</button>
</form>
</body>
<script>
$(document).ready(function() {
    $('#tablaStock').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "search": "Buscar:",
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
