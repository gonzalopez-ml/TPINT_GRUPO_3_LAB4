package frgp.utn.edu.ar.resources;


import frgp.utn.edu.ar.entidad.Articulo;
import frgp.utn.edu.ar.entidad.Marca;
import frgp.utn.edu.ar.entidad.Stock;
import frgp.utn.edu.ar.entidad.TipoArticulo;
import frgp.utn.edu.ar.servicioImpl.ArticuloServicio;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
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


    //Beans servicios
    //Beans articulo servicio
    @Bean
    public ArticuloServicio articuloServicio() {
        ArticuloServicio articuloServicio = new ArticuloServicio();
        return articuloServicio;
    }

}