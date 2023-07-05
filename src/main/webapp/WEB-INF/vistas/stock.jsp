<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.entidad.Articulo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Stock</title>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

 	<script src= "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href= "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>


<div>
	<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1>
	<form action="logout.html" method="post" style="text-align: right">
		<button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
	</form>
</div>

	<table style="width:100%">
        <tr>
  	  		<td><h1>Registro de Stock</h1></td>
 			 <td>
  				  <form name="miFormulario" action="guardarStock.html" method="get" onsubmit="return validarFormulario()">
  				  <input type="submit" value="Grabar" name="btnRedirigir" class="btn btn-primary">	
  				  <a href="listarStock.html" class="btn btn-primary">Listado de Stock</a> 	
   			</td>
   		 </tr>
  	</table>
	
	<hr>
	
	
    <table>
     	<tr>
     		<td><label for="articulo">Artículo:</label></td>
     		<td>
     			<select class="form-control" id="articuloId" name="articuloId">
     				<c:forEach var="articulo" items="${articulos}">
     					<option value="${articulo.id}">${articulo.nombre}</option>
     				</c:forEach>
     			</select>
     		</td>
		</tr>
		<tr>
     		<td><label for="fechaIngreso">Fecha de Ingreso:</label></td>
     		<td>
     			<div class="form-group m-1">
     				<div class="input-group date">
     					<span class="input-group-prepend">
     						 <span class="input-group-text">
     						 	<i class="fa fa-calendar" onclick="setDatepicker(this)"></i>
     						 </span>
     					</span>
     					<input class="form-control" type="text" id="fechaIngreso" name="fechaIngreso" required>
     				</div>
     			</div>
     		</td>
		</tr>
		<tr>
     		<td> <label for="cantidad">Cantidad:</label></td>
     		<td><input class="form-control" type="text" id="cantidad" name="cantidad" pattern="[0-9]+" title="Ingrese solo números" required><br></td>
		</tr>
		<tr>
     		<td> <label for="precioCompra">Precio de Compra:</label></td>
     		<td><input class="form-control" type="text" id="precioCompra" name="precioCompra" required><br></td>
		</tr>
	 </table>
	<hr>    
    	<input type="number" id="id" name="id" hidden><br>
  		<input type="number" id="estado" name="estado" value="0" hidden>
  	</form>
	</body>
	<script>
    function validarFormulario() {
        var cantidad = document.getElementById("cantidad").value;
        var precioCompra = document.getElementById("precioCompra").value;

        var regex = /^[0-9]+$/; // Expresión regular para validar solo números

        if (parseFloat(precioCompra) <= 0) {
            alert("El precio de compra debe ser mayor a 0.");
            return false; // Detener el envío del formulario
        }
        
        if (parseInt(cantidad) === 0) {
            alert("La cantidad debe ser mayor a 0.");
            return false; // Detener el envío del formulario
        }

        
        if (!regex.test(cantidad) || !regex.test(precioCompra)) {
            alert("Hay campos con errores.");
            return false; // Detener el envío del formulario
        }

        return true; // Enviar el formulario si pasa la validación
    }

    document.getElementById("miFormulario").addEventListener("submit", function(event) {
        // Evita que el formulario se envíe inmediatamente.
        event.preventDefault();

        // Envía el formulario.
        event.target.submit();
    });
</script>

<script type="text/javascript">
        function setDatepicker(_this) {
  
            /* Get the parent class name so we 
                can show date picker */
            let className = $(_this).parent()
                .parent().parent().attr('class');
  
            // Remove space and add '.'
            let removeSpace = className.replace(' ', '.');
  
            // jQuery class selector
            $("." + removeSpace).datepicker({
                format: "yyyy/mm/dd",
  
                // Positioning where the calendar is placed
                orientation: "bottom auto",
                // Calendar closes when cursor is 
                // clicked outside the calendar
                autoclose: true,
                showOnFocus: "false"
            });
        }
    </script>
</html>