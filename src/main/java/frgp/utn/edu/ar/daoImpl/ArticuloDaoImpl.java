package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.IArticuloDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.entidad.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class ArticuloDaoImpl implements IArticuloDao {

    @Override
    public String insertarArticulo(Articulo articulo) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();
            session.save(articulo);
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
    public ArrayList<Articulo> obtenerArticulos() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Articulo a where a.estado = true";
        ArrayList<Articulo> arr = (ArrayList<Articulo>) session.createQuery(hql).list();
        return (ArrayList<Articulo>) session.createQuery(hql).list();
    }

    @Override
    public String actualizarArticulo(Long Id, String nombre, String descripcion, Double precio, Integer cantidad, Double precioCompra) {

        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            Articulo articulo = (Articulo) session.get(Articulo.class, Id);

            Stock stock = articulo.getStock();
            stock.setCantidad(cantidad);
            stock.setPrecioCompra(precioCompra);

            articulo.setNombre(nombre);
            articulo.setDescripcion(descripcion);
            articulo.setPrecioVenta(precio);
            articulo.setStock(stock);

            session.update(articulo);
            transaction.commit();
            session.close();
            return "El articulo se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al modificar los datos: Verifique los datos";
        }
    }

    @Override
    public Articulo obtenerArticulo(Long articuloId) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        return  (Articulo) session.get(Articulo.class, articuloId);
    }

    @Override
    public ArrayList<Marca> obtenerMarcas() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Marca a";
        return (ArrayList<Marca>) session.createQuery(hql).list();
    }

    @Override
    public ArrayList<TipoArticulo> obtenerTipoArticulos() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM TipoArticulo ";
        ArrayList<TipoArticulo> tipos = (ArrayList<TipoArticulo>) session.createQuery(hql).list();
        return       tipos;
    }

    @Override
    public Stock obtenerStock(Long idArticulo) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Stock WHERE idArticulo = :idArticulo";
        Query query = session.createQuery(hql);
        query.setParameter("idArticulo", idArticulo);
        Stock  stock = (Stock) query.uniqueResult();
        session.close();
        return stock;
    }

    @Override
    public Stock obtenerTipoArticulo(Long idArticulo) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM TipoArticulo WHERE idArticulo =" + idArticulo;

        return (Stock) session.createQuery(hql);
    }

    @Override
    public String eliminarArticulo(Long Id) {

        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            Articulo articulo = (Articulo) session.get(Articulo.class, Id);

            articulo.setEstado(false);

            session.update(articulo);
            transaction.commit();
            session.close();
            return "El articulo se elimino con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al eliminar articulo, intente nuevamente";
        }
    }
}
