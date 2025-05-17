package modelo;

public class UsuarioModel {
	private int idUsuario;    
    private int estado;        
    private int idPersona;    
    private int idRol;        
    private String nombre;    
    public UsuarioModel () {
    	
    }
    // Constructor
    public UsuarioModel(int idUsuario, int estado, int idPersona, int idRol, String nombre) {
        this.idUsuario = idUsuario;
        this.estado = estado;
        this.idPersona = idPersona;
        this.idRol = idRol;
        this.nombre = nombre;
    }

    // Getters y Setters
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }



    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
