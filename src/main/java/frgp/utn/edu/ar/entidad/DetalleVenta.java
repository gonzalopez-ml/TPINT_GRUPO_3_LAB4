package frgp.utn.edu.ar.entidad;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Component
@Entity
@Table(name = "DetalleVenta")
public class DetalleVenta implements Serializable {

    private static final long serialVersionUID = 1L;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "IdArticulo")
    private Articulo IdArticulo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdVenta")
    private Venta venta;

    @Column(name = "PrecioVenta")
    private double precioVenta;

    @Column(name = "Cantidad")
    private int cantidad;

    @Column(name = "Importe")
    private double importe;

    public DetalleVenta(){

    }


    public Long getId() {
        return id;
    }

    public Articulo getIdArticulo() {
        return IdArticulo;
    }

    public void setIdArticulo(Articulo idArticulo) {
        IdArticulo = idArticulo;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    @Override
    public String toString() {
        return "DetalleVenta{" +
                "id=" + id +
                ", IdArticulo=" + IdArticulo +
                ", venta=" + venta +
                ", precioVenta=" + precioVenta +
                ", cantidad=" + cantidad +
                ", importe=" + importe +
                '}';
    }
}