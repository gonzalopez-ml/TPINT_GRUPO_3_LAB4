package frgp.utn.edu.ar.entidad;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@Entity
@Table(name = "Venta")
public class Venta implements Serializable {

    private static final long serialVersionUID = 1L;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long id;

    @Column(name = "FechaVenta")
    private Date fechaVenta;

    @ManyToOne
    @JoinColumn(name = "IdCliente")
    private Cliente idCliente;

    @Column(name = "MontoTotal")
    private double montoTotal;

    @Column(name = "EstadoVenta")
    private boolean estadoVenta;

    @OneToMany(mappedBy = "venta", cascade = CascadeType.ALL)
    private List<DetalleVenta> detalles;

    public Venta() {

    }

    public Long getId() {
        return id;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public boolean getEstadoVenta() {
        return estadoVenta;
    }

    public void setEstadoVenta(boolean estadoVenta) {
        this.estadoVenta = estadoVenta;
    }

    public List<DetalleVenta> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<DetalleVenta> detalles) {
        this.detalles = detalles;
    }

    @Override
    public String toString() {
        return "Venta{" +
                "id=" + id +
                ", fechaVenta=" + fechaVenta +
                ", idCliente=" + idCliente +
                ", montoTotal=" + montoTotal +
                ", estadoVenta=" + estadoVenta +
                '}';
    }
}
