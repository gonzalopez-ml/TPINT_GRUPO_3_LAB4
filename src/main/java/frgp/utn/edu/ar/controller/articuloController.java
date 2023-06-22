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
    @Autowired
    @Qualifier("articuloServicio")
    private ArticuloServicio articuloServicio;

    @Autowired
    private Articulo articulo;

    @Autowired
    private Stock stock;

    @Autowired
    private Marca marca1;

    @Autowired
    private TipoArticulo tipoArticulo;

    @RequestMapping("/guardarArticulo.html")
    public ModelAndView guardarArticulo(String nombre, String descripcion, Long marca, Long tipo, Double precio,
                                        Integer cantidad, Double precioCompra) {

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

        ModelAndView MV = new ModelAndView("listarArticulos");

        //TODO make validations!

        articuloServicio.insertarArticulo(articulo);

        ArrayList<Articulo> articulos= articuloServicio.obtenerArticulos();
        MV.addObject("articulos", articulos);

        return MV;
    }

    @RequestMapping("/actualizarArticulo.html")
    @ResponseBody()
    public ModelAndView actualizarArticulo(Long Id, String nombre, String descripcion, String marca, String tipo, Double precio, Boolean estado) {
        //TODO make validations!


        //TODO ir a buscar el que ID es a la base, mientras harcodeamos.
        stock.setId(1L);
        stock.setCantidad(4);
        stock.setPrecioCompra(precio);
        stock.setFechaIngreso(new Date());
        marca1.setMarca(marca);
        marca1.setId(1L);
        tipoArticulo.setNombreTipo(tipo);
        tipoArticulo.setId(1L);
        //TODO ir a buscar el que ID es a la base, mientras harcodeamos.


        articulo.setNombre(nombre);
        articulo.setDescripcion(descripcion);
        articulo.setTipoArticulo(tipoArticulo);
        articulo.setPrecioVenta(precio);
        articulo.setEstado(estado);
        articulo.setMarca(marca1);
        articulo.setId(Id);
        articulo.setStock(stock);

        stock.setArticulo(articulo);

        //TODO ir a buscar el que ID es a la base, mientras harcodeamos.

        articuloServicio.actualizarArticulo(articulo);


        ModelAndView MV = new ModelAndView("listarArticulos");
        //TODO make validations!
        ArrayList<Articulo> arr = articuloServicio.obtenerArticulos();
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
        MV.addObject("articulos", arr);
        
        return MV;
    }


    @RequestMapping("/guardar_archivo.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("articulo");
        return MV;
    }


}
