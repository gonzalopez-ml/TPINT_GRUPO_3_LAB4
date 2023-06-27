package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Usuario;

import java.util.ArrayList;

public interface ILoginDao {
    Usuario obtenerUsuario(Usuario usuario);

    ArrayList<Usuario> obtenerUsuarios();

    String insertarUsuario(Usuario usuario);

    Usuario obtenerUsuarioPorUsuario(Usuario usuario);

    String eliminarUsuario(Long Id);
}
