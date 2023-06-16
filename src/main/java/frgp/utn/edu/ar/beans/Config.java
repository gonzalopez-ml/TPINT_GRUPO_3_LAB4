package frgp.utn.edu.ar.beans;

import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;

public class Config {

    //Beans articulos
    @Bean
    @Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public Articulo articulo() {
        Articulo articulo = new Articulo();
        return articulo;
    }

    //Beans stock
    @Bean
    @Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public Stock stock() {
        Stock stock = new Stock();
        return stock;
    }

    //Beans tipo articulo
    @Bean
    @Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public TipoArticulo tipoArticulo() {
        TipoArticulo tipoArticulo = new TipoArticulo();
        return tipoArticulo;
    }

    //Beans marca
    @Bean
    @Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public Marca marca() {
        Marca marca = new Marca();
        return marca;
    }


    //Beans servicios
    //Beans articulo servicio
    @Bean
    @Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public ArticuloServicio articuloServicio() {
        ArticuloServicio articuloServicio = new ArticuloServicio();
        return articuloServicio;
    }

}
