package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.ILoginDao;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.servicio.ILoginServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("loginServicio")
public class LoginServicio implements ILoginServicio {

    @Autowired
    ILoginDao loginDao;

    @Override
    public Usuario obtenerUsuario(Usuario usuario) {
        return loginDao.obtenerUsuario(usuario);
    }

    @Override
    public ArrayList<Usuario> obtenerUsuarios() {
        return loginDao.obtenerUsuarios();
    }

    @Override
    public String insertarUsuario(Usuario usuario) {
        Usuario usuario1 = loginDao.obtenerUsuarioPorUsuario(usuario);

        if (usuario1 != null) {
            return "El usuario ya existe en BD";
        }

        return loginDao.insertarUsuario(usuario);
    }

    @Override
    public String eliminarUsuario(Long Id) {
        return loginDao.eliminarUsuario(Id);
    }
}

