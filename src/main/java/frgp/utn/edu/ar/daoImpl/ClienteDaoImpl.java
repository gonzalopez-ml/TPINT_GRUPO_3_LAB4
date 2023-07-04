package frgp.utn.edu.ar.daoImpl;

import frgp.utn.edu.ar.dao.ConfigHibernate;
import frgp.utn.edu.ar.dao.IClienteDao;
import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.entidad.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import java.net.URLDecoder;
import java.util.ArrayList;


@Repository
public class ClienteDaoImpl implements IClienteDao {

    @Override
    public String insertarCliente(Cliente cliente) {
        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            String hql = "FROM Cliente c WHERE c.dni = :dni";
            Query query = session.createQuery(hql);
            query.setParameter("dni", cliente.getDni());
            Cliente clienteDevuelto = (Cliente) query.uniqueResult();

            if (clienteDevuelto != null) {
                session.close();
                return "El cliente ya se encuentra en la BD";
            }

            transaction = session.beginTransaction();
            session.save(cliente);
            transaction.commit();
            session.close();
            return "El cliente se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al guardar los datos: Verifique los datos";
        }
    }

    @Override
    public ArrayList<Cliente> obtenerClientes() {
    	
    	
    	ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        String hql = "FROM Cliente c WHERE c.estado != 0";
        return (ArrayList<Cliente>) session.createQuery(hql).list();
    }

    @Override
    public String actualizarCliente(Long id, String dni, String apellido, String correoelectronico, String direccion, int estado, String fechanacimiento2, String localidad, String nombre, char sexo, String telefono) {
        
    	
    	Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            
            Cliente cliente = (Cliente) session.get(Cliente.class, id);
          
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date fechanacimiento = sdf.parse(fechanacimiento2);
            
          
            cliente.setId(id);
            cliente.setDni(dni);
            cliente.setApellido(apellido);
            cliente.setCorreoElectronico(correoelectronico);
            cliente.setDireccion(direccion);
            cliente.setEstado(estado);
            cliente.setFechanacimiento(fechanacimiento);
            cliente.setLocalidad(localidad);
            cliente.setNombre(nombre);
            cliente.setSexo(sexo);
            cliente.setTelefono(telefono);

            System.out.println("   Session");
            
            session.update(cliente);
            transaction.commit();
            session.close();
            return "El cliente se guardo con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al modificar los datos: Verifique los datos";
        }
    }

    @Override
    public Cliente obtenerCliente(Long id) {
        ConfigHibernate ch = new ConfigHibernate();
        Session session= ch.abrirConexion();

        session.beginTransaction();

        return  (Cliente) session.get(Cliente.class, id);
    }

    @Override
    public String eliminarCliente(Long Id) {

        Transaction transaction = null;
        try {
            ConfigHibernate ch = new ConfigHibernate();
            Session session= ch.abrirConexion();

            transaction = session.beginTransaction();

            Cliente cliente = (Cliente) session.get(Cliente.class, Id);

            cliente.setEstado(0); // 0 para clientes inactivos

            session.update(cliente);
            transaction.commit();
            session.close();
            return "El cliente se elimino con exito";
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return "Error al eliminar cliente, intente nuevamente";
        }
    }
}
