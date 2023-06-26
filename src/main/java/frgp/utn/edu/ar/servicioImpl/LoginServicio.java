package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.ILoginDao;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.servicio.ILoginServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginServicio")
public class LoginServicio implements ILoginServicio {

    @Autowired
    ILoginDao loginDao;

    @Override
    public Usuario obtenerUsuario(Usuario usuario) {
        return loginDao.obtenerUsuario(usuario);
    }
}
