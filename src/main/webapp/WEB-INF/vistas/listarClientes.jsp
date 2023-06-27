<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <table style="width:100%">
        <tr>
  	  		<td><h1>Lista de Clientes</h1></td>
 			 <td>
  					<div style="text-align:right;">
    					<a href="<c:url value='/guardar_archivo_cliente.html' />" class="btn btn-primary">Agregar Nuevo Cliente</a>
   					</div>
   			</td>
 		 </tr>
  </table>
  
  
    <!-- Add new Client Button -->
    
               
            <table id="tablaClientes" class="display">
            <thead>
        <tr>
  <th>DNI</th>
  <th>NOMBRE</th>
 <th>APELLIDO</th>
 <th>DIRECCION</th>
  <th>LOCALIDAD</th>
 <th>TELEFONO</th>
 <th>ACCIONES</th>
   
  </tr>
    </thead>
    <tbody>

  <c:forEach var="cliente" items="${clientes}">
    <tr>
        <td><c:out value="${cliente.dni}" /></td>
        <td><c:out value="${cliente.nombre}" /></td>
        <td><c:out value="${cliente.apellido}" /></td>
          <td><c:out value="${cliente.direccion}" /></td>
            <td><c:out value="${cliente.localidad}" /></td>
        <td><c:out value="${cliente.telefono}" /></td>
        <td> 
         <a href="<c:url value='/clienteParaActualizar.html?idClienteAActualizar=${cliente.id}' />" class="card-link btn btn-primary">Modificar</a>
         <a href="<c:url value='/eliminarCliente.html?idClienteAEliminar=${cliente.id}' />" class="card-link  btn btn-primary">Eliminar</a>
       </td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
<script>
$(document).ready(function() {
    $('#tablaClientes').DataTable({
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
            { "searchable": true },
          
          
        ]
    });
});
</script>
</html>

