package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Marca;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface IMarcaServicio {
    ResponseEntity guardar(Marca marca);

    List<Marca> getMarcas();

    ResponseEntity actualizar(Marca marca);

    Marca getMarca(int id);

    ResponseEntity eliminar(int id);
}