package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.DetalleVenta;
import frgp.utn.edu.ar.entidad.Venta;

import java.util.ArrayList;
import java.util.List;

public interface IVentaServicio {

    String insertarVenta(Venta venta);

    ArrayList<Venta> obtenerVentas();

    String eliminarVenta(Long id);

    void insertarDetalleVenta(DetalleVenta dventa);

    Venta obtenerVenta(Long idventa);

    List<DetalleVenta> obtenerDetallesVenta(Long ventaId);
}
