package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.*;

import java.util.ArrayList;

public interface IVentaDao {
    String insertarVenta(Venta venta);

    ArrayList<Venta> obtenerVentas();

    String eliminarVenta(Long Id);

    void insertarDetalleVenta(DetalleVenta dventa);

    Venta obtenerVenta(Long ventaId);

    ArrayList<DetalleVenta> obtenerDetallesVenta(Long id);
}
