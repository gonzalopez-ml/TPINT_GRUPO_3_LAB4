package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.ILoginDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl implements ILoginDao {
    public Usuario obtenerUsuario(Usuario usuario) {

        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            String hql = "FROM Usuario u WHERE u.nombreUsuario = :nombreUsuario AND u.contrasenia = :pass";
            Query query = session.createQuery(hql);
            query.setParameter("nombreUsuario", usuario.getNombreUsuario());
            query.setParameter("pass", usuario.getContrasenia());
            session.close();
            return (Usuario) query.uniqueResult();
        } catch (Exception e) {
            return new Usuario();
        }
    }
}
