package frgp.utn.edu.ar.resources;


import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import org.springframework.context.annotation.Bean;

public class Config {


    //Beans articulos
    @Bean
    public Articulo articulo() {
        Articulo articulo = new Articulo();
        return articulo;
    }

    //Beans stock
    @Bean
    public Stock stock() {
        Stock stock = new Stock();
        return stock;
    }

    //Beans tipo articulo
    @Bean
    public TipoArticulo tipoArticulo() {
        TipoArticulo tipoArticulo = new TipoArticulo();
        return tipoArticulo;
    }

    //Beans marca
    @Bean
    public Marca marca() {
        Marca marca = new Marca();
        return marca;
    }

}