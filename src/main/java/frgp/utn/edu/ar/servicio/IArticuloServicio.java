package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.TipoArticulo;

import java.util.ArrayList;

public interface IArticuloServicio {
    String insertarArticulo(Articulo articulo);

    ArrayList<Articulo> obtenerArticulos();

    String actualizarArticulo(Articulo articulo);

    String actualizarArticulo(Long Id, String nombre, String descripcion, Double precio);

    Articulo obtenerArticulo(Long articuloId);

    ArrayList<Marca> obtenerMarcas();

    ArrayList<TipoArticulo> obtenerTipoArticulo();

    String eliminarArticulo(Long id);
}
