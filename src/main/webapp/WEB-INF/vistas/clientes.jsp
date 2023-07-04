<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>

<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Cliente</title>
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
  	  		<td><h1>Registro de Clientes</h1></td>
 			 <td>
  				  <form name="miFormulario" action="guardarCliente.html" method="get" onsubmit="return validarFormulario()">
  				  <input type="submit" value="Grabar" name="btnRedirigir" class="btn btn-primary">	
  				  <a href="recuperarClientes.html" class="btn btn-primary">Listado de Clientes</a> 	
   			</td>
   		 </tr>
  	</table>
	
	<hr>
  
    <table>
     	<tr>
     		<td><label for="Dni">DNI:</label></td>
     		<td><input class="form-control" type="text" id="dni" name="dni" pattern="[0-9]+" title="Ingrese solo números" required></td>
		</tr>
		<tr>
     		<td><label for="nombre">Nombre:</label></td>
     		<td> <input class="form-control" type="text" id="nombre" name="nombre" pattern="[A-Za-z\s]*" title="Ingrese solo letras" required></td>
		</tr>
		<tr>
     		<td> <label for="apellido">Apellido:</label></td>
     		<td><input class="form-control" type="text" id="apellido" name="apellido" pattern="[A-Za-z\s]*" title="Ingrese solo letras" required></td>
		</tr>
		<tr>
     		<td><label for="sexo">Sexo:</label></td>
     		<td> <select class="form-control" name="sexo" id="sexo" name="sexo">
 		 			<option value="M" selected>Masculino</option>
  					<option value="F">Femenino</option>
  					<option value="B">Binario</option>
				</select>
			</td>
		</tr>
		<tr>
     		<td> <label for="fechaNacimiento">Fecha de Nacimiento:</label></td>
     		<td> 
     		<div class="form-group m-1">
             
            <!-- Input field along with 
                calendar icon and -->
            <div class="input-group date">
                <!-- Sets the calendar icon -->
                <span class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fa fa-calendar" 
                            onclick="setDatepicker(this)">
                        </i>
                    </span>
                </span>
     		 <input class="form-control" type="text"  name="fechanacimiento" id="fechanacimiento" pattern="\d{4}/\d{2}/\d{2}" required>
     		</div>
     		</div>
     		
     		
     		
     		</td>
		</tr>
		<tr>
     		<td><label for="direccion">Dirección:</label></td>
     		<td> <input class="form-control" type="text" id="direccion" name="direccion"</td>
		</tr>
		<tr>
     		<td><label for="localidad">Localidad:</label></td>
     		<td><select class="form-control" id="localidad" name="localidad">
				    <option value="Buenos Aires">Buenos Aires</option>
				    <option value="Cordoba">Cordoba</option>
				    <option value="Rosario">Rosario</option>
				    <option value="Mendoza">Mendoza</option>
				    <option value="San Miguel de Tucumán">San Miguel de Tucumán</option>
				    <option value="La Plata">La Plata</option>
				    <option value="Mar del Plata">Mar del Plata</option>
				    <option value="Quilmes">Quilmes</option>
				    <option value="Salta">Salta</option>
				    <option value="Santa Fe">Santa Fe</option>
				    <option value="San Juan">San Juan</option>
				    <option value="Corrientes">Corrientes</option>
				    <option value="Bahía Blanca">Bahía Blanca</option>
				    <option value="Resistencia">Resistencia</option>
				    <option value="Posadas">Posadas</option>
				    <option value="Morón">Morón</option>
				    <option value="Paraná">Paraná</option>
				    <option value="Neuquén">Neuquén</option>
				    <option value="Merlo">Merlo</option>
				    <option value="Santiago del Estero">Santiago del Estero</option>
				</select>
			</td>
		</tr>
		<tr>
     		<td><label for="correoElectronico">Correo Electrónico:</label></td>
     		<td><input type="text" class="form-control" id="correoelectronico" name="correoelectronico" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required></td>
		</tr>
	
		<tr>
     		<td> <label for="telefono">Teléfono:</label></td>
     		<td><input class="form-control" type="text" id="telefono" name="telefono" pattern="[0-9]+" title="Ingrese solo números" required><br></td>
		</tr>
	 </table>
	<hr>    
    	<input type="number" id="id" name="id" hidden><br>
  		<input type="number" id="estado" name="estado" value="0" hidden>
  	</form>
	</body>
	<script>
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value;
        var apellido = document.getElementById("apellido").value;
		var direccion = document.getElementById("apellido").value;

		var regex = /^[a-zA-Z\s]+$/; // Expresión regular para validar solo letras

        if (!regex.test(nombre) || !regex.test(apellido)  || !regex.test(direccion)) {
            alert("Hay campos con errores.");
            return false; // Detener el envío del formulario
        }

        return true; // Enviar el formulario si pasa la validación
    }

    document.getElementById("miFormulario").addEventListener("submit", function(event) {
        // Evita que el formulario se envíe inmediatamente.
        event.preventDefault();

        // Toma la fecha que ingresó el usuario.
        var fechaUsuario = document.getElementById("fechaNacimiento").value;

        // Agrega la hora a la fecha.
        var fechaConHora = fechaUsuario + "T00:00:00";

        // Cambia el valor de la fecha en el formulario por el nuevo valor con la hora.
        document.getElementById("fecha").value = fechaConHora;

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