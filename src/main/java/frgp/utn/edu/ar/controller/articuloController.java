package frgp.utn.edu.ar.controller;


import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;

@Controller
public class articuloController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("articuloServicio")
    private ArticuloServicio articuloServicio;

    @RequestMapping("/guardarArticulo.html")
    public ModelAndView guardarArticulo(String nombre, String descripcion, Long marca, Long tipo, Double precio,
                                        Integer cantidad, Double precioCompra) {


        Articulo articulo = (Articulo) appContext.getBean("articulo");
        Stock stock =  (Stock) appContext.getBean("stock");
        Marca marca1 =  (Marca) appContext.getBean("marca");
        TipoArticulo tipoArticulo =  (TipoArticulo) appContext.getBean("tipoArticulo");

        marca1.setId(marca);
        tipoArticulo.setId(tipo);

        stock.setCantidad(cantidad);
        stock.setFechaIngreso(new Date());
        stock.setPrecioCompra(precioCompra);
        stock.setArticulo(articulo);

        articulo.setNombre(nombre);
        articulo.setDescripcion(descripcion);
        articulo.setPrecioVenta(precio);
        articulo.setTipoArticulo(tipoArticulo);
        articulo.setMarca(marca1);
        articulo.setEstado(true);
        articulo.setStock(stock);


        //TODO make validations!

        String seGuardo = articuloServicio.insertarArticulo(articulo);

        ModelAndView MV = new ModelAndView("listarArticulos");
        ArrayList<Articulo> articulos= articuloServicio.obtenerArticulos();
        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("articulos", articulos);

        return MV;
    }

    @RequestMapping("/actualizarArticulo.html")
    @ResponseBody()
    public ModelAndView actualizarArticulo(Long Id, String nombre, String descripcion, Double precio) {
        //TODO make validations!

        Articulo articulo = (Articulo) appContext.getBean("articulo");

        articulo.setNombre(nombre);
        articulo.setDescripcion(descripcion);
        articulo.setPrecioVenta(precio);
        articulo.setId(Id);

        String seGuardo = articuloServicio.actualizarArticulo(Id, nombre, descripcion, precio);

        ModelAndView MV = new ModelAndView("listarArticulos");
        //TODO make validations!
        ArrayList<Articulo> arr = articuloServicio.obtenerArticulos();
        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("articulos", articuloServicio.obtenerArticulos());

        return MV;
    }

    @RequestMapping("/articuloParaActualizar.html")
    public ModelAndView articuloParaActualizar(Long idArticuloAActualizar) {

        //TODO make validations!
        Articulo articulo = articuloServicio.obtenerArticulo(idArticuloAActualizar);

        ModelAndView MV = new ModelAndView();
        MV.addObject("articulo", articulo);
        MV.setViewName("modificarArticulo");
        return MV;
    }

    @RequestMapping(value ="/recuperarArticulos.html", method = RequestMethod.GET)
    @ResponseBody()
    public ModelAndView recuperarArticulos() {
    	ModelAndView MV = new ModelAndView("listarArticulos");
        //TODO make validations!
        ArrayList<Articulo> arr = articuloServicio.obtenerArticulos();

        if (arr.isEmpty()) {
            MV.addObject("data-empty-message", "No existen articulos en la base");
        }

        MV.addObject("articulos", arr);
        
        return MV;
    }

    @RequestMapping(value ="/eliminarArticulo.html", method = RequestMethod.GET)
    @ResponseBody()
    public ModelAndView eliminarArticulo(Long idArticuloAeliminar) {

        String seGuardo = articuloServicio.eliminarArticulo(idArticuloAeliminar);

        //TODO make validations!
        ModelAndView MV = new ModelAndView("listarArticulos");
        ArrayList<Articulo> arr = articuloServicio.obtenerArticulos();

        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("articulos", arr);

        return MV;
    }


    @RequestMapping("/guardar_archivo.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();

        //marcas
        ArrayList<Marca> marcas = articuloServicio.obtenerMarcas();

        //tipos de articulo
        ArrayList<TipoArticulo> tipoArticulos = articuloServicio.obtenerTipoArticulo();


        MV.setViewName("articulo");
        MV.addObject("marcas", marcas);
        MV.addObject("tipoArticulos", tipoArticulos);

        return MV;
    }


}
