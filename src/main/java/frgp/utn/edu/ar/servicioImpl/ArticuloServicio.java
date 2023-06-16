package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.daoImpl.ArticuloDaoImpl;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.servicio.IArticuloServicio;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;

public class ArticuloServicio implements IArticuloServicio {

    private IArticuloDao iArticuloDao;

    public ArticuloServicio() {
        iArticuloDao = new ArticuloDaoImpl();
    }

    @Override
    public ResponseEntity insertarArticulo(Articulo articulo) {
        return iArticuloDao.insertarArticulo(articulo);
    }

    @Override
    public ArrayList<Articulo> obtenerArticulos() {
        return iArticuloDao.obtenerArticulos();
    }

    @Override
    public ResponseEntity actualizarArticulo(Articulo articulo) {
        return iArticuloDao.actualizarArticulo(articulo);
    }
}
