<%@ page import="frgp.utn.edu.ar.entidad.Cliente" %>
<%@ page import="java.util.ArrayList" %>
<% Cliente cliente = (Cliente) request.getAttribute("cliente"); %>
<% Integer estado = null; %>
<% String estadoString = "No definido"; %>
<% if (cliente != null) { %>
    <% estado = cliente.getEstado(); %>
    <% if (estado == null) { %>
        <% estadoString = "No definido"; %>
    <% } else if (estado == 0) { %>
        <% estadoString = "Inactivo"; %>
    <% } else { %>
        <% estadoString = "Activo"; %>
    <% } %>
<% } %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Cliente</title>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
 
 <script src= "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
 <link rel="stylesheet" href= "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
</head>

<body>


	<table style="width:100%">
        <tr>
  	  		<td><h1>Registro de Clientes</h1></td>
 			 <td>
  				  <form name="miFormulario" action="actualizarCliente.html" method="get" onsubmit="return validarFormulario()">
  				  <input type="submit" value="Grabar" name="btnRedirigir" class="btn btn-primary">
  				  
  				   
  				   <a href="eliminarCliente.html?idClienteAEliminar=<%= cliente.getId() %>" class="btn btn-primary">Eliminar</a>
  				   
  				  <a href="recuperarClientes.html" class="btn btn-primary">Listado de Clientes</a> 	
   			</td>
   		 </tr>
  	</table>
  	
  	<hr>
  	 <table>
     	<tr>
     		<td><label for="Dni">DNI:</label></td>
     		<td><input class="form-control" type="text" id="dni" name="dni" pattern="[0-9]+" value="<%= cliente.getDni() %>" title="Ingrese solo números" required></td>
		</tr>
		<tr>
     		<td><label for="nombre">Nombre:</label></td>
     		<td> <input class="form-control" type="text" id="nombre" name="nombre" pattern="[A-Za-z]+" value="<%= cliente.getNombre() %>" title="Ingrese solo letras" required></td>
		</tr>
		<tr>
     		<td> <label for="apellido">Apellido:</label></td>
     		<td><input class="form-control" type="text" id="apellido" name="apellido" pattern="[A-Za-z]+" value="<%= cliente.getApellido() %>" title="Ingrese solo letras" required></td>
		</tr>
		<tr>
     		<td><label for="sexo">Sexo:</label></td>
     		<td> <select class="form-control"  id="sexo" name="sexo">
    <option <%= 'M' == cliente.getSexo() ? "selected" : "" %> value="M">Masculino</option>
    <option <%= 'F' == cliente.getSexo() ? "selected" : "" %> value="F">Femenino</option>
    <option <%= 'B' == cliente.getSexo() ? "selected" : "" %> value="B">Binario</option>
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
  
                <!-- Accepts the input from calendar -->
                <input class="form-control" type="date"  name="fechaNacimiento" id="fechaNacimiento" value="<%= cliente.getFechanacimiento() %>" required>
            </div>
        </div>
   
     		
     			</tr>
		<tr>
     		<td><label for="direccion">Dirección:</label></td>
     		<td> <input class="form-control" type="text" id="direccion" name="direccion" value="<%= cliente.getDireccion() %>"></td>
		</tr>
		<tr>
     		<td><label  for="localidad">Localidad:</label></td>
     		<td><select class="form-control" id="localidad" name="localidad">
    <option <%= "Buenos Aires".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Buenos Aires">Buenos Aires</option>
    <option <%= "Cordoba".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Cordoba">Cordoba</option>
    <option <%= "Rosario".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Rosario">Rosario</option>
    <option <%= "Mendoza".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Mendoza">Mendoza</option>
    <option <%= "San Miguel de Tucumán".equals(cliente.getLocalidad()) ? "selected" : "" %> value="San Miguel de Tucumán">San Miguel de Tucumán</option>
    <option <%= "La Plata".equals(cliente.getLocalidad()) ? "selected" : "" %> value="La Plata">La Plata</option>
    <option <%= "Mar del Plata".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Mar del Plata">Mar del Plata</option>
    <option <%= "Quilmes".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Quilmes">Quilmes</option>
    <option <%= "Salta".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Salta">Salta</option>
    <option <%= "Santa Fe".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Santa Fe">Santa Fe</option>
    <option <%= "San Juan".equals(cliente.getLocalidad()) ? "selected" : "" %> value="San Juan">San Juan</option>
    <option <%= "Corrientes".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Corrientes">Corrientes</option>
    <option <%= "Bahía Blanca".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Bahía Blanca">Bahía Blanca</option>
    <option <%= "Resistencia".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Resistencia">Resistencia</option>
    <option <%= "Posadas".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Posadas">Posadas</option>
    <option <%= "Morón".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Morón">Morón</option>
    <option <%= "Paraná".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Paraná">Paraná</option>
    <option <%= "Neuquén".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Neuquén">Neuquén</option>
    <option <%= "Merlo".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Merlo">Merlo</option>
    <option <%= "Santiago del Estero".equals(cliente.getLocalidad()) ? "selected" : "" %> value="Santiago del Estero">Santiago del Estero</option>
</select>
			</td>
		</tr>
		<tr>
     		<td><label for="correoElectronico">Correo Electrónico:</label></td>
     		<td><input class="form-control" type="text" id="correoelectronico" name="correoelectronico" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value="<%= cliente.getCorreoElectronico() %>" required></td>
		</tr>
	
		<tr>
     		<td> <label for="telefono">Teléfono</label></td>
     		<td><input class="form-control" type="text" id="telefono" name="telefono" pattern="[0-9]+" title="Ingrese solo números" value="<%= cliente.getTelefono() %>" required></td>
		</tr>
		<tr>
     		<td>Estado del cliente:  </td>
     		<td><%= estadoString %><br></td>
		</tr>
	 </table>
	<hr>  
	<input type="number" id="id" name="id" value="<%= cliente.getId() %>" hidden><br>
	 <input type="number" id="estado" name="estado" value="<%= cliente.getEstado() %>" hidden> 
  	</form>

</body>



<script>
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value;
        var apellido = document.getElementById("apellido").value;

        var regex = /^[A-Za-z]+$/; // Expresión regular para validar solo letras

        if (!regex.test(nombre) || !regex.test(apellido)) {
            alert("Hay campos con errores.");
            return false; // Detener el envío del formulario
        }

        return true; // Enviar el formulario si pasa la validación
    }

    document.getElementById("miFormulario").addEventListener("submit", function(event) {
        // Evita que el formulario se envíe inmediatamente.
        event.preventDefault();

        // Toma la fecha que ingresó el usuario.
        var fechaUsuario = document.getElementById("fechanacimiento").value;

        // Agrega la hora a la fecha.
        var fechaConHora = fechaUsuario + "T00:00:00";

        // Cambia el valor de la fecha en el formulario por el nuevo valor con la hora.
        document.getElementById("fecha").value = fechaConHora;

        // Envía el formulario.
        event.target.submit();
    });
</script>
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
                format: "yyyy-mm-dd",
  
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


