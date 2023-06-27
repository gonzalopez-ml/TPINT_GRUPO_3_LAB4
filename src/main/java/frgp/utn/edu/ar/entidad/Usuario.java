package frgp.utn.edu.ar.entidad;



import javax.persistence.*;

import frgp.utn.edu.ar.enums.TipoUsuarioEnum;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
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
    private TipoUsuarioEnum TipoUsuario;

    @Column(name = "estado")
    private Boolean estado;

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

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

    public TipoUsuarioEnum getTipoUsuario() {
        return TipoUsuario;
    }

    public void setTipoUsuario(TipoUsuarioEnum tipoUsuario) {
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
