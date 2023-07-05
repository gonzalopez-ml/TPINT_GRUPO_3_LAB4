package frgp.utn.edu.ar.servicio;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Stock;

import java.util.ArrayList;

public interface IStockServicio {
    String insertarStock(Stock stock);
   
    ArrayList<Stock> obtenerStock();
   
}


