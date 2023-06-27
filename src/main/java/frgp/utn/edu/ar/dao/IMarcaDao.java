package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Marca;
import org.springframework.http.ResponseEntity;
import java.util.ArrayList;


public interface IMarcaDao {
    ResponseEntity<Object> guardar(Marca marca);
    ArrayList<Marca> getMarcas();
    Marca getMarca(int id);
    ResponseEntity<Object> eliminar(int id);
}


