package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.servicio.IArticuloServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("articuloServicio")
public class ArticuloServicio implements IArticuloServicio {

    @Autowired
    private IArticuloDao articuloDao;

    public ArticuloServicio(){}

    @Override
    public String insertarArticulo(Articulo articulo) {
        return articuloDao.insertarArticulo(articulo);
    }

    @Override
    public ArrayList<Articulo> obtenerArticulos() {
        return articuloDao.obtenerArticulos();
    }

    @Override
    public String actualizarArticulo(Articulo articulo) {
        return null;
    }

    @Override
    public String actualizarArticulo(Long Id, String nombre, String descripcion, Double precio, Long marca, Long tipo) {
        return articuloDao.actualizarArticulo(Id, nombre, descripcion, precio, marca, tipo);
    }

    @Override
    public Articulo obtenerArticulo(Long articuloId) {
        return articuloDao.obtenerArticulo(articuloId);
    }

    @Override
    public ArrayList<Marca> obtenerMarcas() {
        return articuloDao.obtenerMarcas();
    }

    @Override
    public ArrayList<TipoArticulo> obtenerTipoArticulo() {
        return articuloDao.obtenerTipoArticulos();
    }

    @Override
    public Stock obtenerStock(Long idArticulo) {
        return articuloDao.obtenerStock(idArticulo);
    }

    @Override
    public String eliminarArticulo(Long id) {
        return articuloDao.eliminarArticulo(id);
    }
}
