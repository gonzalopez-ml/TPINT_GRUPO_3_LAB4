package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import frgp.utn.edu.ar.servicioImpl.MarcaServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MarcaController {

    @Autowired
    private MarcaServicio marcaServicio;

    @RequestMapping(value = "/marcas-list.html", method = RequestMethod.GET)
    public ModelAndView verMarcas() {
        ModelAndView mv = new ModelAndView("marcas-list");
        mv.addObject("marcas", marcaServicio.getMarcas());
        return mv;
    }

    @RequestMapping(value = "/marcas.html", method = RequestMethod.GET)
    public ModelAndView marcaForm() {
        ModelAndView mv = new ModelAndView("marcas");
        Marca marca = new Marca();
        mv.addObject("marcas", marca);
        return mv;
    }

    @RequestMapping(value = "/guardar", method = RequestMethod.POST)
    public ModelAndView guardarMarca(@ModelAttribute("marca") Marca marca) {
        marcaServicio.guardarMarca(marca);
        return new ModelAndView("redirect:/marcas-list.html");
    }

    @RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
    public ModelAndView editarMarca(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("marcas");
        Marca marca = marcaServicio.getMarca(id);
        mv.addObject("marcas", marca);
        return mv;
    }

    @RequestMapping(value = "/eliminar/{id}", method = RequestMethod.GET)
    public ModelAndView eliminarMarca(@PathVariable("id") int id) {
        marcaServicio.eliminarMarca(id);
        return new ModelAndView("redirect:/marcas-list.html");
    }
}
