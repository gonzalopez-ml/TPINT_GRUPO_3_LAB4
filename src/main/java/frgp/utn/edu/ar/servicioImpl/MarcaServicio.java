package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.entidad.Marca;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class MarcaServicio {

    private IMarcaDao marcaDao;

    @Autowired
    public MarcaServicio(IMarcaDao theMarcaDao) {
        marcaDao = theMarcaDao;
    }

    @Transactional
    public List<Marca> getMarcas() {
        return marcaDao.getMarcas();
    }

    @Transactional
    public void guardarMarca(Marca theMarca) {
        marcaDao.guardar(theMarca);
    }

    @Transactional
    public Marca getMarca(int theId) {
        return marcaDao.getMarca(theId);
    }

    @Transactional
    public void eliminarMarca(int theId) {
        marcaDao.eliminar(theId);
    }
}
