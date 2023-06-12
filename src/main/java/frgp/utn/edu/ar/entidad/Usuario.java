package frgp.utn.edu.ar.entidad;


import frgp.utn.edu.ar.enums.TipoUsuario;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="Usuario")
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Id")
    private Long id;

    @Column(name="NombreUsuario")
    private String nombreUsuario;
    @Column(name="Contrasenia")
    private String contrasenia;

    @Enumerated(EnumType.STRING)
    @Column(name = "TipoUsuario")
    private TipoUsuario TipoUsuario;

    //Constructor vacio
    public Usuario()
    {

    }

    public Long getId() {
        return id;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public TipoUsuario getTipoUsuario() {
        return TipoUsuario;
    }

    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        TipoUsuario = tipoUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id='" + id + '\'' +
                ", nombreUsuario='" + nombreUsuario + '\'' +
                ", contrasenia='" + contrasenia + '\'' +
                ", TipoUsuario=" + TipoUsuario +
                '}';
    }

    /*
    public void initUsuario() {
        System.out.println("Se inicializa bean usuario");
    }

    public void destroyUsuario() {
        System.out.println("Se cierra bean usuario");
    }
*/
}

