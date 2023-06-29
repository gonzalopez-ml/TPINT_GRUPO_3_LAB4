package frgp.utn.edu.ar.controller;


import frgp.utn.edu.ar.entidad.*;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import frgp.utn.edu.ar.servicioImpl.VentaServicio;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class VentaController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("ventaServicio")
    private VentaServicio ventaServicio;

    @RequestMapping("/guardarVenta.html")
    public ModelAndView guardarVenta(Date fecha, Double montoTotal, ArrayList<DetalleVenta> detalleVenta, Cliente cliente, HttpSession session) {
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

        Venta venta1 = (Venta) appContext.getBean("venta");
        ArrayList<DetalleVenta> detalleVenta1 = (ArrayList<DetalleVenta>) appContext.getBean("detalleVenta");
        Cliente cliente1 =  (Cliente) appContext.getBean("cliente");


        venta1.setFechaVenta(fecha);
        venta1.setEstadoVenta(true);
        venta1.setMontoTotal(montoTotal);

        String seGuardo = ventaServicio.insertarVenta(venta1);

        for (DetalleVenta detalle : detalleVenta){
            detalle.setVenta(venta1);
            ventaServicio.insertarDetalleVenta(detalle);
        }

        //TODO make validations!


        ModelAndView MV = new ModelAndView("listarArticulos");
        ArrayList<Venta> ventas= ventaServicio.obtenerVentas();
        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("ventas", ventas);

        return MV;
    }


    @RequestMapping(value ="/listarVentas.html")
    public ModelAndView listarVentas(HttpSession session) {
        ModelAndView MV = new ModelAndView("listarVentas");
        //TODO make validations!
        ArrayList<Venta> arr = ventaServicio.obtenerVentas();

        if (arr.isEmpty()) {
            MV.addObject("data-empty-message", "No existen ventas en la base");
        }

        MV.addObject("ventas", arr);

        return MV;
    }


    @RequestMapping(value ="/eliminarVenta.html", method = RequestMethod.GET)
    @ResponseBody()
    public ModelAndView eliminarVenta(Long idVenta) {

        String seGuardo = ventaServicio.eliminarVenta(idVenta);

        //TODO make validations!
        ModelAndView MV = new ModelAndView("listarArticulos");
        ArrayList<Venta> arr = ventaServicio.obtenerVentas();

        MV.addObject("mensajeGuardado", seGuardo);
        MV.addObject("ventas", arr);

        return MV;
    }

/*
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
*/

}
