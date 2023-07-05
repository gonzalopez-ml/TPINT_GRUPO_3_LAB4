package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import frgp.utn.edu.ar.servicioImpl.StockServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class StockController {

    @Autowired
    @Qualifier("stockServicio")
    private StockServicio stockServicio;

    @Autowired
    @Qualifier("articuloServicio")
    private ArticuloServicio articuloServicio;

    @RequestMapping("/guardarStock.html")
    public ModelAndView guardarStock(Long articuloId, Date fechaIngreso, Integer cantidad, Double precioCompra, HttpSession session) {
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, inicie sesión nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login");
                return MV;
            }
        }

        Articulo articulo = articuloServicio.obtenerArticulo(articuloId);

        Stock stock = new Stock();
        stock.setArticulo(articulo);
        stock.setFechaIngreso(fechaIngreso);
        stock.setCantidad(cantidad);
        stock.setPrecioCompra(precioCompra);

        String seGuardo = stockServicio.insertarStock(stock);

        ModelAndView MV = new ModelAndView("listarStock");
        ArrayList<Stock> Stock = stockServicio.obtenerStock();
        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("stock", Stock);

        return MV;
    }

    @RequestMapping("/listarStock.html")
    public ModelAndView listarStock(HttpSession session) {
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, inicie sesión nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login");
                return MV;
            }
        }

        ModelAndView MV = new ModelAndView("listarStock");
                //TODO make validations!
        ArrayList<Stock> stock = stockServicio.obtenerStock();
        MV.addObject("stock", stock);
        
        return MV;
        
        
       /* ModelAndView MV = new Model/*AndView("listarClientes");
        //TODO make validations!
        ArrayList<Cliente> clientes = clienteServicio.obtenerClientes();
        MV.addObject("clientes", clientes);
        
        return MV;*/
        
        
        
       
        
           
        
    }

   

    @RequestMapping("/guardar_archivo_stock.html")
    public ModelAndView evento(HttpSession session) {
        if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, inicie sesión nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login");
                return MV;
            }
        }

        ModelAndView MV = new ModelAndView();
        ArrayList<Articulo> articulos = articuloServicio.obtenerArticulos();
        MV.setViewName("stock");
        MV.addObject("articulos", articulos);

        return MV;
    }
}
