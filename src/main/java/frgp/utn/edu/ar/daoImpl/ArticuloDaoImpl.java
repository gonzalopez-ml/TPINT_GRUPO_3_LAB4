package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.entidad.Articulo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.orm.hibernate4.HibernateTemplate;

import java.util.ArrayList;

public class ArticuloDaoImpl implements IArticuloDao {

    private HibernateTemplate hibernateTemplate;

    @Override
    public ResponseEntity insertarArticulo(Articulo articulo) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();
        session.save(articulo);

        Transaction transaction = session.getTransaction();
        transaction.commit();

        if (transaction.wasCommitted()) {
            session.close();
            return new ResponseEntity<>(HttpStatus.CREATED);
        }

        session.close();
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @Override
    public ArrayList<Articulo> obtenerArticulos() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "SELECT a.nombre, a.descripcion, a.precioVenta FROM Articulo a";
        return (ArrayList<Articulo>) session.createQuery(hql).list();
    }

    @Override
    public ResponseEntity<Object> actualizarArticulo(Articulo articulo) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();
        session.update(articulo);

        Transaction transaction = session.getTransaction();

        if (transaction.wasCommitted()) {
            session.close();
            return new ResponseEntity<>(HttpStatus.ACCEPTED);
        }

        session.close();
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
