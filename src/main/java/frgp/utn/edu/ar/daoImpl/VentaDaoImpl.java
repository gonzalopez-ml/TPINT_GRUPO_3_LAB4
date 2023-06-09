package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.IVentaDao;
import frgp.utn.edu.ar.entidad.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@Repository
public class VentaDaoImpl implements IVentaDao {


    @Override
    public String insertarVenta(Venta venta) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();
            session.save(venta);
            transaction.commit();
            session.close();
            return "La venta se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al guardar la venta: Verifique los datos";
        }
    }

    @Override
    public ArrayList<Venta> obtenerVentas() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Venta v";
        ArrayList<Venta> arr = (ArrayList<Venta>) session.createQuery(hql).list();
        return (ArrayList<Venta>) session.createQuery(hql).list();
    }

    @Override
    public ArrayList<Venta> obtenerVentasPorFecha(String fecha1, String fecha2) throws ParseException {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        fecha1 = String.valueOf(dateFormat.parse(fecha1));
        fecha2 = String.valueOf(dateFormat.parse(fecha2));

        String hql = "FROM Venta WHERE fechaVenta BETWEEN :fechaDesde AND :fechaHasta";
        Query query = session.createQuery(hql);
        query.setParameter("fechaDesde", fecha1);
        query.setParameter("fechaHasta", fecha2);

        return (ArrayList<Venta>) query.list();
    }

    @Override
    public String eliminarVenta(Long Id) {

        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            Venta venta = (Venta) session.get(Venta.class, Id);

            venta.setEstadoVenta(false);

            session.update(venta);
            transaction.commit();
            session.close();

            return "La venta se elimino con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al eliminar venta, intente nuevamente";
        }
    }

    public void insertarDetalleVenta(DetalleVenta dventa) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();
            session.save(dventa);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }

    @Override
    public Venta obtenerVenta(Long ventaId) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        return  (Venta) session.get(Venta.class, ventaId);
    }

    @Override
    public ArrayList<DetalleVenta> obtenerDetallesVenta(Long ventaId) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        Venta venta =  (Venta) session.get(Venta.class, ventaId);
        return (ArrayList<DetalleVenta>) venta.getDetalles();
    }

    @Override
    public Long ObtenerUltimaVenta() {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        Venta venta = (Venta) session.createQuery("from Venta ORDER BY Id DESC")
                .setMaxResults(1).uniqueResult();
        return venta.getId();
    }
}
