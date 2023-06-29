package frgp.utn.edu.ar.controller;

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
public class vendedorController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("loginServicio")
    private LoginServicio loginServicio;

    @RequestMapping("listaUsuariosVendedor.html")
    public ModelAndView listarUsuariosVendedor(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                String mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        ArrayList<Usuario> arr = loginServicio.obtenerUsuariosPorTipo();
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuariosVendedor");
        return MV;
    }

    @RequestMapping("eliminarUsuarioVendedor.html")
    public ModelAndView eliminarUsuarioVendedor(HttpSession session, Long idUsuario) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }


        mensaje = loginServicio.eliminarUsuario(idUsuario);

        ArrayList<Usuario> arr = loginServicio.obtenerUsuariosPorTipo();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuariosVendedor");
        return MV;
    }

    @RequestMapping("modificarVendedor.html")
    public ModelAndView modificarVendedor(HttpSession session, Long idUsuario) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        Usuario usuario = loginServicio.obtenerUsuarioPorId(idUsuario);

        if (usuario != null) {
            MV.addObject("usuario", usuario);
            MV.setViewName("modificarUsuarioVendedor");
            return MV;
        }

        mensaje = "No se pudo encontrar Usuario";
        ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuarios");
        return MV;
    }

    @RequestMapping("guardarUsuarioVendedor.html")
    public ModelAndView guardarUsuarioVendedor(HttpSession session, String nombre, String password, String tipo) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }


        if (nombre == null || !nombre.contains("@") || password == null || !nombre.contains(".com")) {
            mensaje = "Email incorrecto, por favor colocar @ o .com";
            MV.addObject("mensaje", mensaje);
            MV.setViewName("agregarUsuarioVendedor");
            return MV;
        }

        Usuario usuario = (Usuario) appContext.getBean("usuario");

        usuario.setNombreUsuario(nombre);
        usuario.setTipoUsuario(TipoUsuarioEnum.valueOf(tipo));
        usuario.setContrasenia(password);
        usuario.setEstado(true);

        mensaje = loginServicio.insertarUsuario(usuario);

        ArrayList<Usuario> arr = loginServicio.obtenerUsuariosPorTipo();

        MV.addObject("usuarios", arr);
        MV.addObject("mensaje", mensaje);
        MV.setViewName("listarUsuariosVendedor");
        return MV;
    }

    @RequestMapping("agregarUsuarioVendedor.html")
    public ModelAndView agregarUsuarios(HttpSession session) {
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login");
                return MV;
            }
        }

        ModelAndView MV = new ModelAndView();
        MV.setViewName("agregarUsuarioVendedor");
        return MV;
    }

    @RequestMapping("modificarUsuarioVendedor.html")
    public ModelAndView modificarUsuarioVendedor(HttpSession session, Long idUsuario) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        Usuario usuario = loginServicio.obtenerUsuarioPorId(idUsuario);

        if (usuario != null) {
            MV.addObject("usuario", usuario);
            MV.setViewName("modificarUsuarioVendedor");
            return MV;
        }

        mensaje = "No se pudo encontrar Usuario";
        ArrayList<Usuario> arr = loginServicio.obtenerUsuariosPorTipo();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuariosVendedor");
        return MV;
    }

    @RequestMapping("actualizarUsuarioVendedor.html")
    public ModelAndView actualizarUsuarioVendedor(HttpSession session, Long Id, String pass) {
        ModelAndView MV = new ModelAndView();
        String mensaje = "";
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                mensaje = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("mensaje", mensaje);
                MV.setViewName("login");
                return MV;
            }
        }

        mensaje = loginServicio.modificarUsuario(Id, pass);

        ArrayList<Usuario> arr = loginServicio.obtenerUsuariosPorTipo();

        MV.addObject("mensaje", mensaje);
        MV.addObject("usuarios", arr);
        MV.setViewName("listarUsuariosVendedor");
        return MV;
    }


}
