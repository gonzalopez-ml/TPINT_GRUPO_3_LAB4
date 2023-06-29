package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;

import java.util.ArrayList;

public interface IArticuloDao {

    String insertarArticulo(Articulo articulo);

    ArrayList<Articulo> obtenerArticulos();

    String actualizarArticulo(Long Id, String nombre, String descripcion, Double precio, Integer cantidad, Double precioCompra, Long marca, Long tipo);

    Articulo obtenerArticulo(Long articuloId);

    ArrayList<Marca> obtenerMarcas();

    ArrayList<TipoArticulo> obtenerTipoArticulos();

    Stock obtenerStock(Long idArticulo);

    Stock obtenerTipoArticulo(Long idArticulo);

    String eliminarArticulo(Long Id);
}
