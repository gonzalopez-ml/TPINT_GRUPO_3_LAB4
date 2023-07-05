package frgp.utn.edu.ar.servicioImpl;

import frgp.utn.edu.ar.dao.IStockDao;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.servicio.IStockServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("stockServicio")
public class StockServicio implements IStockServicio {

    @Autowired
    private IStockDao stockDao;

    @Override
    public String insertarStock(Stock stock) {
        return stockDao.insertarStock(stock);
    }
    
    @Override
    public ArrayList<Stock> obtenerStock() {
        return stockDao.obtenerStock();
    }

   

    // Otros métodos para la lógica de negocio relacionada con el stock
}
     

    
