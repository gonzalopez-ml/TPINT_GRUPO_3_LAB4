package frgp.utn.edu.ar.resources;


import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;

public class Config {


    //Beans articulos
    @Bean
    @Scope("prototype")
    public Articulo articulo() {
        Articulo articulo = new Articulo();
        return articulo;
    }

    //Beans stock
    @Bean
    @Scope("prototype")
    public Stock stock() {
        Stock stock = new Stock();
        return stock;
    }

    //Beans tipo articulo
    @Bean
    @Scope("prototype")
    public TipoArticulo tipoArticulo() {
        TipoArticulo tipoArticulo = new TipoArticulo();
        return tipoArticulo;
    }

    //Beans marca
    @Bean
    @Scope("prototype")
    public Marca marca() {
        Marca marca = new Marca();
        return marca;
    }

}