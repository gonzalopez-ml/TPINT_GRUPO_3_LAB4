package frgp.utn.edu.ar.exceptions;

public class DaoException extends RuntimeException {
    private String mensaje;

    public DaoException(String message) {
        super(message);
        this.mensaje = message;
    }

    public String getMensaje() {
        return mensaje;
    }
}