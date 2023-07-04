package frgp.utn.edu.ar.controller;


import frgp.utn.edu.ar.entidad.*;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.resources.Config;
import frgp.utn.edu.ar.servicioImpl.ClienteServicio;
import frgp.utn.edu.ar.servicioImpl.VentaServicio;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

@Controller
public class VentaController {

    ApplicationContext appContext = new AnnotationConfigApplicationContext(Config.class);

    @Autowired
    @Qualifier("ventaServicio")
    private VentaServicio ventaServicio;

    @Autowired
    private ClienteServicio clienteServicio;

    @Autowired
    private ArticuloServicio articuloServicio;
    @RequestMapping("/guardarVenta.html")
    public ModelAndView guardarVenta(HttpServletRequest request, HttpSession session) {
        /*if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login");
                return MV;
            }
        }*/

        Venta venta1 = (Venta) appContext.getBean("venta");
        DetalleVenta detalle = (DetalleVenta) appContext.getBean("detalleVenta");
        Cliente cliente1 =  (Cliente) appContext.getBean("cliente");

        String idCliente = request.getParameter("idCliente");
        Double montoTotal = Double.valueOf(request.getParameter("montoTotal"));

        cliente1 = clienteServicio.obtenerCliente(Long.valueOf(idCliente));

        String fechaVentaStr = request.getParameter("fechaVenta");
        LocalDate fechaVenta = LocalDate.parse(fechaVentaStr);

        Instant instant = fechaVenta.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant();
        Date date = Date.from(instant);

        venta1.setFechaVenta(date);
        venta1.setIdCliente(cliente1);
        venta1.setMontoTotal(montoTotal);
        venta1.setEstadoVenta(true);

        String[] idArticuloValues = request.getParameterValues("detalle[].idArticulo");
        String[] cantidadValues = request.getParameterValues("detalle[].cantidad");

        List<DetalleVenta> detalle1 = new ArrayList<DetalleVenta>();

        for (int i = 0; i < idArticuloValues.length; i++) {
            Articulo art = articuloServicio.obtenerArticulo(Long.valueOf(idArticuloValues[i]));
            detalle.setIdArticulo(art);
            detalle.setPrecioVenta(art.getPrecioVenta());
            detalle.setCantidad(Integer.parseInt(cantidadValues[i]));
            detalle.setImporte(art.getPrecioVenta()*Integer.parseInt(cantidadValues[i]));
            //ventaServicio.insertarDetalleVenta(detalle);
            detalle1.add(detalle);
        }

        venta1.setDetalles(detalle1);

        String seGuardo = ventaServicio.insertarVenta(venta1);

        //TODO make validations!


        ModelAndView MV = new ModelAndView("listarVentas");
        ArrayList<Venta> ventas= ventaServicio.obtenerVentas();
        //MV.addObject("mensajeGuardado", seGuardo);
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


    @RequestMapping("/cargarRegistroVenta.html")
    public ModelAndView cargarRegistro(HttpSession session) {
        /*if (session != null) {
            Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
            if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.vendedor) {
                ModelAndView MV = new ModelAndView();
                String error = "No posee permisos para ver esta página, loguearse nuevamente";
                MV.addObject("error", error);
                MV.setViewName("login2");
                return MV;
            }
        }*/

        ModelAndView MV = new ModelAndView();
        //clientes
        ArrayList<Cliente> clientes = clienteServicio.obtenerClientes();

        //articulos
        ArrayList<Articulo> articulos = articuloServicio.obtenerArticulos();


        MV.setViewName("agregarVenta");
        MV.addObject("clientes", clientes);
        MV.addObject("articulos", articulos);

        return MV;
    }


}
