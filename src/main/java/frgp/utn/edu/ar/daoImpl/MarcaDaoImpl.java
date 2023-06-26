package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.IMarcaDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.List;

public class MarcaDaoImpl implements IMarcaDao {

    @Override
    public ResponseEntity guardar(Marca marca) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();
        session.saveOrUpdate(marca);

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
        public ArrayList<Marca> getMarcas() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM marca m WHERE m.status = 1";
        List<Marca> marcas = (List<Marca>) session.createQuery(hql).list();

        session.getTransaction().commit();
        session.close();

        return (ArrayList<Marca>) marcas;
    }

    @Override
    public Marca getMarca(int id) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        Marca marca = (Marca) session.get(Marca.class, id);

        session.getTransaction().commit();
        session.close();

        return marca;
    }

    
     
    
    
    @Override
    public ResponseEntity eliminar(int id) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        Marca marca = (Marca) session.get(Marca.class, id);
        if (marca != null) {
            marca.setStatus(0);
            session.update(marca);
            session.getTransaction().commit();
            session.close();
            return new ResponseEntity<>(HttpStatus.ACCEPTED);
        }

        session.close();
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
