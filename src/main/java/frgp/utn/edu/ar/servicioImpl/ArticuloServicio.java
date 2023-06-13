package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.servicio.IArticuloServicio;

import java.util.ArrayList;

public class ArticuloServicio implements IArticuloServicio {

    private IArticuloDao iArticuloDao;

    @Override
    public void insertarArticulo(Articulo articulo) {
        this.iArticuloDao.insertarArticulo(articulo);
    }

    @Override
    public ArrayList<Articulo> obtenerArticulos() {
        return this.iArticuloDao.obtenerArticulos();
    }

    @Override
    public void eliminarArticulo(Articulo idArticulo) {
        this.iArticuloDao.eliminarArticulo(idArticulo);
    }

    @Override
    public void actualizarArticulo(Articulo articulo) {
        this.iArticuloDao.actualizarArticulo(articulo);
    }
}
