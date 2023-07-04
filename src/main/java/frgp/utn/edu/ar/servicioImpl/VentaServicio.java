package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IVentaDao;
import frgp.utn.edu.ar.entidad.DetalleVenta;
import frgp.utn.edu.ar.entidad.Venta;
import frgp.utn.edu.ar.servicio.IVentaServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Service("ventaServicio")
public class VentaServicio implements IVentaServicio {

    @Autowired
    private IVentaDao ventaDAO;
    @Override
    public String insertarVenta(Venta venta) {
        ventaDAO.insertarVenta(venta);
        for (DetalleVenta detalle : venta.getDetalles()) {
            detalle.setVenta(venta);
            ventaDAO.insertarDetalleVenta(detalle);
        }
        return "La venta se ha insertado correctamente.";
    }

    @Override
    public ArrayList<Venta> obtenerVentas() {
        return ventaDAO.obtenerVentas();
    }

    @Override
    public ArrayList<Venta> obtenerVentasPorFecha(String fecha1, String fecha2) throws ParseException {
        return ventaDAO.obtenerVentasPorFecha(fecha1, fecha2);
    }

    @Override
    public Venta obtenerVenta(Long idventa){return ventaDAO.obtenerVenta(idventa);}

    @Override
    public List<DetalleVenta> obtenerDetallesVenta(Long ventaId) {
        return ventaDAO.obtenerDetallesVenta(ventaId);
    }

    @Override
    public String eliminarVenta(Long id) {
        Venta venta = ventaDAO.obtenerVenta(id);
        if (venta != null) {
            ventaDAO.eliminarVenta(id);
            return "La venta se ha eliminado correctamente.";
        } else {
            return "No se encontró la venta con el ID proporcionado.";
        }
    }

    @Override
    public void insertarDetalleVenta(DetalleVenta dventa) {
        ventaDAO.insertarDetalleVenta(dventa);
    }
}
