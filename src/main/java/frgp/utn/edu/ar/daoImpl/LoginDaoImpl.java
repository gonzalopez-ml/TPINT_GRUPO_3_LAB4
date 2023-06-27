package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.ILoginDao;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class LoginDaoImpl implements ILoginDao {
    public Usuario obtenerUsuario(Usuario usuario) {

        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            String hql = "FROM Usuario u WHERE u.nombreUsuario = :user AND u.contrasenia = :pass and u.estado = true";
            Query query = session.createQuery(hql);
            query.setParameter("user", usuario.getNombreUsuario());
            query.setParameter("pass", usuario.getContrasenia());
            Usuario usuarioDevuelto = (Usuario) query.uniqueResult();
            session.close();
            return usuarioDevuelto;
        } catch (Exception e) {
            return new Usuario();
        }
    }

    public Usuario obtenerUsuarioPorUsuario(Usuario usuario) {

        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            String hql = "FROM Usuario u WHERE u.nombreUsuario = :user";
            Query query = session.createQuery(hql);
            query.setParameter("user", usuario.getNombreUsuario());
            Usuario usuarioDevuelto = (Usuario) query.uniqueResult();
            session.close();
            return usuarioDevuelto;
        } catch (Exception e) {
            return new Usuario();
        }
    }

    public Usuario obtenerUsuarioPorId(Long idUsuario) {

        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();
            Usuario usuario = (Usuario) session.get(Usuario.class, idUsuario);
            session.close();
            return usuario;
        } catch (Exception e) {
            return new Usuario();
        }
    }

    @Override
    public ArrayList<Usuario> obtenerUsuarios() {
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            String hql = "FROM Usuario u where u.estado = true";

            ArrayList<Usuario> arr = (ArrayList<Usuario>) session.createQuery(hql).list();
            session.close();
            return arr;
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    @Override
    public ArrayList<Usuario> obtenerUsuariosPorTipo() {
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            String hql = "FROM Usuario u where u.estado = true AND u.TipoUsuario <> :tipo";
            Query query = session.createQuery(hql);
            query.setParameter("tipo", TipoUsuarioEnum.admin);

            ArrayList<Usuario> arr = (ArrayList<Usuario>) query.list();
            session.close();
            return arr;
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    @Override
    public String insertarUsuario(Usuario usuario) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();
            session.save(usuario);
            transaction.commit();
            session.close();
            return "El usuario se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al usuario los datos: Verifique los datos";
        }
    }


    @Override
    public String eliminarUsuario(Long Id) {

        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            Usuario usuario = (Usuario) session.get(Usuario.class, Id);

            usuario.setEstado(false);

            session.update(usuario);
            transaction.commit();
            session.close();
            return "El usuario se elimino con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al eliminar usuario, intente nuevamente";
        }
    }

    @Override
    public String modificarUsuario(Long Id, String pass) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            Usuario usuario = (Usuario) session.get(Usuario.class, Id);

            usuario.setContrasenia(pass);

            session.update(usuario);
            transaction.commit();
            session.close();
            return "El Usuario se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al modificar los datos: Verifique los datos";
        }    }
}
