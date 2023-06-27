package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Usuario;

import java.util.ArrayList;

public interface ILoginServicio {

    Usuario obtenerUsuario(Usuario usuario);

    ArrayList<Usuario> obtenerUsuarios();

    String insertarUsuario(Usuario usuario);

    String eliminarUsuario(Long Id);
}
