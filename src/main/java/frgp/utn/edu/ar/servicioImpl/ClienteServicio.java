package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IClienteDao;
import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.servicio.IClienteServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        
    	    	
    	return clienteDao.actualizarCliente(
            cliente.getId(),
            cliente.getDni(),
            cliente.getApellido(),
            cliente.getCorreoElectronico(),
            cliente.getDireccion(),
            cliente.getEstado(),
            cliente.getFechanacimiento(),
            cliente.getLocalidad(),
            cliente.getNombre(),
            cliente.getSexo(),
            cliente.getTelefono()
        );
    }

    @Override
    public String actualizarCliente(Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, Date fechanacimiento, String localidad, String nombre, char sexo, String telefono) {
       
    	

    return clienteDao.actualizarCliente(id, dni, apellido, correoelectronico,direccion,estado,fechanacimiento,localidad, nombre, sexo, telefono);
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
