package frgp.utn.edu.ar.entidad;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="TipoArticulo")
public class TipoArticulo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Id")
    private Long id;

    @Column(name="NombreTipo")
    private String nombreTipo;

    //Constructor vacio
    public TipoArticulo()
    {

    }

    public Long getId() {
        return id;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    @Override
    public String toString() {
        return "TipoArticulo{" +
                "id='" + id + '\'' +
                ", nombreTipo='" + nombreTipo + '\'' +
                '}';
    }
}

