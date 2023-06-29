package frgp.utn.edu.ar.resources;


import frgp.utn.edu.ar.entidad.*;
import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
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

    //Beans Usuario
    @Bean
    @Scope("prototype")
    public Usuario usuario() {
        return new Usuario();
    }


    //Beans Venta
    @Bean
    @Scope("prototype")
    public Venta venta() {
        return new Venta();
    }

    //Beans DetalleVenta
    @Bean
    @Scope("prototype")
    public DetalleVenta detalleVenta() {
        return new DetalleVenta();
    }


    //Beans cliente
    @Bean
    @Scope("prototype")
    public Cliente cliente() {
        return new Cliente();
    }
}