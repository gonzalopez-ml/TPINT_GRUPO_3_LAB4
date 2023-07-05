package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.IStockDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.entidad.Stock;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class StockDaoImpl implements IStockDao {

    @Override
    public String insertarStock(Stock stock) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();
            session.save(stock);
            transaction.commit();
            session.close();
            return "El articulo se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al guardar los datos: Verifique los datos";
        }
    }


    @Override
    public ArrayList<Stock> obtenerStock() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session = ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Stock";
        return (ArrayList<Stock>) session.createQuery(hql).list();
       
      
    }
    

    
    
    
    

    @Override
    public Stock obtenerStockPorId(Long id) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session = ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Stock WHERE id = :id";
        Stock stock = (Stock) session.createQuery(hql)
                .setParameter("id", id)
                .uniqueResult();
        session.close();
        return stock;
    }

    // Otros métodos para consultas y actualizaciones específicas
}
