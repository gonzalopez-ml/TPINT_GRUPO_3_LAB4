package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Articulo;

import java.util.ArrayList;

public interface IArticuloDao {

    void insertarArticulo(Articulo articulo);

    ArrayList<Articulo> obtenerArticulos();

    void eliminarArticulo(Articulo idArticulo);

    void actualizarArticulo(Articulo articulo);
}
