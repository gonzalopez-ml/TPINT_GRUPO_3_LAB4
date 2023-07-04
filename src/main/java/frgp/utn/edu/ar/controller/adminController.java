package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.LoginServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class adminController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("loginServicio")
    private LoginServicio loginServicio;


    @RequestMapping("agregarUsuario.html")
    public ModelAndView agregarUsuarios(HttpSession session) {
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.admin) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login");
                return MV;
            }
        }

        ModelAndView MV = new ModelAndView();
        MV.addObject("session", session);
        MV.setViewName("agregarUsuario");
        return MV;
    }

    @RequestMapping("guardarUsuario.html")
    public ModelAndView guardarUsuario(HttpSession session, String nombre, String password, String tipo) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.admin) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }


        if (nombre == null || !nombre.contains("@") || password == null || !nombre.contains(".com")) {
            mensaje = "Email incorrecto, por favor colocar @ o .com";
            MV.addObject("mensaje", mensaje);
            MV.setViewName("agregarUsuario");
            return MV;
        }

        Usuario usuario = (Usuario) appContext.getBean("usuario");

        usuario.setNombreUsuario(nombre);
        usuario.setTipoUsuario(TipoUsuarioEnum.valueOf(tipo));
        usuario.setContrasenia(password);
        usuario.setEstado(true);

        mensaje = loginServicio.insertarUsuario(usuario);

        ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();

        MV.addObject("usuarios", arr);
        MV.addObject("mensaje", mensaje);
        MV.setViewName("listarUsuarios");
        return MV;
    }

    @RequestMapping("eliminarUsuario.html")
    public ModelAndView eliminarUsuario(HttpSession session, Long idUsuario) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.admin) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }


        mensaje = loginServicio.eliminarUsuario(idUsuario);

        ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuarios");
        return MV;
    }

    @RequestMapping("modificarUsuario.html")
    public ModelAndView modificarUsuario(HttpSession session, Long idUsuario) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.admin) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        Usuario usuario = loginServicio.obtenerUsuarioPorId(idUsuario);

        if (usuario != null) {
            MV.addObject("usuarioModificar", usuario);
            MV.setViewName("modificarUsuario");
            return MV;
        }

        mensaje = "No se pudo encontrar Usuario";
        ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuarios");
        return MV;
    }

    @RequestMapping("actualizarUsuario.html")
    public ModelAndView actualizarUsuario(HttpSession session, Long Id, String pass) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.admin) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        mensaje = loginServicio.modificarUsuario(Id, pass);

        ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuarios");
        return MV;
    }

    @RequestMapping("listaUsuarios.html")
    public ModelAndView listarUsuarios(HttpSession session, Long Id, String pass) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.admin) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();
        mensaje = null;
        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuarios");
        return MV;
    }

}
