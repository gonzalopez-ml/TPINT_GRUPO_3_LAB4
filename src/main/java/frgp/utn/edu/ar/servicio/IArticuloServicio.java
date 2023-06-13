package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Articulo;

import java.util.ArrayList;

public interface IArticuloServicio {
    void insertarArticulo(Articulo articulo);

    ArrayList<Articulo> obtenerArticulos();

    void eliminarArticulo(Articulo idArticulo);

    void actualizarArticulo(Articulo articulo);
}
