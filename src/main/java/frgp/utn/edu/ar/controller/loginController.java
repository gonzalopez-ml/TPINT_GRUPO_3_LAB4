package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import frgp.utn.edu.ar.servicioImpl.LoginServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class loginController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("loginServicio")
    private LoginServicio loginServicio;

    @Autowired
    @Qualifier("articuloServicio")
    private ArticuloServicio articuloServicio;

    @RequestMapping("irLogin.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("login2");
        return MV;
    }

    @RequestMapping("login.html")
    public ModelAndView login(String email, String password) {

        String error = "";
        ModelAndView MV = new ModelAndView();

        if (email == null || password == null) {
            error = "Email incorrecto, por favor colocar @ o .com";
            MV.addObject("error", error);
            MV.setViewName("login2");
            return MV;
        }

        if (!email.contains("@") && !email.contains(".com")) {
            error = "Email incorrecto, por favor colocar @ o .com";
            MV.addObject("error", error);
            MV.setViewName("login2");
            return MV;
        }

        Usuario usuario = (Usuario) appContext.getBean("usuario");

        usuario.setNombreUsuario(email);
        usuario.setContrasenia(password);

        Usuario usuario1 = loginServicio.obtenerUsuario(usuario);

        if (usuario1 != null) {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario1);
            session.setAttribute("loggedIn", true);

            // TODO enviar al otro usuario a otra vista de reportes.
            if (usuario1.getTipoUsuario() == TipoUsuarioEnum.admin) {
                MV.setViewName("listarUsuarios");
                ArrayList<Usuario> arr = loginServicio.obtenerUsuarios();

                MV.addObject("session", session);
                MV.addObject("usuarios", arr);
                return MV;
            }

            // TODO enviar al otro usuario a otra vista de reportes.
            if (usuario1.getTipoUsuario() == TipoUsuarioEnum.contador) {
                MV.setViewName("reportes");

                ArrayList<Usuario> arr = new ArrayList<>();

                MV.addObject("session", session);
                MV.addObject("usuarios", arr);
                return MV;
            }

            MV.setViewName("listarArticulos");
            ArrayList<Articulo> arr = articuloServicio.obtenerArticulos();

            MV.addObject("session", session);
            MV.addObject("articulos", arr);
            return MV;
        }

        error = "El usuario no se encuentra en la base de datos";

        MV.addObject("error", error);
        MV.setViewName("login2");
        return MV;
    }

    @RequestMapping("errorLogin.html")
    public ModelAndView errorLogin() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("login2");
        return MV;
    }


    @RequestMapping(value = "logout.html")
    public ModelAndView logout(HttpSession session) {
        // Invalidar la sesión
        session.invalidate();

        ModelAndView MV = new ModelAndView();
        MV.setViewName("login2");
        return MV;
    }
}
