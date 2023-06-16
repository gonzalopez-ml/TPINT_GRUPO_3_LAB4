package frgp.utn.edu.ar.dao;

import org.hibernate.Session;

public class daoHibernate {

    public static <T> void Add(Object o)
    {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();
        session.save(o);

        session.getTransaction().commit();
        ch.cerrarSession();
    }
}
