package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.entidad.Articulo;
import org.springframework.orm.hibernate4.HibernateTemplate;

import java.util.ArrayList;

public class ArticuloDaoImpl implements IArticuloDao {

    private HibernateTemplate hibernateTemplate = null;

    @Override
    public void insertarArticulo(Articulo articulo) {
        this.hibernateTemplate.save(articulo);
    }

    @Override
    public ArrayList<Articulo> obtenerArticulos() {
        return (ArrayList<Articulo>) this.hibernateTemplate.loadAll(Articulo.class);
    }

    @Override
    public void eliminarArticulo(Articulo idArticulo) {
        //TODO hacer baja lógica !!
        this.hibernateTemplate.delete(idArticulo);
    }

    @Override
    public void actualizarArticulo(Articulo articulo) {
        this.hibernateTemplate.update(articulo);
    }
}
