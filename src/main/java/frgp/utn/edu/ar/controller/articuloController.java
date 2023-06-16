package frgp.utn.edu.ar.controller;


import frgp.utn.edu.ar.dto.ArticuloDTO;
import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class articuloController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @RequestMapping(value ="/guardarArticulo.html", method = RequestMethod.POST)
    @ResponseBody()
    public ResponseEntity guardarArticulo(@RequestBody() ArticuloDTO articuloDTO) {

        //TODO make validations!
        Articulo articulo = (Articulo) appContext.getBean("articulo");
        Stock stock =  (Stock) appContext.getBean("stock");
        Marca marca =  (Marca) appContext.getBean("marca");
        TipoArticulo tipoArticulo =  (TipoArticulo) appContext.getBean("tipoArticulo");
        ArticuloServicio articuloServicio =  (ArticuloServicio) appContext.getBean("articuloServicio");

        marca.setId(articuloDTO.getMarcaId());
        tipoArticulo.setId(articuloDTO.getTipoId());

        articulo.setNombre(articuloDTO.getNombre());
        articulo.setDescripcion(articuloDTO.getDescripcion());
        articulo.setPrecioVenta(articuloDTO.getPrecio());
        articulo.setTipoArticulo(tipoArticulo);
        articulo.setMarca(marca);
        articulo.setEstado(articuloDTO.getEstado());

        stock.setCantidad(articuloDTO.getCantidad());
        stock.setFechaIngreso(articuloDTO.getFecha());
        stock.setPrecioCompra(articuloDTO.getPrecioCompra());
        stock.setArticulo(articulo);

        return articuloServicio.insertarArticulo(articulo);
    }

    @RequestMapping(value ="/actualizarArticulo.html", method = RequestMethod.POST)
    @ResponseBody()
    public ResponseEntity actualizarArticulo(@RequestParam Articulo articulo) {

        //TODO make validations!
        ArticuloServicio articuloServicio =  (ArticuloServicio) appContext.getBean("articuloServicio");

        return articuloServicio.actualizarArticulo(articulo);
    }

    @RequestMapping(value ="/recuperarArticulos.html", method = RequestMethod.GET)
    @ResponseBody()
    public ArrayList<Articulo> recuperarArticulos() {

        //TODO make validations!
        ArticuloServicio articuloServicio =  (ArticuloServicio) appContext.getBean("articuloServicio");

        return articuloServicio.obtenerArticulos();
    }


    @RequestMapping("/guardar_archivo.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("articulo");
        return MV;
    }


}
