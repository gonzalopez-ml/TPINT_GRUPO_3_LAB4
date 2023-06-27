package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Cliente;

import java.util.ArrayList;
import java.util.Date;

public interface IClienteDao {

    String insertarCliente(Cliente cliente);

    ArrayList<Cliente> obtenerClientes();

    String actualizarCliente(Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, Date fechanacimiento, String localidad, String nombre, char sexo, String telefono);

    Cliente obtenerCliente(Long id);

    String eliminarCliente(Long id);
}
