package frgp.utn.edu.ar.entidad;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="Marca")
public class Marca implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Id")
    private Long id;

    @Column(name="Marca")
    private String marca;

    //Constructor vacio
    public Marca()
    {

    }

    public Long getId() {
        return id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    @Override
    public String toString() {
        return "Marca{" +
                "id=" + id +
                ", marca='" + marca + '\'' +
                '}';
    }
}

