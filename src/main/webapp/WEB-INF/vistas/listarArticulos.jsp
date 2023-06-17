<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="frgp.utn.edu.ar.entidad.Articulo" %>
<% ArrayList<Articulo> articulos = (ArrayList<Articulo>) request.getAttribute("articulos"); %>

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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <!-- Nucleo Icons -->
    <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link id="pagestyle" href="assets/css/argon-dashboard.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>


    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }



    </style>


</head>

<body>

<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4" id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="#" target="_blank">
            <img src="assets/img/logo.jpg" alt="main_logo">
        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="dashboard.html">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="clientes-list.html">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">CLIENTES</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="articulos-list.html">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">ARTICULOS</span>
                </a>
            </li>
            <li class="nav-item ms-2">
                <a class="nav-link " href="tipos-list.html"> <h6 class="ps-4 ms-2 text-uppercase text-xs  opacity-6 ">TIPOS</h6></a>
            </li>
            <li class="nav-item ms-2">
                <a class="nav-link " href="marcas-list.html"> <h6 class="ps-4 ms-2 text-uppercase text-xs  opacity-6 ">MARCAS</h6></a>
            </li>




            <li class="nav-item">
                <a class="nav-link" href="stock-list.html">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="ni ni-app text-info text-sm opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">STOCK</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ventas-list.html">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">VENTAS</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">CUENTAS</h6>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="usuarios-list.html">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">USUARIOS</span>
                </a>
            </li>
        </ul>
    </div>
</aside>
<main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="/">HOME</a></li>
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page"><a class="opacity-5 text-white" href="clientes-list.html">Clientes</a></li>
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page"><a class="opacity-5 text-white" href="articulos-list.html">Artículos</a></li>
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page"><a class="opacity-5 text-white" href="stock-list.html">Stock</a></li>
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page"><a class="opacity-5 text-white" href="ventas-list.html">Ventas</a></li>
                </ol>
            </nav>



            <div class="user-status">
                <span>Juan</span>
                <img src="assets/img/online.jpg" alt="Conectado" class="online-icon">
            </div>

        </div>
    </nav>

    <!-- End Navbar -->
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header pb-0">
                        <div class="d-flex align-items-center">
                            <h2>ARTICULOS</h2>

                            <div class="search-container btn-primary ms-auto">
                                <input type="text" placeholder="Buscar">
                                <i class="fas fa-search"></i>
                            </div>

                            <button class="btn btn-primary btn-sm ms-auto" onclick="window.location.href='clientes.html'">NUEVO</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">

                            <table  id="tablaArticulos" class="display form-control-label">
                                <thead>
                                <tr class="form-control-label">
                                    <th class="form-control-label">  <label for="example-text-input" class="form-control-label">NOMBRE</label></th>
                                    <th>  <label for="example-text-input" class="form-control-label">DESCRIPCION</label></th>
                                    <th>  <label for="example-text-input" class="form-control-label">PRECIO DE VENTA</label></th>
                                    <th>  <label for="example-text-input" class="form-control-label">ESTADO</label></th>
                                    <th>  <label for="example-text-input" class="form-control-label">MODIFICAR</label></th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (Articulo articulo : articulos) { %>
                                <tr>
                                    <td><label for="example-text-input" class="label-input"><%= articulo.getNombre() %></label></td>
                                    <td><label for="example-text-input" class="label-input"><%= articulo.getDescripcion() %></label></td>
                                    <td><label for="example-text-input" class="label-input"><%= articulo.getPrecioVenta() %></label></td>
                                    <td><label for="example-text-input" class="label-input"><%= articulo.getEstado() %></label></td>
                                    <td><div class="actions">
                                        <form action="articuloParaActualizar.html" method="get">
                                            <i class="fas fa-pencil-alt"></i>
                                        <input type="hidden" name="idArticuloAActualizar" value="<%= articulo.getId() %>">
                                        <button type="submit">Modificar</button>
                                    </form>
                                    </div>
                                    </td>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                            <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

</body>
<script>
    $(document).ready(function() {
        $('#tablaArticulos').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>
</html>