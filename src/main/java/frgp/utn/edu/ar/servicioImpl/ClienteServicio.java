package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IClienteDao;
import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.servicio.IClienteServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Service("clienteServicio")
public class ClienteServicio implements IClienteServicio {

    @Autowired
    private IClienteDao clienteDao;

    @Override
    public String insertarCliente(Cliente cliente) {
        return clienteDao.insertarCliente(cliente);
    }

    @Override
    public ArrayList<Cliente> obtenerClientes() {
        return clienteDao.obtenerClientes();
    }

    @Override
    public String actualizarCliente(Cliente cliente) {
        
    	    	
    	 Date currentDate = cliente.getFechanacimiento();
         String pattern = "yyyy-MM-dd HH:mm:ss";

         SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
         String dateString = dateFormat.format(currentDate);
         System.out.println("Formatted Date: " + dateString);
     	
     	return clienteDao.actualizarCliente(
             cliente.getId(),
             cliente.getDni(),
             cliente.getApellido(),
             cliente.getCorreoElectronico(),
             cliente.getDireccion(),
             cliente.getEstado(),
             dateString,
             cliente.getLocalidad(),
             cliente.getNombre(),
             cliente.getSexo(),
             cliente.getTelefono()
         );
    }

    @Override
    public String actualizarCliente(Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, String fechanacimiento2, String localidad, String nombre, char sexo, String telefono) {
       
    	

    return clienteDao.actualizarCliente(id, dni, apellido, correoelectronico,direccion,estado,fechanacimiento2,localidad, nombre, sexo, telefono);
    }

    @Override
    public Cliente obtenerCliente(Long clienteId) {
        return clienteDao.obtenerCliente(clienteId);
    }

    @Override
    public String eliminarCliente(Long id) {
        return clienteDao.eliminarCliente(id);
    }
}
