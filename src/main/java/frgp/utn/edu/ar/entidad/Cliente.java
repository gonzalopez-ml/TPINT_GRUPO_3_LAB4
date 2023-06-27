package frgp.utn.edu.ar.entidad;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Component
@Entity
@Table(name="Cliente")
public class Cliente implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Id")
    private Long id;

    @Column(name="Dni")
    private String dni;

    @Column(name="Nombre")
    private String nombre;

    @Column(name="Apellido")
    private String apellido;

    @Column(name="Sexo")
    private char sexo;

    @Temporal(TemporalType.TIMESTAMP)	
    @Column(name="FechaNacimiento")
    private Date fechanacimiento;

    @Column(name="Direccion")
    private String direccion;

    @Column(name="Localidad")
    private String localidad;

    @Column(name="CorreoElectronico")
    private String correoElectronico;

    @Column(name="Telefono")
    private String telefono;
    
    @Column(name="Estado")
    private int estado;

    public Long getId() {

        return id;
    }

    
    public void setId(Long id) {
		// TODO Auto-generated method stub
		this.id = id;
	}
    
    public String getDni() {

        return dni;
    }

    public void setDni(String dni) {

        this.dni = dni;
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

    public Date getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(Date fechanacimiento) {

        this.fechanacimiento = fechanacimiento;
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
    
    public int getEstado() {
        return this.estado;
    }

    public int isEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	@Override
    public String toString() {
        return "Cliente{" +
                "id='" + id + '\'' +
                ", DNI='" + dni + '\'' +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", sexo=" + sexo +
                ", fechaNacimiento=" + fechanacimiento +
                ", direccion='" + direccion + '\'' +
                ", localidad='" + localidad + '\'' +
                ", correoElectronico='" + correoElectronico + '\'' +
                ", telefono='" + telefono + '\'' +
                '}';
    }

	
}