package frgp.utn.edu.ar.entidad;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Component
@Entity
@Table(name = "Stock")
public class Stock implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long id;

    @Column(name = "FechaIngreso")
    private Date fechaIngreso;

    @ManyToOne
    @JoinColumn(name = "IdArticulo")
    private Articulo articulo;

    @Column(name = "Cantidad")
    private int cantidad;

    @Column(name = "PrecioCompra")
    private double precioCompra;

    public Stock(){

    }

    public Long getId() {
        return id;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Articulo getArticulo() {
        return articulo;
    }

    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "id=" + id +
                ", fechaIngreso=" + fechaIngreso +
                ", articulo=" + articulo +
                ", cantidad=" + cantidad +
                ", precioCompra=" + precioCompra +
                '}';
    }
}