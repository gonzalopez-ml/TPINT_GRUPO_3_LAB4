package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Articulo;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;

public interface IArticuloServicio {
    ResponseEntity insertarArticulo(Articulo articulo);

    ArrayList<Articulo> obtenerArticulos();

    ResponseEntity<Object> actualizarArticulo(Articulo articulo);

    Articulo obtenerArticulo(Long articuloId);
}
