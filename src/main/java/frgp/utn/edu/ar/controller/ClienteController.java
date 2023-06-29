package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ClienteServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import java.text.ParseException;
import java.text.SimpleDateFormat;


import java.util.ArrayList;
import java.util.Date;

@Controller
public class ClienteController {
	ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("clienteServicio")
    private ClienteServicio clienteServicio;

    @RequestMapping("/guardarCliente.html")
    public ModelAndView guardarCliente(HttpSession session, Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, Date fechanacimiento, String localidad, String nombre, char sexo, String telefono) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
        if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
            ModelAndView MV = new ModelAndView();
            String error = "No posee permisos para ver esta página, loguearse nuevamente";
            MV.addObject("error", error);
            MV.setViewName("login");
            return MV;
        }
      
        Cliente cliente = (Cliente) appContext.getBean("cliente");
        cliente.setId(id);
        cliente.setDni(dni);
        cliente.setApellido(apellido);
        cliente.setCorreoElectronico(correoelectronico);
        cliente.setDireccion(direccion);
        cliente.setEstado(1);
        cliente.setFechanacimiento(fechanacimiento);
        cliente.setLocalidad(localidad);
        cliente.setNombre(nombre);
        cliente.setSexo(sexo);
        cliente.setTelefono(telefono);


        String seGuardo = clienteServicio.insertarCliente(cliente);
        
        ModelAndView MV = new ModelAndView("listarClientes");
        ArrayList<Cliente> clientes= clienteServicio.obtenerClientes();
        MV.addObject("mensaje", seGuardo);
        MV.addObject("clientes", clientes);

        return MV;
    }

   
    @RequestMapping("/actualizarCliente.html")
    @ResponseBody()
    public ModelAndView actualizarCliente(HttpSession session, Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, Date fechanacimiento, String localidad, String nombre, char sexo, String telefono) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
        if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
            ModelAndView MV = new ModelAndView();
            String error = "No posee permisos para ver esta página, loguearse nuevamente";
            MV.addObject("error", error);
            MV.setViewName("login");
            return MV;
        }
    	//String fechanacimiento2 = "2023-06-28";
        //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //java.util.Date utilDate = sdf.parse(fechanacimiento2);
        //java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
       

    
    	 
    	// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         //Date fechaNacimiento = sdf.parse(fechanacimiento);
         //java.sql.Date fechaNacimientoSQL = new java.sql.Date(fechaNacimiento.getTime());

    	
        Cliente cliente = (Cliente) appContext.getBean("cliente");
        cliente.setId(id);
        cliente.setDni(dni);
        cliente.setApellido(apellido);
        cliente.setCorreoElectronico(correoelectronico);
        cliente.setDireccion(direccion);
        cliente.setEstado(estado);
        cliente.setFechanacimiento(fechanacimiento);
        cliente.setLocalidad(localidad);
        cliente.setNombre(nombre);
        cliente.setSexo(sexo);
        cliente.setTelefono(telefono);
        
               
        String seGuardo = clienteServicio.actualizarCliente(cliente);

     
        ModelAndView MV = new ModelAndView("listarClientes");
        ArrayList<Cliente> clinrr = clienteServicio.obtenerClientes();
        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("clientes", clienteServicio.obtenerClientes());
       
        return MV;
    }


    @RequestMapping("/clienteParaActualizar.html")
    public ModelAndView clienteParaActualizar(Long idClienteAActualizar) {

        //TODO make validations!
        Cliente cliente = clienteServicio.obtenerCliente(idClienteAActualizar);

        ModelAndView MV = new ModelAndView();
        MV.addObject("cliente", cliente);
        MV.setViewName("modificarcliente");
        return MV;
    }

    @RequestMapping(value="/recuperarClientes.html")
    public ModelAndView recuperarClientes(HttpSession session) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
        if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
            ModelAndView MV = new ModelAndView();
            String error = "No posee permisos para ver esta página, loguearse nuevamente";
            MV.addObject("error", error);
            MV.setViewName("login");
            return MV;
        }

        ModelAndView MV = new ModelAndView("listarClientes");
        //TODO make validations!
        ArrayList<Cliente> clientes = clienteServicio.obtenerClientes();
        MV.addObject("clientes", clientes);
        
        return MV;
        }
    
    @RequestMapping(value="/eliminarCliente.html", method=RequestMethod.GET)
    public ModelAndView eliminarCliente(HttpSession session, Long idClienteAEliminar) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
        if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
            ModelAndView MV = new ModelAndView();
            String error = "No posee permisos para ver esta página, loguearse nuevamente";
            MV.addObject("error", error);
            MV.setViewName("login");
            return MV;
        }
        //TODO make validations!
        
        // Obtain the client with the given ID
        Cliente cliente = clienteServicio.obtenerCliente(idClienteAEliminar);
        
        // Change the status of the client
        cliente.setEstado(0); // Cliente inactivo
        
        // Update the client
        String mensaje = clienteServicio.actualizarCliente(cliente);
        
        // Redirect to the list of clients
        ModelAndView MV = new ModelAndView("listarClientes");
        ArrayList<Cliente> clientes = clienteServicio.obtenerClientes();
        MV.addObject("mensaje", mensaje);
        MV.addObject("clientes", clientes);

        return MV;
    }
    

    @RequestMapping("/guardar_archivo_cliente.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("clientes");
        return MV;
    }
    
    
}