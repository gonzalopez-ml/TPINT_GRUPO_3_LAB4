package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Articulo;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

public interface IArticuloDao {

    ResponseEntity insertarArticulo(Articulo articulo);

    ArrayList<Articulo> obtenerArticulos();

    ResponseEntity<Object> actualizarArticulo(Articulo articulo);

    Articulo obtenerArticulo(Long articuloId);
}
