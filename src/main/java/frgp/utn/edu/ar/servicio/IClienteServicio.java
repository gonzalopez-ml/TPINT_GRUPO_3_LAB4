package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Cliente;

import java.util.ArrayList;
import java.util.Date;

public interface IClienteServicio {
    String insertarCliente(Cliente cliente);

    ArrayList<Cliente> obtenerClientes();

    String actualizarCliente(Cliente cliente);

    String actualizarCliente(Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, Date fechanacimiento, String localidad, String nombre, char sexo, String telefono);

    Cliente obtenerCliente(Long clienteId);

    String eliminarCliente(Long id);
}
