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
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/argon-dashboard.css" rel="stylesheet" />


  

<style>
    .user-status {
      position: fixed;
      top: 20px;
      right: 20px;
      display: flex;
      align-items: center;
      color: #000000;
	  font-size:12px;
    }

    .user-status span {
      margin-right: 5px;
    }

    .user-status .online-icon {
      width: 30px;
      height: 30px;
    }
	
	
	.centered-text {
    display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
	
	
	.popup {
  width: 500px;
  height: 370px;
  background-color: #fff;
  border-radius: 10px;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: none;
}

.popup-content {
  padding: 20px;
  text-align: center;
}

.popup-header {
  background-color: violet;
  padding: 10px;
}

.popup-header img {
  width: 50px;
  height: 50px;
}

.popup-footer {
  margin-top: 20px;
}

.popup-footer button {
  background-color: violet;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}
	
  </style>


</head>

<body>

<script>
document.addEventListener('DOMContentLoaded', function() {

   const guardarBtn = document.getElementById('guardarBtn');
const popup = document.getElementById('popup');
const continuarBtn = document.getElementById('continuarBtn');

guardarBtn.addEventListener('click', function() {
  popup.style.display = 'block';
});

continuarBtn.addEventListener('click', function() {
  popup.style.display = 'none';
});

  </script>

<div id="popup" class="popup">
  <div class="popup-content">
    <div class="popup-header">
      <img src="ok-icon.png" alt="OK Icon">
    </div>
    <div class="popup-body">
      <p>Los datos se guardaron correctamente.</p>
    </div>
    <div class="popup-footer">
      <button id="continuarBtn">Continuar</button>
    </div>
  </div>
</div>
  
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
                 <h2>CLIENTES</h2>
                <button class="btn btn-primary btn-sm ms-auto" id="guardarBtn">GUARDAR</button>
              </div>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">DNI</label>
                    <input class="form-control" type="text" value="45844512">
                  </div>
                </div>
                <div class="col-md-6">
                  
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">APELLIDO</label>
                    <input class="form-control" type="text" value="Jesse">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">NOMBRE</label>
                    <input class="form-control" type="text" value="Lucky">
                  </div>
                </div>
              
			   <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">SEXO</label>
                    <select id="sexo" name="sexo" class="form-control">
    <option value="">Selecciona un sexo</option>
    <option value="Masculino">Masculino</option>
    <option value="Femenino">Femenino</option>
    <option value="No binario">No binario</option>
    <option value="Prefiero no decirlo">Prefiero no decirlo</option>
  </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">NACIMIENTO</label>
                    <input class="form-control" type="text" value="26/05/1990">
                  </div>
                </div>
       	  </div>
	          <hr class="horizontal dark">
             
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">DIRECCION</label>
                    <input class="form-control" type="text" value="Las Lilas 5484 SubWay 847">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">PROVINCIA</label>
                    <select id="provincia" name="provincia" class="form-control">
    <option value="">Selecciona una provincia</option>
    <option value="Buenos Aires">Buenos Aires</option>
    <option value="Córdoba">Córdoba</option>
    <option value="Santa Fe">Santa Fe</option>
    <option value="Mendoza">Mendoza</option>
    <option value="Tucumán">Tucumán</option>
    <option value="Entre Ríos">Entre Ríos</option>
    <option value="Salta">Salta</option>
    <option value="Misiones">Misiones</option>
    <option value="Chaco">Chaco</option>
    <option value="Corrientes">Corrientes</option>
    <option value="Santiago del Estero">Santiago del Estero</option>
    <option value="San Juan">San Juan</option>
    <option value="Jujuy">Jujuy</option>
    <option value="Río Negro">Río Negro</option>
    <option value="Neuquén">Neuquén</option>
    <option value="Formosa">Formosa</option>
    <option value="Chubut">Chubut</option>
    <option value="San Luis">San Luis</option>
    <option value="La Pampa">La Pampa</option>
    <option value="Catamarca">Catamarca</option>
    <option value="La Rioja">La Rioja</option>
    <option value="Santa Cruz">Santa Cruz</option>
    <option value="Tierra del Fuego">Tierra del Fuego</option>
  </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">LOCALIDAD</label>
                    <select id="localidad" name="localidad" class="form-control">
    <option value="">Selecciona una localidad</option>
    <option value="Tandil">Tandil</option>
    <option value="La Plata">La Plata</option>
    <option value="Mar del Plata">Mar del Plata</option>
    <option value="Bahía Blanca">Bahía Blanca</option>
    <option value="Junín">Junín</option>
    <option value="Pergamino">Pergamino</option>
    <option value="Olavarría">Olavarría</option>
    <option value="San Nicolás">San Nicolás</option>
    <option value="Tres Arroyos">Tres Arroyos</option>
    <option value="Azul">Azul</option>
    <option value="Chivilcoy">Chivilcoy</option>
    <option value="Necochea">Necochea</option>
    <option value="Zárate">Zárate</option>
    <option value="San Pedro">San Pedro</option>
    <option value="Luján">Luján</option>
    <option value="San Isidro">San Isidro</option>
    <option value="San Antonio de Areco">San Antonio de Areco</option>
    <option value="General Pueyrredón">General Pueyrredón</option>
    <option value="Mercedes">Mercedes</option>
    <option value="Trenque Lauquen">Trenque Lauquen</option>
  </select>
                  </div>
                </div>
				
				
				 <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">TELEFONO</label>
                    <input class="form-control" type="text" value="5491154784154">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">EMAIL</label>
                    <input class="form-control" type="text" value="grupo3UTN@gmail.com">
                  </div>
                </div>
				
				
               
              </div>
             
            </div>
          </div>
        </div>
    </div>
  </main>
 
</body>

</html>
