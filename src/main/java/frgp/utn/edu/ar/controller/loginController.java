package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import frgp.utn.edu.ar.servicioImpl.LoginServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.validation.constraints.Email;
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
        MV.setViewName("login");
        return MV;
    }

    @RequestMapping("login.html")
    public ModelAndView login(String email, String password) {

        String error = "";

        if (!email.contains("@") && !email.contains(".com")) {
            error = "Email incorrecto, por favor colocar @ o .com";
        }

        Usuario usuario = (Usuario) appContext.getBean("usuario");

        usuario.setNombreUsuario(email);
        usuario.setContrasenia(password);

        Usuario usuario1 = loginServicio.obtenerUsuario(usuario);

        ModelAndView MV = new ModelAndView();

        if (usuario1.getId() != null) {
            MV.setViewName("listarArticulos");
            ArrayList<Articulo> arr = articuloServicio.obtenerArticulos();
            MV.addObject("articulos", arr);
            return MV;
        }

        error = "El usuario no se encuentra en la base de datos";

        MV.addObject("error", error);
        MV.setViewName("login");
        return MV;
    }
}
