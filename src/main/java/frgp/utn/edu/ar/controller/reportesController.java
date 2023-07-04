package frgp.utn.edu.ar.controller;

import frgp.utn.edu.ar.entidad.Cliente;
import frgp.utn.edu.ar.entidad.Usuario;
import frgp.utn.edu.ar.entidad.Venta;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import frgp.utn.edu.ar.servicio.IVentaServicio;
import frgp.utn.edu.ar.servicioImpl.ClienteServicio;
import frgp.utn.edu.ar.servicioImpl.LoginServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;

@Controller
public class reportesController {

    @Autowired
    @Qualifier("ventaServicio")
    private IVentaServicio ventaServicio;

    @Autowired
    @Qualifier("clienteServicio")
    private ClienteServicio clienteServicio;

    @RequestMapping(value ="/recuperarReporte.html", method = RequestMethod.GET)
    @ResponseBody()
    public ModelAndView recuperarArticulos(HttpSession session, String fechadesde, String fechahasta) throws ParseException {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
        if (usuarioLogueado == null || usuarioLogueado.getTipoUsuario() != TipoUsuarioEnum.contador) {
            ModelAndView MV = new ModelAndView();
            String error = "No posee permisos para ver esta página, loguearse nuevamente";
            MV.addObject("error", error);
            MV.setViewName("login2");
            return MV;
        }

        ModelAndView MV = new ModelAndView("listarReportes");
        //TODO make validations!
        ArrayList<Venta> arr = ventaServicio.obtenerVentasPorFecha(fechadesde, fechahasta);

        ArrayList<Cliente> clientes = clienteServicio.obtenerClientes();

        if (arr.isEmpty()) {
            MV.addObject("data-empty-message", "No existen ventas en la BD");
        }

        MV.addObject("ventas", arr);
        MV.addObject("clientes", clientes);

        return MV;
    }

}
