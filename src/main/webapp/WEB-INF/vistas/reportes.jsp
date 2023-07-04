<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="frgp.utn.edu.ar.entidad.Usuario" %>
<%@ page import="frgp.utn.edu.ar.enums.TipoUsuarioEnum" %>

<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado Articulos</title>
    <link id="pagestyle" href="https://demos.creative-tim.com/argon-dashboard/assets-old/css/argon.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script src= "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
</head>
<body>

<% if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn") && usuario.getTipoUsuario() == TipoUsuarioEnum.contador)  { %>

<div style="text-align: center;">
    <form action="logout.html" method="post" style="text-align: right">
        <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Desloguear</button>
    </form>
</div>

<h1 style="text-align: center">Bienvenido usuario <%= usuario.getTipoUsuario() %> </h1><br>
<h2 style="text-align: center"> Reporte de ventas </h2>
<h3 style="text-align: center"> Elegir fechas </h3>



<table style="width:100%">
    <tr>
        <td>
            <form action="/" method="get" style="text-align: center;">
                <input type="hidden" name="" value="">
                <div class="form-group m-1">
                    <div class="input-group date">
                        <span class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-calendar" onclick="setDatepicker(this)"></i>
                            </span>
                        </span>
                        <input class="form-control" type="text" name="fechadesde" id="fechadesde">
                    </div>
                </div>
            </td>
           <td>
                <div class="form-group m-1">
                    <div class="input-group date">
                        <span class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-calendar" onclick="setDatepicker(this)"></i>
                            </span>
                        </span>
                        <input class="form-control" type="text" name="fechahasta" id="fechahasta">
                    </div>
                </div>
                  </td>
           <td> 
                <button type="submit" style="background-color: #3498db; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px;">Buscar</button>
            </form>
        </td>
    </tr>
</table>



<% } else { %>

<h1>Ocurrio un error inesperado</h1>
<a href="irLogin.html">Volver al Login</a>

<% } %>

</body>



<script>
    $(document).ready(function () {
        $('#tablaArticulos').DataTable({
            "paging": true,
            "lengthChange": true,
            "lengthMenu": [10, 25, 50],
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "columns": [
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
                {"searchable": true},
            ]
        });
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
