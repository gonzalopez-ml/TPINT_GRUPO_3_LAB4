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
	
	
	table {
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: center;
    }

    th {
      background-color: #f2f2f2;
    }

    select, input[type="text"] {
      width: 100%;
      padding: 4px;
    }

    .actions {
      display: flex;
      justify-content: center;
      gap: 10px;
    }

    .actions i {
      cursor: pointer;
    }

    .total {
      text-align: right;
      padding-right: 8px;
      font-weight: bold;
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
                 <h2>VENTAS</h2>
                <button class="btn btn-primary btn-sm ms-auto">GUARDAR</button>
              </div>
            </div>
            <div class="card-body">
              <div class="row">
               <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">FACTURA</label>
                    <input class="form-control" type="text" value="25451-5">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">FECHA</label>
                    <input class="form-control" type="text" value="26/05/2023">
                  </div>
                </div>
	
	   	  </div>
	          <hr class="horizontal dark">
             
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">CLIENTES</label>
                    
					<select class="form-control">
  <option value="">Selecciona una empresa</option>
  <option value="Innovatech Solutions">Innovatech Solutions</option>
  <option value="GlobalNet Services">GlobalNet Services</option>
  <option value="BrightIdeas Consulting">BrightIdeas Consulting</option>
  <option value="TechLink Innovations">TechLink Innovations</option>
  <option value="EnerGreen Solutions">EnerGreen Solutions</option>
  <option value="QuickServe Logistics">QuickServe Logistics</option>
  <option value="Elite Marketing Agency">Elite Marketing Agency</option>
  <option value="SureFire Security Systems">SureFire Security Systems</option>
  <option value="PrimeTech Development">PrimeTech Development</option>
  <option value="ProActive Consulting">ProActive Consulting</option>
</select>

                  </div>
                </div>
              </div>
			  <table>
    <thead>
      <tr>
        <th> <label for="example-text-input" class="form-control-label">ARTICULOS</label></th>
        <th> <label for="example-text-input" class="form-control-label">PRECIO</label></th>
        <th> <label for="example-text-input" class="form-control-label">CANTIDAD</label></th>
        <th> <label for="example-text-input" class="form-control-label">TOTAL</label></th>
        <th> <label for="example-text-input" class="form-control-label">ACCIONES</label></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <select class="form-control">
            <option value="">Selecciona un artículo</option>
  <option value="Lámpara Estelar">Lámpara Estelar</option>
  <option value="Esencia Vital">Esencia Vital</option>
  <option value="Elixir de la Luna">Elixir de la Luna</option>
  <option value="Reloj del Tiempo">Reloj del Tiempo</option>
  <option value="Escudo de la Verdad">Escudo de la Verdad</option>
  <option value="Pergamino Místico">Pergamino Místico</option>
  <option value="Varita de Energía">Varita de Energía</option>
  <option value="Talismán del Destino">Talismán del Destino</option>
  <option value="Arco Iris de Poder">Arco Iris de Poder</option>
  <option value="Amuleto de la Suerte">Amuleto de la Suerte</option>
          </select>
        </td>
        <td><input type="text" class="price-input form-control"></td>
        <td><input type="text" class="quantity-input form-control"></td>
        <td><input type="text" class="total-input form-control" readonly></td>
        <td>
          <div class="actions">
            <i class="fas fa-save"></i>
            <i class="fas fa-trash"></i>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <select class="form-control">
           <option value="">Selecciona un artículo</option>
  <option value="Lámpara Estelar">Lámpara Estelar</option>
  <option value="Esencia Vital">Esencia Vital</option>
  <option value="Elixir de la Luna">Elixir de la Luna</option>
  <option value="Reloj del Tiempo">Reloj del Tiempo</option>
  <option value="Escudo de la Verdad">Escudo de la Verdad</option>
  <option value="Pergamino Místico">Pergamino Místico</option>
  <option value="Varita de Energía">Varita de Energía</option>
  <option value="Talismán del Destino">Talismán del Destino</option>
  <option value="Arco Iris de Poder">Arco Iris de Poder</option>
  <option value="Amuleto de la Suerte">Amuleto de la Suerte</option>
          </select>
        </td>
        <td><input type="text" class="price-input form-control"></td>
        <td><input type="text" class="quantity-input form-control"></td>
        <td><input type="text" class="total-input form-control" readonly></td>
        <td>
          <div class="actions">
            <i class="fas fa-save"></i>
            <i class="fas fa-trash"></i>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <select class="form-control">
            <option value="">Selecciona un artículo</option>
  <option value="Lámpara Estelar">Lámpara Estelar</option>
  <option value="Esencia Vital">Esencia Vital</option>
  <option value="Elixir de la Luna">Elixir de la Luna</option>
  <option value="Reloj del Tiempo">Reloj del Tiempo</option>
  <option value="Escudo de la Verdad">Escudo de la Verdad</option>
  <option value="Pergamino Místico">Pergamino Místico</option>
  <option value="Varita de Energía">Varita de Energía</option>
  <option value="Talismán del Destino">Talismán del Destino</option>
  <option value="Arco Iris de Poder">Arco Iris de Poder</option>
  <option value="Amuleto de la Suerte">Amuleto de la Suerte</option>
          </select>
        </td>
        <td><input type="text" class="price-input form-control"></td>
        <td><input type="text" class="quantity-input form-control"></td>
        <td><input type="text" class="total-input form-control" readonly></td>
        <td>
          <div class="actions">
            <i class="fas fa-save"></i>
            <i class="fas fa-trash"></i>
          </div>
        </td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="3" class="total">Total factura:</td>
        <td colspan="2">
          <input type="text" class="total-amount form-control" readonly>
        </td>
      </tr>
    </tfoot>
  </table>

  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <script>
    // Calcula el total al cambiar el precio o la cantidad
    const priceInputs = document.querySelectorAll('.price-input');
    const quantityInputs = document.querySelectorAll('.quantity-input');
    const totalInputs = document.querySelectorAll('.total-input');
    const totalAmountInput = document.querySelector('.total-amount');

    function calculateTotal() {
      let totalAmount = 0;

      for (let i = 0; i < priceInputs.length; i++) {
        const price = parseFloat(priceInputs[i].value) || 0;
        const quantity = parseInt(quantityInputs[i].value) || 0;

        const total = price * quantity;

        totalInputs[i].value = total.toFixed(2);
        totalAmount += total;
      }

      totalAmountInput.value = totalAmount.toFixed(2);
    }

    priceInputs.forEach(input => {
      input.addEventListener('input', calculateTotal);
    });

    quantityInputs.forEach(input => {
      input.addEventListener('input', calculateTotal);
    });
  </script>
             
            </div>
          </div>
        </div>
    </div>
  </main>
 
</body>

</html>
