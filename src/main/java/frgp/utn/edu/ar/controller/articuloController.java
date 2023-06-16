package frgp.utn.edu.ar.controller;


import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class articuloController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @RequestMapping("guardararticulo.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("articulo");
        return MV;
    }

    @RequestMapping("guardarArticulo")
    public String guardarArticulo(String nombre, String descripcion, String marcaInput, String tipo, Double precio, Date fecha,
                                  Integer cantidad, Double precioCompra) {

        //TODO make validations!
        Articulo articulo = (Articulo) appContext.getBean("articulo");
        Stock stock =  (Stock) appContext.getBean("stock");
        Marca marca =  (Marca) appContext.getBean("marca");
        TipoArticulo tipoArticulo =  (TipoArticulo) appContext.getBean("tipoArticulo");
        ArticuloServicio articuloServicio =  (ArticuloServicio) appContext.getBean("articuloServicio");

        marca.setMarca(marcaInput);
        tipoArticulo.setNombreTipo(tipo);

        articulo.setNombre(nombre);
        articulo.setDescripcion(descripcion);
        articulo.setPrecioVenta(precio);
        articulo.setTipoArticulo(tipoArticulo);
        articulo.setMarca(marca);

        stock.setCantidad(cantidad);
        stock.setFechaIngreso(fecha);
        stock.setPrecioCompra(precioCompra);
        stock.setArticulo(articulo);

        articuloServicio.insertarArticulo(articulo);

        return "ok";
    }

}
