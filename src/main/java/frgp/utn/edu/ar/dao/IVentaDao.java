package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.*;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public interface IVentaDao {
    String insertarVenta(Venta venta);

    ArrayList<Venta> obtenerVentas();

    ArrayList<Venta> obtenerVentasPorFecha(String fecha1, String fecha2) throws ParseException;

    String eliminarVenta(Long Id);

    void insertarDetalleVenta(DetalleVenta dventa);

    Venta obtenerVenta(Long ventaId);

    List<DetalleVenta> obtenerDetallesVenta(Long id);

    //boolean restarCantidadStock(Articulo articulo, int cantidad);

    Long ObtenerUltimaVenta();
}
