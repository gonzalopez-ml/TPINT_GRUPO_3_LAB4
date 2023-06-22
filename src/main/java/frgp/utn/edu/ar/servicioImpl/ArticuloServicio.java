package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.servicio.IArticuloServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("articuloServicio")
public class ArticuloServicio implements IArticuloServicio {

    @Autowired
    private IArticuloDao articuloDao;

    @Override
    public ResponseEntity insertarArticulo(Articulo articulo) {
        return articuloDao.insertarArticulo(articulo);
    }

    @Override
    public ArrayList<Articulo> obtenerArticulos() {
        return articuloDao.obtenerArticulos();
    }

    @Override
    public ResponseEntity actualizarArticulo(Articulo articulo) {
        return articuloDao.actualizarArticulo(articulo);
    }

    @Override
    public Articulo obtenerArticulo(Long articuloId) {
        return articuloDao.obtenerArticulo(articuloId);
    }
}
