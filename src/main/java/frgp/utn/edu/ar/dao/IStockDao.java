package frgp.utn.edu.ar.dao;

import frgp.utn.edu.ar.entidad.Stock;

import java.util.ArrayList;

public interface IStockDao {
    String insertarStock(Stock stock);
    ArrayList<Stock> obtenerStock();
    Stock obtenerStockPorId(Long id);
    // Otros métodos para consultas y actualizaciones específicas
}






