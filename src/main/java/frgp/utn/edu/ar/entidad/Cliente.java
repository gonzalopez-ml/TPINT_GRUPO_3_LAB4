package frgp.utn.edu.ar.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="Cliente")
public class Cliente implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Id")
    private Long id;

    @Column(name="Dni")
    private String DNI;

    @Column(name="Nombre")
    private String nombre;

    @Column(name="Apellido")
    private String apellido;

    @Column(name="Sexo")
    private char sexo;

    @Column(name="FechaNacimiento")
    private Date fechaNacimiento;

    @Column(name="Direccion")
    private String direccion;

    @Column(name="Localidad")
    private String localidad;

    @Column(name="CorreoElectronico")
    private String correoElectronico;

    @Column(name="Telefono")
    private String telefono;

    public Long getId() {

        return id;
    }

    public String getDNI() {

        return DNI;
    }

    public void setDNI(String DNI) {

        this.DNI = DNI;
    }

    public String getNombre() {

        return nombre;
    }

    public void setNombre(String nombre) {

        this.nombre = nombre;
    }

    public String getApellido() {

        return apellido;
    }

    public void setApellido(String apellido) {

        this.apellido = apellido;
    }

    public char getSexo() {

        return sexo;
    }

    public void setSexo(char sexo) {

        this.sexo = sexo;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {

        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDireccion() {

        return direccion;
    }

    public void setDireccion(String direccion) {

        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {

        this.localidad = localidad;
    }

    public String getCorreoElectronico() {

        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {

        this.correoElectronico = correoElectronico;
    }

    public String getTelefono() {

        return telefono;
    }

    public void setTelefono(String telefono) {

        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "id='" + id + '\'' +
                ", DNI='" + DNI + '\'' +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", sexo=" + sexo +
                ", fechaNacimiento=" + fechaNacimiento +
                ", direccion='" + direccion + '\'' +
                ", localidad='" + localidad + '\'' +
                ", correoElectronico='" + correoElectronico + '\'' +
                ", telefono='" + telefono + '\'' +
                '}';
    }
}